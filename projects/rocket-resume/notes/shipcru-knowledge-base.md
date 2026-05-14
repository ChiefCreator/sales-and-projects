# ShipCru — Project Knowledge Base

<aside>
💡

**Navigation:** This page is the **technical reference** — architecture, decisions, deep dives, phases scopes. 

</aside>

# Project Context

## What is Rocket Resume

Rocket Resume is a B2C resume builder platform with ~600 purchases/day. The long-term vision is a marketplace connecting employers and candidates, powered by a multi-tenant platform where partners get their own branded resume builder with minimal engineering lift. The B2B direction operates under the **ShipCru** brand; Rocket Resume becomes the first tenant of that platform.

## Engagement Scope

FocusReactive is the technical delivery partner building the new front-end architecture. Scope covers the CMS, marketing pages, multi-tenant infrastructure, and progressively more of the product over time (search, builder, AI features). Habitat is the design partner.

The engagement started with Denis building an MVP (landing pages + CMS architecture). Current active team: Denis + Eugene (tech leads) + Pavel (developer) + Anastasiya (PM). Drew is ShipCru's Head of Engineering and primary engineering POC. Yvonne (Ivan) and Gabriel are day-to-day technical contacts on ShipCru's side.

## Team & Contacts

**ShipCru / Rocket Resume:**

| Person | Role | Notes |
| --- | --- | --- |
| Steve | Founder | Drives architecture decisions. Drew is taking over as day-to-day engineering POC. |
| Tariq | CMO | Owns product/design decisions. Works with Habitat on design. SEO is a key priority. Optional on weekly calls. |
| Drew | Head of Engineering | Primary POC for engineering. Focus on product and AI. |
| Yvonne (Ivan) | Full-stack engineer | Long-time team member. Knows the codebase. Owns CockroachDB + BetterAuth migration on Rocket side. |
| Gabriel | Full-stack engineer | Auth specialist. Works alongside Yvonne on the database migration. Go-to person for BetterAuth integration. |

**FocusReactive:**

| Person | Role |
| --- | --- |
| Aleksei | VP of Operations & Client Success |
| Eugene | Technical lead |
| Denis | Technical lead |
| Pavel | Developer |
| Anastasiya | PM |

**Habitat:**

| Person | Role |
| --- | --- |
| Yuliia Sokolenko | PM |
| Anastasiia | Designer |
| Vlad | Designer |

# Glossary

**Taxonomy** — Rocket's internal system/dataset holding the full hierarchy of job titles, industries, skills, and content suggestions. GraphQL endpoint (public access). Contains both published and unpublished data. "New schema" with parent/child relationships and canonical/redirect logic. Confirmed as the same content as the production Prisma 1 database, just a different schema.

**Job Title** — The core data entity. ~60,000 job titles, each with ~60 associated text strings (skills, work experience suggestions, content recommendations). Each job title generates its own SEO landing page. One page component renders all ~80,000 pages dynamically based on URL.

**Industry** — Broad category grouping job titles (e.g. "Information Technology", "Healthcare"). Used for category landing pages and filtering. Old industries → new industries mapping exists; the plan is to import both, keep old ones unpublished, switch via CMS.

**Skills** — One of several content types attached to a job title. Others include work experience suggestions, content suggestions, etc. ~six types of text content per job title, not just skills.

**Suffixes / Variations** — Word combinations appended to job titles in the URL slug (e.g. "resume", "CV", "cover letter", "examples", "templates"). Each variation generates a separate page. Affects template variable resolution and section order. One canonical page per job title; others reference it.

**Tenant** — A brand/partner using the platform. Rocket Resume is tenant #1. Future tenants: niche brands owned by Rocket, then external recruiter partners. Each tenant has its own domain, theme, page configs. Tenants read from the global job title pool, restrictable by industry.

**ShipCru** — Company and product brand for the new multi-tenant platform. Rocket Resume becomes the first tenant. The codebase is the `shipcru` repo (see below).

**RocketResume** — Legacy company that owns `rocket-resume.com`, the existing production stack, and the RocketResume Cloudflare account.

**BetterAuth** — The authentication library being adopted. Yvonne and Gabriel own the CockroachDB + BetterAuth migration on the Rocket side — near completion. Integration on the new app picks up once that deploy is live.

**CockroachDB** — Distributed, region-aware, Postgres-compatible database. Replaces RDS-MySQL on the legacy Rocket side as part of the BetterAuth migration. Multi-region setup; rows are pinned to a region via `crdbRegion` columns. Source of the 2026-04-27 migration incident (region drift on user/resume rows) and the reason Drizzle is now optional on new work — Drizzle had repeated correctness and performance issues against CRDB.

**Region drift** — When two related rows in a multi-region distributed DB end up pinned to different regions, breaking foreign-key joins. Surfaced post-CRDB migration on Rocket (`users.crdbRegion ≠ resumes.crdbRegion` because the `gateway_region()` default landed rows in whichever region the pool happened to hit). Drives part of the urgency on the Edge resume API + JSON projection work.

**Untitled UI** — Pro component library (React Aria-based) used as the design system foundation. Apr 21: confirmed as the direction for Rocket Resume + future tenants.

**Template Resolution Engine** — The page generation architecture: template → template variables (resolved from page context) → variation sets (content pool with hash-based consistent selection) → section groups (top / middle shuffled / bottom). Template overrides allow per-industry or per-job-title customisation.

**glass** — The legacy monorepo (Yarn + Turbo). Houses the production Rocket Resume stack: `rock` (main app on Vercel), `raptor` (admin), `lambo` (events on AWS Lambda), `jaguar` (PDF generation on CF), `taxonomy` (content GraphQL on CF), `robots` (CF). Use the actual service name when referring to anything inside.

**shipcru** — The greenfield monorepo (pnpm). Houses `shipcru-router`, `shipcru-tenants` (Payload + Next.js, OpenNext on CF), and `shipcru` (marketing site for [shipcru.com](http://shipcru.com)).

**rock** — The main Rocket Resume Next.js app inside `glass`, deployed to Vercel on `rocket-resume.com`.

**jaguar** — CF Worker in `glass` that generates PDFs and images via headless browser. Replaced the deprecated `Cheetah` service.

**lambo** — Event router and async handler orchestration in `glass`, deployed to AWS Lambda via CDK. Closest match to what was previously called "ingest" in earlier notes.

**raptor** — Internal admin app in `glass` (orgs, customers, event testing). Vercel-hosted.

**shipcru-router** — CF Worker in `shipcru` that does path-based traffic splitting between `shipcru-tenants` and Vercel-hosted `rocket-resume.com`. Currently deployed only to `shipcru-router.steve-4b7.workers.dev` — not yet on `rocket-resume.com`.

**shipcru-tenants** — The Payload CMS + Next.js app in `shipcru`, deployed to Cloudflare via OpenNext. Holds the multi-tenant content model.

**RocketResume CF account** — The Cloudflare account that owns the `rocket-resume.com` and `rocket-resume.dev` zones plus the `glass`-side workers. FR does not have access.

# Architecture & Stack

Two monorepos behind the product:

- **glass** — legacy production. Serves `rocket-resume.com`. Houses `rock` (main app, Vercel), `raptor` (admin, Vercel), `lambo` (events, AWS Lambda), `jaguar` / `taxonomy` / `robots` (CF Workers).
- **shipcru** — greenfield. Serves `shipcru.com`. Houses `shipcru-router`, `shipcru-tenants` (Payload + Next.js, OpenNext on CF, Neon for data), and `shipcru` (marketing site).

`shipcru-router` is built but not yet on `rocket-resume.com` — production traffic still hits `glass` on Vercel.

[Architecture](ShipCru%20%E2%80%94%20Project%20Knowledge%20Base/Architecture%203509e5177cdd81048a56e9a47752df7d.md)

# Accounts & Access

The accounts and dashboards behind the project.

**Cloudflare**

- **ShipCru** — the new infra account. Workers, R2, D1, KV, Hyperdrive for the new app. Account ID `4b75627097c57c8449db718e749395eb`. [Dashboard](https://dash.cloudflare.com/4b75627097c57c8449db718e749395eb/home/overview).
- **RocketResume** — legacy account. Owns the `rocket-resume.com` / `rocket-resume.dev` zones and the glass-side Workers (`jaguar`, `taxonomy`, `robots`). Account ID `b728f3d61e915be9eb96d1e0747303e2`. [Dashboard](https://dash.cloudflare.com/b728f3d61e915be9eb96d1e0747303e2/home/overview).

**Neon**

- **Ship Cru** — the new Postgres for `shipcru-tenants` (Payload CMS). PG 17, us-east-1. Org `org-falling-scene-68772201`. [Console](https://console.neon.tech/app/org-falling-scene-68772201/projects).
- **Steve Zimmerman** — legacy `Taxonomy` database (~7.7 GB, PG 16, us-east-1). Holds job-title / industry / suffix content for the legacy app. Targeted for decommission once the new stack covers its surface. Org `org-gentle-truth-48208104`. [Console](https://console.neon.tech/app/org-gentle-truth-48208104/projects).

**Vercel**

- **RocketResume** — legacy host for `rock` (main app), `raptor` (admin), and other glass apps. [Dashboard](https://vercel.com/rocket-resume).

**GitHub**

- **`glass`** — legacy monorepo.
- **`shipcru`** — greenfield monorepo.

# Scope & Roadmap

**The goal.** Rebuild Rocket Resume on infrastructure ShipCru controls — Cloudflare at the edge, Neon as the database, a CMS for content — tenant-aware from day one. The legacy stack retires piece by piece; each track below is one piece of that.

**The longer arc.** Replatformed marketing surface → replatformed resume builder → multi-tenant onboarding via Custom Hostnames → internationalization → product expansion beyond the resume builder. Every Roadmap row below is one step along this arc.

**In parallel.** Phase 0 — the ancillary static pages (about, legal, support, lawsuit) — finishes its staging-to-prod cutover, then each page turns on independently. Better-auth modal and the sitemap-as-search-page are the P1 follow-ons that have to be in place before any landing page ships to a canonical URL.

**Urgent right now (P1, top of queue).** A new edge resume API on Cloudflare and a JSON projection of the resume row. These exist to cut the fan-out write costs and regional-by-row pain that has been keeping the legacy app on fire. They carry the highest sequencing weight while a stream of the team works on them.

**Tracks at a glance**

| Track | What it serves |
| --- | --- |
| Pages & UI Shell | Migrate the marketing surface off the legacy app |
| Job Titles & Industries | Replatform the SEO content layer (~60k job titles + industry pages) |
| Search | Replace the legacy search with an edge-native one |
| Suggestions | The AI-generated content the builder calls into |
| Resume Builder | Replatform the core product. Covers both the data layer (resume API + JSON projection of the resume row) and the builder UI itself — the urgent edge-API work and the future builder rebuild both live here. |
| Auth | Owned, modal-first login that works across tenants |
| Analytics & Tracking | Owned data pipeline, not vendor-locked |
| Tenants & Theming | Multi-tenant architecture from day one — branded surfaces, per-tenant feature flags, Stripe Connect payments. Scope reaches beyond resumes: the same platform can host a whole different product per tenant. |
| Translations / i18n | Ship the platform in the native language of most resume-filling users (~90% of countries, including RTL scripts). Bulk CMS content — ~60k job titles × multiple content types each — translated automatically via FR's AI-Kit plugin, with human-edit overrides where needed. |
| Cost Reduction | Decommission the legacy databases (ROC RDS-MySQL, old Taxonomy Neon) and cut Cloudflare ingest cost. Co-priority with the new design launch — operating cost is named in client conversations and the legacy DBs carry the region-drift fragility we're working around on the new side. |
| Future Directions | Product expansion beyond the resume builder |

**Reading the columns**

- **Priority** — how important: **P1** = high, **P2** = medium, **P3** = low. About importance, *not* release order.
- **Stage** — is the row itself pickable: **Ready** = clear and scoped, **Refine** = needs more thinking or external input before a dev can grab it. Orthogonal to Priority and Status.
- **Status** — workflow state: Not started → In progress → Done. Owned by whoever is doing the work.
- **Track** — which workstream it belongs to (Pages & UI Shell, Resume Builder, etc.).
- **`UI:` prefix** — UI-implementation row (page, modal, shell). API / data / infra / deploy / validation rows are unprefixed.
- **`SPIKE:` prefix** — research / investigation, not delivery work.
- **Not tracked here** — foundation work that is already in place: the new CMS, deploy pipeline, multi-tenant plugin, search backend, the auth bridge scaffold, and the Cloudflare reverse proxy.

[Open Questions & Requests](ShipCru%20%E2%80%94%20Project%20Knowledge%20Base/Open%20Questions%20&%20Requests%2050bd6780a91e4aec97869014515c71be.csv)

[Roadmap](ShipCru%20%E2%80%94%20Project%20Knowledge%20Base/Roadmap%203599e5177cdd80e8a402daf025ecc278.csv)

# Deep Dives

Standalone research documents and proposals — Spikes that grew into full docs with findings, recommendations, and implementation detail. Each entry has its own page.

**Status:**

- **WIP** — actively being investigated or written
- **Drafted** — first pass complete, internal review
- **Review** — shared with team, aligning on approach
- **Locked** — approach agreed, ready to execute

[Deep Dives](ShipCru%20%E2%80%94%20Project%20Knowledge%20Base/Deep%20Dives%20a0f92571c27445e0848156c0888a8242.csv)

# Decisions Log

| Decision | Date | Rationale |
| --- | --- | --- |
| Cloudflare stack over Vercel | Mar 2026 | Vercel cost at scale ($5k+/mo projected), Cloudflare's 100x edge regions, international expansion priority. |
| Neon Postgres over Cloudflare D1 | Mar 2026 | D1 only binds to Cloudflare Workers. Neon gives pgvector for semantic search. Better DX with migrations. |
| Greenfield ShipCru repo over extending existing monorepo | Mar 2026 | Move faster, clean architecture. Reverse proxy handles transition. Both repos coexist during migration. |
| Taxonomy as initial migration source | Apr 2026 | Taxonomy has the same content as production Prisma 1, just a different schema. OK to use taxonomy + existing migration script as the path of least resistance. Full Prisma1 reconciliation deferred to Phase 1. |
| R2 for file storage | Apr 2026 | Already connected to Payload. Natural fit for Cloudflare stack. Will also be used for resume uploads (future). |
| Hard navigation between apps during gradual release | Apr 2026 | Pages Router ↔ App Router bundle incompatibility. HTML Rewriter disables client-side nav on cross-app links. Accepted trade-off. |
| Tracking codebase is the glass repo | Apr 2026 | Confirmed by Drew. FR has read access for event-inventory spike. |
| Repo made private | Apr 9, 2026 | ShipCru repo was initially public. Drew made it private and invited Eugene + Pavel. |
| Route rollout is traffic-based | Apr 2026 | Page migration is progressive — start with low-traffic pages, expand as confidence grows. |
| Phase 0 scope: 4 static pages + UI shell + infra | Apr 16, 2026 | Locked on the Apr 16 weekly sync: About Us + /legal/* (tabbed) + /support + /rocket-resume-v-bold-antitrust-lawsuit. Builder-embedded sections, auth integration, search, and full analytics explicitly deferred. **Refined May 2026** — ship the routing infrastructure first (proxying everything to legacy), then turn pages on one by one. |
| Untitled UI as design system foundation | Apr 16 + Apr 21, 2026 | Locked on Apr 16. Apr 21: Habitat aligned, moving existing designs (Landing, Resources, About Us) onto Untitled (+16h scope, +3 days timeline). Applies to Rocket Resume and future tenants. |
| Phase 0 auth via existing Rocket Resume endpoints | Apr 17, 2026 (proposal, pending confirmation) | Proposal: header links to existing /sign-in, /create-account, /reset-password pages (redirect flow). Zero Rocket-side changes, smallest diff. Switch to in-place modals in Phase 1 once BetterAuth migration completes. |
| Blog not required for first release | Apr 2026 | Drew confirmed. Deferred to Phase 1. |
| BetterAuth integration deferred to Phase 1 | Apr 2026 | Waits on Rocket-side CockroachDB + BetterAuth deploy. Lower priority than content for the first release. **Superseded May 2026** — the canvas now puts the better-auth modal as a P1 item that precedes any landing-page promotion to canonical URLs. |
| Full Analytics & Tracking rebuild deferred to Phase 1 | Apr 16, 2026 | Phase 0 ships a minimal tracking floor (Mixpanel purchase + Google Ads conversion) only. Full rebuild has its own proposal (see Deep Dives). |
| Neon project ownership moves to ShipCru | Apr 22, 2026 | ShipCru Neon project `shipcru-tenants` provisioned. Port from FR's Neon (~2.2 GB) pending plan upgrade from Free tier. Precedes CI setup so DB tokens don't churn twice. |
| New builder API will not use GraphQL | Apr 26, 2026 | Steve's direction in the analytics Slack thread: "FYI I think the new api should not be graphql once we get to the builder." Stated as direction, not a hard constraint yet — captured here so it doesn't get lost; revisit during builder spike. |
| Tenants onboard via CNAME / Custom Hostnames on a single Worker | May 7, 2026 | One Cloudflare Worker serves many domains via host-based routing. New tenants onboard by pointing their own domain at the same infrastructure (CF for SaaS / Custom Hostnames). Rocket Resume is tenant one; same mechanism for any future partner. |
| Non-canonical URL deployment pattern | May 8, 2026 | New landing pages ship at non-canonical URLs first (e.g. `/home`, `/fast-resume-builder`), AB-tested against the legacy canonical URL, and only promoted to canonical when proven. Separates "shipping the page" from "owning the URL" — we can ship much sooner without taking on canonical-URL risk. |
| Phase 0 ships infra first, then pages one by one | May 8, 2026 | Refinement of the Apr 16 Phase 0 decision. The routing infrastructure goes live first, proxying every request to legacy. Once stable on staging then prod, individual ancillary pages (legal, support, about, lawsuit) turn on independently. Each turn-on is its own rollback boundary. |
| Better-auth modal MVP precedes landing pages | May 8, 2026 | Supersedes the Apr 2026 "BetterAuth deferred to Phase 1" decision. Modal-first, email + password and magic link to match the legacy shape. Must be in place before any landing page ships to a canonical URL because login controls on those pages need to work without bouncing users back to the legacy site. Google Sign-On + Google One Tap follow shortly after (~30% conversion lift cited by the team). |
| Drizzle is now optional | May 8, 2026 | Drizzle + CockroachDB caused multiple issues on the legacy side. For new work, raw SQL or an alternative ORM is acceptable. |
| ROC database shutdown is co-equal priority with the new design launch | May 8, 2026 | The operating cost of the legacy ROC RDS-MySQL DB is roughly an engineer per month, plus the region-drift fragility it still carries on the legacy side. Treated as a co-priority with shipping the new design, not as a cleanup pass. FR is on the hook to land PRs on the legacy repo to switch remaining consumers (sitemap, page generation) off ROC. Restricted-phrase list from the competitor lawsuit is a hard input. |
| Resume Builder launches at parity, then A/B-tests new features | May 8, 2026 | Extends the non-canonical URL deployment pattern from pages to the builder feature surface. The builder rebuild ships matching the current product first; new features ship under an A/B assignment, not as full cutovers. Keeps the rollback boundary on every change. |
| Tenant-level feature flags as a platform primitive | May 8, 2026 | "Everything goes tenant" — search, suggestions, builder features, even product surfaces unrelated to resumes. Every tenant turns features on/off independently. Shapes the Tenants & Theming track and constrains how new features are designed. |
| Untitled UI is a token source, not a component library | May 8, 2026 | Refines the Apr 16 Untitled UI adoption. We consume Untitled UI design tokens and reference its primitives, but don't reuse its components as building blocks. New components are extended in Figma first, then mirrored in code. Keeps the design system controllable; avoids painting ourselves into a third-party component shape. |
| JSON-column resume projection alongside v2 normalized | May 12, 2026 | Dual-write a JSON projection of resume content onto the resume row, alongside the existing v2 normalized child tables. Read on the hot path. Doesn't replace the normalized schema — sits next to it. Two drivers: kill the fan-out write cost that's been keeping the legacy app slow and fragile on the regional-by-row distributed DB; and eliminate the update → fetch → re-fetch round trip the builder does on every save. |
| Edge resume API on Cloudflare Workers, no GraphQL | May 12, 2026 | Firms up and broadens the Apr 26 direction. The new resume API is a Cloudflare Worker talking directly to the new database, no GraphQL layer. Hono / openapi style is acceptable; speed is the constraint. Scope extended 2026-05-12: rollout includes legacy Rocket production (not just the new tenant app), gated by an A/B assignment so a portion of legacy traffic moves to the new API while the rest stays on the existing path. |
| Phase 0 tracking scope: loaders + pageview + dimensions | May 12, 2026 | Phase 0 ships: Mixpanel + GTM + Zendesk loaders, the Mixpanel SDK's auto pageview with UTM / gclid / referrer captured as superproperties, and GA4 (via the existing GTM container or a separate include if needed). Out of scope for Phase 0: Mixpanel `.track()` event call sites for product events, Google Ads conversion pixel, Sentry, heatmaps, session replay — those belong to Phase 1 alongside the builder. Sentry: removed from glass on 2026-05-08 (PR #5638); not in Phase 0 scope. |