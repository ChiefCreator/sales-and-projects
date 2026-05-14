# SPIKE: Legacy database audit and content cleanup

Priority: P2
Stage: Ready
Status: Not started
Track: Suggestions

Audit the legacy Rock and Taxonomy databases to plan the shutdown. Confirm what data is V1 versus V2 in each, identify duplicates by vector similarity for cleanup, and ensure no phrases from a competitor-sued blocklist appear in the new database. Output: a data-shape summary table for alignment, plus a cleanup plan. Hard constraint: certain phrases can never appear in production, ever.