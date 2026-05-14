# Analytics & Tracking

<aside>
📜

> **Superseded — preserved for reference.** This is the original Apr 17 version of the Analytics & Tracking proposal. The current version lives on the parent page and incorporates findings from prod review, Glass codebase review, and Steve's Apr 26 Slack feedback. PostHog evaluation, replay-driven decision framing, and reverse-ETL plan in this version were all revised.
> 
</aside>

# What we found (verified on prod)

Measured on `rocket-resume.com` homepage:

- Total JS transferred: **2.63 MB** across 113 scripts
- Mixpanel chunk: **112 KB (4.3% of JS)**, already async-loaded via `requestIdleCallback`, not render-blocking
- Real bundle hog: `_app-*.js` at **843 KB (32%)**, GraphQL ops, auth, util bundled into every page entry
- FCP 1156ms, Load 3590ms

So "Mixpanel = 90% of bundle" isn't what we see in prod. Perf impact from Mixpanel today is moderate, mostly main-thread parse + session replay CPU, not load time.

Heatmaps and replay can contribute to runtime CPU (continuous DOM mutation capture + event listeners), but the existing setup already handles the load-time side well: the SDK is lazy-imported via a webpack chunk and gated behind `requestIdleCallback`. Credit where due, that work is already done.

The architectural point stands independently of perf:

**Six vendor domains fire directly from client** - Mixpanel, googletagmanager, googleadservices, doubleclick, [analytics.google](http://analytics.google), Sentry. Each: own SDK blob, own DNS/TLS handshake, own ad-blocker footprint, own schema. Consolidating behind one first-party endpoint (`track.rocket-resume.com`) gives us:

- Fewer blockers (first-party = rarely blocked)
- Unified schema
- Vendor swap without client change
- Central PII/auth filtering

# Target architecture for the new stack

```
client -> track.rocket-resume.com/ingest (Cloudflare Worker)
                |
                v
         Cloudflare Queue
                |
   +------------+------------+----------------+
   v            v            v                v
Mixpanel    Google Ads     GA4           Warehouse
  HTTP      Conversion   Measurement    (TBD, see options)
  API          API        Protocol
                |
                v
      reverse-ETL back to SaaS if needed
```

Benefits:

- Tiny client SDK (~2-5 KB wrapper, no vendor lib on critical path)
- First-party domain, bypasses most ad blockers
- Central schema = safer PII handling + stable contract as vendors change
- Feeds content-scoring loop for search ranking (clicks/skips/purchases -> score table)

**Tradeoff: session replay + heatmap need DOM access.** Can't be server-proxied. Options to reduce main-thread impact:

- Keep vendor SDK on main thread (current setup, already deferred via `requestIdleCallback`)
- Wrap vendor SDK in a Web Worker via Partytown: proxies DOM calls to the worker, main thread stays responsive. Works with Mixpanel/PostHog/GTM out of the box. Tradeoff: some SDK features misbehave, replay coverage may lose fidelity
- Custom Web Worker wrapper: batch + debounce, more risk

If first release doesn't need replay or heatmap, this choice can be deferred.

# Why heatmaps and replays drive the decision

Need replay + heatmap on day one -> hybrid: CF Worker endpoint for event stream + vendor SDK stays on client for replay. Double the code paths.

Defer replay + heatmap -> pure first-party endpoint, zero vendor SDK on client. Re-add later by attaching SDK to pages that need it.

# Potential phases

## Phase 0 - Cloudflare infra verification (About, Legal, Support)

Goal: prove the new CF + Payload + OpenNext stack on low-traffic, low-risk pages. No analytics rework. Mimic current analytics behavior 1:1 on new pages.

- Ship About / Legal / Support on new stack, content migrated from current site
- Analytics on these pages: **port existing client-side setup as-is**. Full current stack re-attached on new pages: Mixpanel (lazy + `requestIdleCallback`), GTM, GA4, Google Ads pixels, Sentry client, session replay + heatmap if on today. Event schema and vendor domains unchanged.
- Shared cookies on `rocket-resume.com` = session/device/UTM continuity across old <-> new pages
- Old stack untouched for all other routes
- CF Worker reverse proxy routes these three URL groups to new app, rest stays on Vercel

Decisions made in this phase: none on analytics. Tracking rewrite starts Phase 1.

## Phase 1 - First-party ingest endpoint

**Decision points** at phase kickoff:

- Pick warehouse
- Pick whether CF Analytics Engine gets added as real-time tier
- Confirm ingest architecture (CF Worker + Queue default)
- Pick whether to add PostHog evaluation on a side track or defer to Phase 4

Work:

- Build `track.rocket-resume.com/ingest` CF Worker + Queue
- Swap Phase 0 server-side vendor calls to route through own endpoint
- Endpoint fans out to: Mixpanel HTTP API, Google Ads Conversion API, selected warehouse
- Still only new pages, still minimal event set (page_view + auth + cta_click)

Output: own ingest infra live, warehouse receiving events, vendor dashboards unaffected.

## Phase 2 - Event parity + higher-traffic pages

**Decision points:**

- Replay + heatmap needed now? Drives re-attach of vendor SDK on client or Partytown wrap
- Keep client fully server-originated or add lightweight client event layer

Work:

- Cover all 23 existing event types through ingest endpoint
- Migrate more pages onto new app
- Dual-write: new pages via ingest, old pages still direct, both flow into Mixpanel dashboards

Output: feature parity, old dashboards intact, warehouse has full stream from everything on new app.

## Phase 3 - Full cutover

- All pages on new app
- Remove direct-to-vendor client paths
- Reverse-ETL warehouse -> Mixpanel (Mixpanel UX preserved, warehouse = source of truth)
- Content-scoring loop: warehouse materialized views feed search ranking

Rollback plan: dual-write for 1-2 weeks before cutover, reconcile event counts, only remove old path when parity confirmed.

## Phase 4 - Stack consolidation (optional)

**Decision point:** evaluate PostHog replacement.

- Trial PostHog alongside Mixpanel for 4-6 weeks
- If team prefers, sunset Mixpanel, gain feature flags + experiments + built-in warehouse
- If blockers (contract, feature gaps, dashboard preference), keep Mixpanel

# Ads attribution won't regress

Google Ads conversion tracking functional at every phase:

- Phase 0+: fire Google Ads Conversion API server-side with click IDs (gclid, gbraid, wbraid) captured client-side. Zero drop.
- Cutover rollback: dual-write window catches mismatches before full switch.

# PostHog vs Mixpanel

| Capability | Mixpanel | PostHog |
| --- | --- | --- |
| Session replay | Yes. Free: 10K/mo. Growth: 20K/mo included, customizable up to 500K | Yes. Free: 5K/mo. Paid: $0.005/recording web, $0.010/recording mobile (5-15K tier, discounts above) |
| A/B experiments | No | Yes, native. Billed with feature flags |
| Product surveys | No | Yes, included |
| Dedicated web analytics module | No | Yes (separate from product analytics) |
| LLM observability | No | Yes |
| CDP / outbound destinations | Limited (paid integrations) | Native, hundreds of destinations |
| Mobile SDKs | Yes (iOS, Android, RN, Flutter) | Yes (iOS, Android, RN, Flutter) |
| Free tier | 1M events, 10K replays, 5 saved reports | 1M events, 5K replays, 1M flag requests, 1M warehouse rows |
| Client SDK gzipped | ~40-112 KB depending on features enabled | ~55-70 KB full, ~5 KB lite (no autocapture/replay) |
| Regions | US, EU | US (Virginia), EU (Frankfurt) |

Short version: PostHog is a superset for product-analytics use cases + rolls warehouse + feature flags + experiments + surveys + error tracking into one box. Mixpanel's dashboards are slightly more polished and better known. For likely future (wants experiments, flags, warehouse), PostHog collapses 3-4 tools.

Potential costs at scale ~100K events/day = ~3M events/mo:

- Mixpanel Growth: 2M × $0.28/1K = **~$560/mo** for events alone, before replay or seats
- PostHog: 2M × $0.0000343 = **~$69/mo** for events, replay extra. Much cheaper at our volume.

**Self-hosting PostHog:** needs Postgres + ClickHouse + Kafka + Redis + object storage. Hobby Docker Compose not prod. Helm chart on k8s is 1-3 days setup, ~$200-800/mo infra. Not worth it at <10M events/day. PostHog Cloud wins on cost of engineering time unless compliance forces data residency.

# Warehouse options

**Ruled out:** AWS Athena / Timestream (breaks CF-native preference without compensating benefit). DuckDB+R2 (batch-only, no real-time).

* Comparison at scale ~3M events/mo, ~50 GB storage

| Option | Pricing model | Cost at our scale | Best for | Watch out |
| --- | --- | --- | --- | --- |
| **ClickHouse Cloud Basic** | Compute per-minute + storage + transfer. From $66.52/mo (8 GiB RAM, 2 vCPU, 500 GB) | ~$70-100/mo | Full SQL, ad-hoc analysis, materialized views | Schema/partitioning decisions on you. Need read-path API layer |
| **Tinybird Developer** | Compute + $0.058/GB storage + egress. $25-49/mo (0.5 vCPU, 15 QPS, 25 GB) | ~$50-80/mo | Shipping analytics-backed APIs fast. Materialized views + pipes first-class | Smaller vendor. QPS-based surprises on spikes |
| **BigQuery** | $6.25/TB scanned + $0.02/GB storage. Free: 1 TB queries/mo + 10 GB | ~$10-30/mo (if under free tier) | Cheapest at low volume. First-class Google Ads + GA4 integration | Not CF-native. Per-query pricing bites on interactive dashboards |
| **CF Workers Analytics Engine** | 10M writes + 1M reads/mo included on Workers Paid. Overage $0.25/M writes, $1/M reads | $0 (within included) | Real-time aggregates, CF-native, zero ops. Writes effectively free at our volume | SQL subset only. Cardinality limits on high-cardinality IDs. ~90-day retention. No joins |
| **PostHog Cloud** | Per-metric. Events, replay, flags, warehouse each separate line | ~$70-200/mo | All-in-one: analytics + warehouse + flags + experiments | Locks warehouse to PostHog's ClickHouse. Less flexible than raw ClickHouse |

## Current lean (to challenge, not decide)

- **Primary warehouse:** ClickHouse Cloud Basic or Tinybird Developer. Tinybird if we want fastest dev velocity. ClickHouse if we want maximum flexibility.
- **Real-time aggregate tier:** CF Workers Analytics Engine alongside primary. For content-scoring reads + search ranking inputs. CF-native, effectively free at our volume.
- **BigQuery:** backup if Google Ads server-side imports get painful elsewhere. Not primary.
- **PostHog:** Phase 4 evaluation. Cost analysis shows cheaper than Mixpanel at our volume, and the stack consolidation is a real win if product wants experiments.

# Open questions

1. Heatmaps + session replay: who uses them today, for what? Can first release skip? Level-up effort later shapes Phase 2 plan.
2. Mixpanel vendor lock-in: contract term or minimum commit affecting migration timing?
3. Feature flags / experiments near-term need. If yes, PostHog collapses the stack.
4. GDPR / data residency: warehouse in EU region required? Affects PostHog region, ClickHouse region, rules out BigQuery-US.