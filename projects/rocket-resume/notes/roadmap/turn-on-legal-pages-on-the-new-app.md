# Turn on legal pages on the new app

Order: 8
Priority: P1
Stage: Ready
Status: Not started
Track: Pages & UI Shell

Switch the routing configuration to serve the /legal/* routes from the new app instead of proxying to the legacy site. The CMS content and the page implementation are already in place. This row is the production cutover for the legal pages only. Independent rollback boundary — failing legal does not affect other pages. Order between the four Phase 0 page turn-on rows (legal, support, about, lawsuit) is whichever is ready first; pick the lowest-friction page to validate the pattern.