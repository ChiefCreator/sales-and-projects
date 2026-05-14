# Search

Status: Review
Summary: Reverse-engineer current search behaviour in the glass repo. Decide embedding model (OpenAI vs Cloudflare bge-small). Design search UX. Wire the Score model for ranking.

# TOC

# 1. Context

The product needs two distinct search experiences:

1. **Free-text search** — user types, gets ranked results across job titles, industries, and resume content. The bar is that the response feels instant on every keystroke.
2. **Builder suggestions** — given a selected job title, surface ranked skills / experience / summary content. Tracked separately and not covered here.

The header search is hidden in Phase 0 (the temporary minimal header has no search trigger). The endpoint and indexing pipeline are live and benchmarked, but not exposed in the UI yet. This document covers the current state, what was tried, what to try next, and what to verify about the test harness — so the work can move forward independently of Phase 0.

## Goal

Search should feel instantaneous to a typing user: the visible result list updates well under one second on a typical request, and stays under two seconds in the worst case. Cold sessions and rare queries currently tail past that budget.

There is also a UX problem that raw latency numbers do not capture. The two retrieval signals (trigram and embedding) return at different times, and the visible result list **shifts** when the embedding response lands. Users see one ranked list, then a different ranked list a moment later. Even when both are fast, this is jarring. The bar should be: one set of results, presented once.

# 2. Legacy stack — what production does today

Free-text category search runs through a single Prisma resolver against the legacy `Category` table. The signal is fuzzy + lexical only; there is nothing semantic on the read path.

Mechanically: Postgres full-text search returns a candidate pool, then **Fuse.js** re-ranks it inside the resolver. Several algorithm variants exist behind a feature flag because performance has historically been unpredictable across query shapes — the variants exist precisely because no single approach was reliable.

Two gaps the new stack needs to close:

- Typos, synonyms, and paraphrased queries are only handled to the extent Fuse.js distance heuristics catch them.
- A `Score` model with engagement-style fields (interest, experience, probability, usage) exists in the schema but is not read anywhere. No engagement-based ranking is applied today.

# 3. New stack — initial version

First production-shaped version. Two retrieval signals merged into one ranked list.

- **Index**: search entries populated via direct SQL into Payload's search plugin tables (~254K entries). Each entry carries an enriched text blob — job titles include their industry, resume content includes its type and description.
- **Trigram retrieval**: Postgres trigram similarity against the entry title, with a minimum-score gate.
- **Vector retrieval**: ~254K embeddings via **OpenAI `text-embedding-3-small`** (512 dimensions), stored in pgvector. The query embedding was generated server-side per request, then matched by cosine distance.
- **Hybrid scoring**: 40% trigram + 40% vector + 20% collection priority (job titles > industries > resume content).

Issues observed at this stage:

- Cold-start latency on the embedding step. The first request after idle could pay several seconds for the OpenAI call.
- Per-token cost made query-time embeddings expensive at typing rates.
- Trigram and vector ran serially, so total latency was the sum of both legs plus the merge.

No production-grade perf harness existed at this stage, so no clean baseline numbers were captured for this version.

# 4. New stack — current version

Second iteration. Same hybrid shape, but every layer was reworked once a perf harness was in place.

- **Embedding model swap**: from OpenAI to **Cloudflare Workers AI `bge-small-en-v1.5`** (384 dimensions). It runs on the same edge runtime that serves the request — no external HTTP hop, and per-token cost is roughly two orders of magnitude lower.
- **Trigram retrieval**: switched to a top-N retrieval pattern that lets Postgres lean on the trigram index instead of scoring every row.
- **Query embedding cache**: query embeddings are cached in **Cloudflare KV**, keyed by locale and query, with a long TTL. Hot queries skip the embedding step entirely.
- **Direct database connection**: the search route bypasses Payload and goes straight to Postgres, which removes a layer of overhead the search query does not need.
- **Parallel retrievals**: trigram and vector run concurrently. The vector branch awaits its (cached) embedding inside that branch, so the trigram branch is never blocked by a cache miss.
- **Client side**: debounced typing, plus a progressive UI that renders trigram results as soon as they arrive and replaces them with the merged hybrid set when vector lands. (This is the source of the "result list shifts" UX issue called out in the Goal section.)

What this iteration deliberately did not change: the 40 / 40 / 20 merge weights, the indexed text content, and the collection priority list.

# 5. Performance results

Measured with a Playwright harness against the deployed worker (live data, real network). Ten query labels covering short / prefix / medium / phrase / typo / rare / semantic / no-match shapes; two warm-up plus ten measured iterations per label, seeded shuffle interleaved across labels.

## Overall keystroke → response latency (p50 / p95, ms)

| Stage | Trig p50 | Trig p95 | Vec p50 | Vec p95 |
| --- | --- | --- | --- | --- |
| Baseline (post model swap, before runtime work) | 1453 | 1887 | 3815 | 4505 |
| After debounce / direct DB / direct AI binding | 1174 | 1736 | 2424 | 2918 |
| After Server-Timing instrumentation (run-to-run noise) | 1733 | 2515 | 3422 | 4213 |
| After parallel trigram / vector (partial run) | 1559 | 2010 | 1607 | 2018 |
| After KV cache for query embeddings (preview deploy) | 1577 | 1952 | 1706 | 2403 |
| **Current — KV cache deployed live** | **1207** | **1565** | **1307** | **1698** |

Vector p50 dropped from 3815ms → 1307ms (−66%). Trigram p50 dropped from 1453ms → 1207ms (−17%). Vector latency, which used to dominate, now lands within ~100ms of trigram at p50.

## Server-side timing (current state, ms)

| Phase | Trig p50 | Trig p95 | Vec p50 | Vec p95 |
| --- | --- | --- | --- | --- |
| db init | 0 | 0 | 0 | 0 |
| embed | — | — | 8 | 840 |
| db query | 25 | 774 | 11 | 48 |
| **server total** | **25** | **774** | **26** | **874** |

Server total is around 25ms median for both modes. The remaining ~1.2 seconds of client-measured latency is network round-trip, worker cold-start, and browser parse / paint. The p95 tail is split between embedding cache misses (~840ms) and trigram database tails on rare queries (~770ms).

The takeaway for the next iteration: the database and the embedding step are no longer the bottleneck at p50. Further wins come from edge caching, reducing cold-start exposure, and trimming p95 tails — not from removing a retrieval signal.

# 6. Experiments to try next

**Premise.** Embeddings are the main retrieval signal and should stay. Trigram is the candidate to consider dropping — but only once embeddings are reliably fast enough on their own. The biggest open UX issue (the visible reorder when the second response lands) is best fixed by collapsing to one signal at the right moment, not by running two pipelines in parallel forever.

Each item below can run on its own Neon branch + preview deployment, with the existing perf harness as the regression gate. They are largely independent, but the order matters: caching and warm-up come before deciding what to drop.

- **Edge result cache.** Cache the full result list (not just the query embedding) for popular short queries at the edge, with a short TTL. On a hit, the worker can return without touching the database at all. This is the single biggest lever for "feels instant on every keystroke," and the experiment most likely to make embeddings-only viable. Trade-off: short TTLs are safe for typing latency but introduce staleness on index updates — invalidation has to be wired into the indexing pipeline if the TTL is anything but very short.
- **Worker and connection warm-up.** Cold worker invocations and cold connection pools dominate the p95 tail. Two angles to investigate: a low-rate scheduled ping that keeps the worker warm in the active region, or a small "open-search-modal" prefetch that opens a connection on intent (focus on the trigger button) instead of on the first keystroke.
- **Smaller or faster embedding model.** Try alternates against `bge-small` on the same data — for example `bge-base` (larger, possibly slower) or smaller MiniLM-class models if available on the runtime. The bar is a measurable quality improvement that justifies a re-embed of the full index.
- **HNSW index for pgvector.** The current setup leans on the default pgvector index strategy. HNSW would reduce p95 tails on the database side at the cost of build time and memory. At ~254K rows the gain may be marginal; worth measuring before committing.
- **Drop trigram once embeddings are reliably fast.** Once edge caching and warm-up bring embedding latency reliably below the current trigram latency, the rationale for keeping a second retrieval signal is mainly typo and exact-prefix coverage. At that point: eyeball quality on `typo-managment`, `prefix-acad`, and `rare-phlebotomy` against the full hybrid; if the gap is small, drop trigram. The reward is one ranking signal, one response, no visible reorder.
- **Re-tune the typing throttle.** The client currently debounces conservatively. Once edge result caching is in place, lowering the debounce makes typing snappier without runaway cost on the embedding side — the cost model of an extra request changes once cache hits are cheap.
- **Streaming responses.** Today the client gets one response per mode and merges them. Streaming the trigram set first and appending the vector additions in the same fetch would reduce perceived latency on cold sessions. Useful as a transitional fix while the items above land — and unnecessary once trigram is gone.
- **Wire up the `Score` model.** This is a ranking question, not a retrieval question. Once analytics events are flowing (see [Analytics & Tracking — Findings & Proposal](Analytics%20&%20Tracking%203509e5177cdd811fb415cded8c5c4b04.md)), engagement signals can boost specific results without retraining a model. Sequence: ship analytics first, then feed scores into the merge.

# 7. Test harness — review

A perf harness exists and produces stable, comparable numbers across runs (warm-up, seeded shuffle, p50 / p95 reporting). It is what made the optimization story above possible. Before treating it as the regression gate for the experiments above, the points below are worth a deliberate decision — not necessarily a rewrite, but an explicit answer either way.

## Coverage

Ten query labels is a reasonable starting set across short / prefix / medium / phrase / typo / rare / semantic / no-match. It is probably not enough to catch a quality regression on a model swap or on an embeddings-only experiment. All labels are English even though the index is locale-keyed. And the harness only ever sees a known set of queries — real users type things the harness has never seen, which makes the cache hit rate inside the harness artificially high after warm-up.

## What it actually measures

Latency only. The number of returned results is asserted (greater than zero, or zero for the no-match case), but result identity and rank are not. A regression that returns a wrong-but-non-empty list passes today. The harness also runs against the deployed worker, which mixes in upstream network variance — useful for an end-to-end picture, less useful for isolating a single code change.

## Statistical strength

Ten measured runs per label is enough to be directionally honest, not enough to claim small p95 effects with confidence. Warm-up of two iterations is the right choice for steady-state numbers, but it means the harness underreports cold-start cost — which is the worst real-user experience.

## Suggested follow-ups

Points to discuss, not changes to make right now:

- Add a relevance check: for each labelled query, assert that expected top results appear in the top-K. Even thirty or fifty hand-curated expectations would prevent silent quality regressions on model swaps.
- Add a cold-session mode: zero KV cache, fresh worker, single run per label. The gap between cold and warm is the real-user worst case.
- Add at least one non-English locale once content for a second locale exists.
- Decide whether the harness should also run against a fixed Neon branch with deterministic data, in addition to the deployed worker. Adds isolation, doubles the maintenance.

# 8. Open questions

1. **Embeddings-only vs hybrid** — to be decided on quality, not speed. Without a labelled relevance set, the decision will lean on eyeballing.
2. **Latency budget for cold sessions** — the current numbers are honest only for warm sessions. What is the target for the first request after worker cold-start, and is it acceptable to surface trigram-only results for that first request?
3. **Edge result cache TTL and invalidation** — short TTLs are safe for typing latency but introduce staleness on index updates. Confirm the indexing cadence before picking a TTL.
4. **Scope of the `Score` model** — wire into the search merge once analytics events flow, or defer until the larger legacy data import lands and ranking has a bigger pool to operate on.
5. **Search UX surface** — header autocomplete is the only surface on the table today. Dedicated search page, in-builder search, mobile-specific surface — out of scope here, but the latency budget changes if the surface changes.

<aside>
🧪

**Status**

The current hybrid + KV cache is the live baseline. Each experiment in section 6 should be run as its own Neon branch + preview deployment, gated by the harness in section 7.

</aside>