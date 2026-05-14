# Edge resume API on Cloudflare

Order: 1
Priority: P1
Stage: Ready
Status: In progress
Track: Resume Builder

A new resume read/write API hosted as a Cloudflare Worker, talking directly to the new database, with no GraphQL layer. Replaces the GraphQL + Apollo + v2 normalized path on the legacy side, which has been slow and fragile under the regional-by-row distributed database setup. Hono / openapi style is acceptable; speed is the constraint.

Scope extended on 2026-05-12: rollout includes legacy Rocket production (not just the new tenant app), gated by an A/B assignment so a portion of legacy traffic moves to the new API while the rest stays on the existing path. Resume read and write hot path first; broader builder API follows.