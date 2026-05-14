# Data warehouse — sign off on proposed direction

Area: Analytics
Description: Decided: ClickHouse Cloud Basic for the warehouse + CF Workers Analytics Engine for real-time aggregates + Grafana Cloud for dashboards. Cost projection ~$70-100/mo. Alternatives ruled out (Tinybird, BigQuery, PostHog, AWS) — see Analytics deep dive.
Phase: Phase 1
Raised: April 17, 2026
Status: Answered

## Context

Core architectural decision for the Analytics rebuild. All events flow through a first-party endpoint into whichever warehouse is chosen. A full comparison and recommendation already exist in the deep dive — this entry asks for feedback / sign-off on the proposed direction.

## Options summary (full analysis in the deep dive)

- **ClickHouse Cloud Basic** — full SQL, ad-hoc analysis, ~$70–100/mo
- **Tinybird Developer** — analytics-APIs-first, fastest dev velocity, ~$50–80/mo
- **BigQuery** — cheapest at low volume, ~$10–30/mo, but not CF-native
- **CF Workers Analytics Engine** — real-time aggregates, CF-native, effectively free at our volume; SQL subset, no joins, ~90-day retention
- **PostHog Cloud** — all-in-one (analytics + warehouse + flags + experiments), ~$70–200/mo

## Proposed direction (feedback requested)

**Primary warehouse:** ClickHouse Cloud Basic or Tinybird Developer. Tinybird if dev velocity is the priority, ClickHouse for maximum flexibility.

**Real-time aggregate tier:** CF Workers Analytics Engine alongside the primary — for content-scoring reads and search-ranking inputs. CF-native, effectively free at our volume.

**PostHog:** revisit later. Cheaper than Mixpanel at our volume and consolidates the stack if product wants experiments / feature flags — but not decided now.

This is the FR recommendation. Looking for sign-off or pushback before Phase 1 work begins.

## Related

- [Analytics & Tracking](../Deep%20Dives/Analytics%20&%20Tracking/Analytics%20&%20Tracking%203459e5177cdd80aa8c6af2c41da678ec.md) deep dive — full comparison and reasoning
- [Phase 1 → Analytics & Tracking](../../ShipCru%20%E2%80%94%20Project%20Knowledge%20Base%203309e5177cdd8040bd6bea19f03301b2.md) in the roadmap