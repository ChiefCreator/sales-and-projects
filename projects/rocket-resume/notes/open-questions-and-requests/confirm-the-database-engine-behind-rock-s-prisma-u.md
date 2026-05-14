# Confirm the database engine behind rock's PRISMA_URL and BetterAuth's target

Area: Auth
Description: Dropped — resolvable internally by reading rock's code / env config. Glossary already names CockroachDB as the engine for the BetterAuth migration; verify in code rather than asking.
Phase: Phase 1
Raised: April 28, 2026
Status: Answered

**Context:** The KB previously stated "CockroachDB (migration from MySQL complete, multi-region)" for Rocket Resume's user/resume data. Investigating both repos plus client-call transcripts surfaces no direct confirmation. `rock` connects through the Prisma Data Platform, which abstracts the underlying engine at the app layer. `raptor` has a separate `DATABASE_URL` likely backed by CockroachDB. `shipcru-tenants/wrangler.jsonc` includes a commented-out `COCKROACH_HYPERDRIVE` placeholder for a future BetterAuth bridge — not wired.

**What we need to know:**

- What engine actually backs `rock`'s `PRISMA_URL`?
- What is BetterAuth's target DB on the `glass` side?
- Once known, do we need a Hyperdrive config from `shipcru-tenants` to that engine, or is the auth proxy approach sufficient indefinitely?

**Who to ask:** Drew or Gabriel.