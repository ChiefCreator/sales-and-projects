# SPIKE: Taxonomy vs JSON data delta

Priority: P2
Stage: Ready
Status: Not started
Track: Job Titles & Industries

The shared JSON data dump has roughly 126k entries — about 77k more than the taxonomy public API exposes. The status field on those extra rows is mostly "unknown," so they are likely unpublished. There are no job-title to content relations in the dump. Reconcile this against the roughly 30M content strings the team has confirmed live in the legacy Prisma1 database. Output: a clear picture of what data we have, what is missing, and where each canonical copy lives.