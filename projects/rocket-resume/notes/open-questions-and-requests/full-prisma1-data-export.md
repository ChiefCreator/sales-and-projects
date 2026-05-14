# Full Prisma1 data export

Area: Data
Description: Share the full Prisma1 export (~30M content strings with JT↔content relations). Current 254k entries on Neon come from the taxonomy public API — a subset. Blocks Phase 1 Full Data Migration.
Phase: Phase 1
Raised: April 15, 2026
Status: Open

## Context

Current state on Neon: 254k entries migrated from the taxonomy **public** GraphQL API (50,610 job titles + 203,983 content records + 192,560 grouped relations, 6.8M flat JT×content pairs).

Steve confirmed in the Apr 15 thread that the legacy Prisma1 DB (`datamodel.rock.graphql`) has closer to **~30M content text entries** with the full relation graph — this is the production source of builder suggestions, and the public taxonomy API is a subset.

## Why it matters

Phase 1's Full Data Migration needs the complete dataset. Without it:

- Builder suggestions in the new app will be thinner than prod
- Search quality degrades (less content to rank)
- Content-quality feedback loop (Phase 2) has less signal to learn from

## Proposed

Share an export. Format negotiable:

- SQL dump (`pg_dump` or equivalent)
- JSON dump with relations preserved
- Direct DB snapshot access

FR re-runs the migration script against the full dataset and re-builds the search index.

## Related

- [Phase 1 → Full Data Migration](../../ShipCru%20%E2%80%94%20Project%20Knowledge%20Base%203309e5177cdd8040bd6bea19f03301b2.md) in the roadmap
- Feeds into KB Spikes: [Taxonomy vs JSON data delta](../../ShipCru%20%E2%80%94%20Project%20Knowledge%20Base%203309e5177cdd8040bd6bea19f03301b2.md) + [Map all content text types per job title](../../ShipCru%20%E2%80%94%20Project%20Knowledge%20Base%203309e5177cdd8040bd6bea19f03301b2.md)