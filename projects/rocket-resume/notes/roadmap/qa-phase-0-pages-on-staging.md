# QA Phase 0 pages on staging

Order: 13
Priority: P1
Stage: Ready
Status: In progress
Track: Pages & UI Shell

Verify the Phase 0 pages, the new header, the new footer, the router-KV flip, the analytics setup, and basic page-speed on staging before any of these are promoted to production. One ticket because the things being tested are interlocking: pages render inside the shell, links cross between them, and the router-KV flip is the same mechanism we'll use for the prod cutover.

**Pages** (legal, support, antitrust lawsuit, about us)

- Each page renders at its staging URL with the right CMS content and layout.
- No 404s, no broken images, no overflow / wrapping bugs at common breakpoints (mobile, tablet, desktop).
- Internal links go where they're supposed to.

**Header (replicated from legacy)**

- Visual parity with the legacy header minus the bits we removed (search, currency switcher).
- Auth entry point redirects to the auth flow rather than opening a modal.
- Nav links work and lead to the right destinations on the new app.
- Mobile menu opens, closes, and is usable.

**Footer (new design)**

- Matches the agreed design at all breakpoints.
- All footer links work.

**Router-KV flip**

- Flip one staging page's KV entry from legacy to new app and confirm the page is served from the new app on the next request.
- Flip it back and confirm rollback works the same way.
- Note observed propagation time.

**Analytics**

Phase 0 target: loaders + auto pageview with UTM / gclid / referrer dimensions + GA4. Not in Phase 0: Mixpanel `.track()` event call sites, Google Ads conversion pixel, Sentry, heatmaps, session replay.

*GTM*

- Confirm which GTM container ID is wired on staging (env vars + wrangler config).
- Load staging and verify in the network tab that the GTM container loads.
- Inspect the container's tag list (preview mode) — note which tags are configured. If GA4 is in the container, no separate gtag.js include is needed. If not, add it to the new app's head.
- Check whether the container has hostname-based firing rules; if staging hostnames aren't allow-listed, ask the team to add them.

*Mixpanel*

- Verify the Mixpanel auto pageview fires (network tab → [api-js.mixpanel.com](http://api-js.mixpanel.com)).
- Wire UTM, gclid, and `document.referrer` capture as Mixpanel superproperties at init. Verify they appear on a pageview in the Mixpanel inspector.
- Check whether the Mixpanel project filters by hostname; if so and staging isn't allowed, ask the team to add it.

*Dashboards*

- Open Mixpanel and GA4 and confirm staging events are landing (filter by hostname). If we don't have access, ask the team for read-only.

**Page-speed**

- Run Lighthouse on each Phase 0 page (mobile + desktop). Capture scores so we have a baseline going into the production cutover. Anything obviously broken (sub-50 mobile performance, missing meta tags, render-blocking issues) gets flagged for the relevant build ticket.

---

**Context worth knowing**

*GTM (Google Tag Manager) container.* A Google-hosted bundle of tracking tags — GA4, Google Ads pixel, custom HTML, etc. — identified by an ID like `GTM-XXXXXXX`. You include one snippet that loads the container, and the container injects whatever tags are configured inside. The same container can run on any domain. Worth checking whether we can reuse the legacy GTM container ID on the new app for continuity with marketing's existing dashboards — likely yes.

*Mixpanel superproperties.* Key-value pairs the Mixpanel SDK auto-attaches to every event for the rest of the session. Set them once at init with `mixpanel.register({ utm_source: '...', gclid: '...', referrer: '...' })` and they ride on every subsequent event including the auto pageview. Without them, pageviews land in Mixpanel with no attribution data and marketing can't tell which Google Ads campaign drove the visit. The legacy app reads UTMs / gclid from the URL and `document.referrer` on first visit and registers them; we do the same.

*Sentry.* The legacy team removed Sentry from glass on 2026-05-08 (PR #5638). Sentry is not in Phase 0 scope. No Sentry work required here.