# Rocket Resume Daily Standup — Summary

**Date:** May 13, 2026 12:00 PM (GMT+2)
**Duration:** 44 min
**Language:** Russian
**Participants:** Eugene Boruhov, Anastasiya Sokolova, Pavel Khurs, Denis Urban, Artsiom Kaplich
**Source transcript:** `../transcripts/2026-05-13-1200-rocket-resume-daily.md`

---

## 🔁 Process Changes

- **Daily timing is moving to end-of-day** so the team can report what was actually completed, matching what the client (Drew/ShipCru) wants — a daily progress summary.
- **Pavel volunteered to build a Claude-based skill** that auto-generates the standup summary from meeting notes/transcripts and posts it first to an internal Slack channel for review before forwarding to the client.
- Eugene currently runs the notetaker bot (Recall + Gladia) manually; he'll share transcript access with Pavel to enable the automation. MCP access to the FocusReactive Notion workspace is an open issue — may require a paid/business plan.

---

## 👷 Individual Updates

| Person | Progress |
|--------|----------|
| **Pavel** | Built Social Proof, Ambassadors sections; fixing Hero section. Merged all feature PRs into one parent "About" branch (not yet to main). Will PR once About page is complete. |
| **Artsiom** | Switched to single BOSS-mode search query, eliminating the dual-request approach. Added Kiwi cache for results (60-min TTL, separate namespace from embedding cache). Cache hits now serve results in 200–300ms; misses ~900ms. |
| **Denis** | App Router work nearly done — will push to staging today and communicate with Ivan. Will also look at release prep. |
| **Eugene** | Will pick up the database-check task (verifying what's stored where). |

---

## 🗺️ New Task: Public Sitemap-style Page

- Eugene proposed building a **public sitemap/index page** that lists all job titles grouped by industry, with search embedded — primarily to expose the BOSS search externally and get client feedback.
- Artsiom assigned to build an MVP quickly using existing sitemap logic, with pagination and scroll-based loading.

---

## 👥 Team Expansion Surprise

- Drew indicated the FocusReactive team is now expected to **manage two external devs — Ivan (Ecuador) and Gabriel (Costa Rica)** — effectively making FR the team lead. Drew remains nominal contact but is hands-off.
- The team has shared the knowledge base/roadmap with Ivan and Gabriel. Communication will be async (chat + backlog) due to timezone spread (AU / EU / Americas).
- Anastasiya flagged this is beyond original scope and will loop in Robert.

---

## 🔧 Other Notes

- Notion MCP doesn't work for guest/read-only roles in the FocusReactive workspace — needs admin access or a workaround.
- Worker warm-up (to avoid cold starts) was discussed but deprioritized — warming across all Cloudflare edge regions would be costly.
- Artsiom shared pricing estimates: even at 1M daily active users, Kiwi cache costs stay around $40–55/month.
