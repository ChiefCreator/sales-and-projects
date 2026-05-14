---
name: "Rocket Resume"
status: active
client_url: https://shipcru.com
project_url: https://www.rocket-resume.com
tags: [shipcru, resume-builder, next-js, cloudflare]
team: []
notion_page_id: "3049e5177cdd8003896efc4dcd8c2688"
started: 2026-03-11
---

# Rocket Resume

## Client

**ShipCru** — owns the Rocket Resume product. Key contacts: Steve, Drew, Robert, Tariq.

## Project

Rebuild of the Rocket Resume web app: migrating the legacy Prisma1/RDS-MySQL stack to a new Cloudflare-fronted Next.js app on the ShipCru-owned Neon database, with a redesigned UI built on Untitled UI + Habitat design tokens. Phased rollout: Phase 0 (analytics + staging pages), Phase 1 (first-release marketing pages — About / Legal / Support / Landing), then the builder rebuild.

## Tech stack

- **Frontend:** Next.js (App Router), Untitled UI primitives, Habitat design tokens
- **Backend:** Edge resume API on Cloudflare Workers
- **CMS / data:** Neon (Postgres, on ShipCru's account), ClickHouse Cloud (warehouse)
- **Hosting:** Cloudflare (apps + workers)
- **Integrations:** better-auth, Google OAuth + One Tap, Stripe Connect, planned ads platforms (Google → Meta/TikTok/LinkedIn)

## Why this stack

See [`notes/architecture.md`](./notes/architecture.md) and [`notes/shipcru-knowledge-base.md`](./notes/shipcru-knowledge-base.md). Cloudflare-first because the legacy app already runs there and edge routing simplifies the gradual rollout (worker dynamic routing for job-title / industry pages). Untitled UI was chosen over ShadCN to match the client's existing design intent while keeping Habitat tokens as the theming layer.

## Team

| Person                     | Role               |
| -------------------------- | ------------------ |
| Eugene                     | Tech lead (FR)     |
| Pavel Khurs                | Frontend (FR)      |
| Anastasiya                 | PM / coordination  |
| Denis                      | Infra / Cloudflare |
| Steve, Drew, Robert, Tariq | Client (ShipCru)   |

## Links

- Repo: _TBD_
- Staging: _TBD_
- Production: https://www.rocket-resume.com
- Figma: _TBD_
- Linear / Jira: _TBD_
- Notion: https://www.notion.so/Rocket-Resume-3049e5177cdd8003896efc4dcd8c2688

## Transcripts

Migrated from Notion exports into [`./transcripts/`](./transcripts/). Filenames follow `YYYY-MM-DD[-HHMM]-<kebab-title>.md`. Notion AI Meeting Notes continues to record live; Phase 2 of this repo will auto-mirror new transcripts.

## Notes

- [`notes/shipcru-knowledge-base.md`](./notes/shipcru-knowledge-base.md) — top-level KB index (mirrored from Notion).
- [`notes/architecture.md`](./notes/architecture.md) — current and target architecture.
- [`notes/deep-dives/`](./notes/deep-dives/) — Analytics & Tracking, Resume Builder, Search.
- [`notes/open-questions-and-requests/`](./notes/open-questions-and-requests/) — open questions waiting on client / decisions.
- [`notes/roadmap/`](./notes/roadmap/) — per-item roadmap pages (Phase 0 / Phase 1 / SPIKEs / UI items).
