# Shut down ROC RDS-MySQL database

Order: 1
Priority: P1
Stage: Ready
Status: Not started
Track: Cost Reduction

ROC is the legacy RDS-MySQL database that powered the old Rocket Resume app. Migrated to CockroachDB on 2026-04-27 (PR #5117). Goal: switch every remaining consumer off RDS — sitemap generation, page generation, taxonomy fallbacks — and decommission.

Steve called this co-priority with the new design launch on 2026-05-08 — the operating cost of the legacy DB is roughly the cost of an engineer per month, plus it carries the ongoing region-drift and write-fan-out fragility that the new edge API + JSON projection work is fighting on the new side.

FR is on the hook to land PRs on the legacy repo to do the switch.

**Hard prerequisite:** restricted-phrase list from the competitor lawsuit. Steve has flagged certain phrases that can't be republished anywhere; any content path moving off ROC has to filter them. Data sources inventory spike feeds this row.