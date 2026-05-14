# Ad platforms beyond Google — Meta, TikTok, LinkedIn, others?

Area: Analytics
Description: Which ad platforms run besides Google Ads? Meta, TikTok, LinkedIn, others? Drives the fan-out scope of the new first-party tracking endpoint and which click IDs to capture client-side.
Phase: Phase 1
Raised: April 17, 2026
Status: Open

## Context

The Phase 1 tracking architecture proposes a single first-party endpoint (`track.rocket-resume.com/ingest`) on a Cloudflare Worker. That endpoint fans out to each ad platform's conversion API server-side.

Today we know Google Ads is active (Google Ads Conversion API will be wired in). What other platforms run?

## Why it matters

- Each platform has its own conversion API (Meta CAPI, TikTok Events API, LinkedIn Conversions API, etc.) — each needs a server-side integration in the Worker
- Each platform needs its click-ID captured client-side (`gclid`, `fbclid`, `ttclid`, `li_fat_id`) at first visit and persisted across the session
- Scope of the fan-out affects Phase 1 effort estimate

## Proposed

TBD — depends on what marketing ops runs today and what's planned.

## Related

- [Analytics & Tracking](../Deep%20Dives/Analytics%20&%20Tracking/Analytics%20&%20Tracking%203459e5177cdd80aa8c6af2c41da678ec.md) deep dive — target architecture
- [Phase 1 → Analytics & Tracking](../../ShipCru%20%E2%80%94%20Project%20Knowledge%20Base%203309e5177cdd8040bd6bea19f03301b2.md) in the roadmap