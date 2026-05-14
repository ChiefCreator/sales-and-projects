# Server-side suggestions, decoupled from save

Order: 5
Priority: P2
Stage: Ready
Status: Not started
Track: Resume Builder

Today suggestions are computed client-side and bound to the save round trip. Two moves:

- Move suggestion computation to the server.
- Decouple the suggestions request from the save request so they're independent.

With those in place, suggestions can prefetch on the previous autosave — so when the user advances to the next section the recommendations are already there. Part of the Resume Builder hot path overhaul alongside Edge API and JSON projection.