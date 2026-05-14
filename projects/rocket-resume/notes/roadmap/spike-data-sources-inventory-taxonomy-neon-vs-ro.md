# SPIKE: Data sources inventory — Taxonomy Neon vs ROC RDS vs CRDB vs ShipCru Neon

Order: 4
Priority: P1
Stage: Ready
Status: Not started
Track: Job Titles & Industries

Map what data lives in each of the four data sources:

- Legacy Taxonomy Neon (PG 16, Steve Zimmerman org, ~7.7 GB) — V1+V2 job titles, industries, content for old sitemap and page generation
- ROC RDS-MySQL — content text strings (~20-30M) tied to job-title prompts; some phrases legally restricted (competitor lawsuit)
- New CRDB taxonomy on the legacy stack
- ShipCru Neon (~2.5 GB) on the new stack

For overlapping data, document the diff: schema, content, freshness, which one is authoritative.

**Output:** a single data-flow document covering who owns what, what's redundant, and what needs to be merged or dropped before the ROC and old-Taxonomy-Neon shutdowns can proceed. Also lists candidates for a vector-proximity dedup pass on near-duplicate content strings.

Hard prerequisite for the ROC shutdown row and for any phrase-level cleanup driven by the competitor lawsuit.