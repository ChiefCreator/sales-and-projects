# Eliminate redundant fetch after resume save

Order: 4
Priority: P1
Stage: Ready
Status: Not started
Track: Resume Builder

Today the save path does: API updates the resume, API fetches it back, returns it, the frontend re-fetches it again on Next.js. Eliminate the redundant round trip. The save response should carry everything the client needs to render. Goal: page transitions feel instant, with no flash of stale state.

Coupled with the Edge resume API + JSON projection work — same hot path, same regional-write fan-out cost. Move with that work, not as a separate cleanup pass.