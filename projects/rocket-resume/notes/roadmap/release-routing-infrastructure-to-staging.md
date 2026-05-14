# Release routing infrastructure to staging

Order: 4
Priority: P1
Stage: Ready
Status: Done
Track: Pages & UI Shell

Ship the Cloudflare reverse-proxy infrastructure to a staging environment, proxying every request through to the legacy application. No pages turn on at this stage. This validates that the routing infrastructure is healthy under realistic conditions before any page-level cutover. Covers the routing configuration, error handling, and the rollback path.