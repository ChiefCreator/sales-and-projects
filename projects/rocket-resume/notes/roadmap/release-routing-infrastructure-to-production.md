# Release routing infrastructure to production

Order: 14
Priority: P1
Stage: Ready
Status: Not started
Track: Pages & UI Shell

Deploy the routing Worker to production with all routes still proxying to the legacy application. No user-visible change yet. This validates the production deployment path and the proxy fallback under live traffic before any individual page turns on. If anything breaks, rollback is a single Worker version revert.