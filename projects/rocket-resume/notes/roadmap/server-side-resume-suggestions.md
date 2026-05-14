# Server-side resume suggestions

Priority: P2
Stage: Ready
Status: Not started
Track: Suggestions

Move resume content suggestions from the client (currently synchronous on the client) to the server. Suggestions can be prefetched, decoupled from the save path (two separate requests with different latency tolerances), and made to feel instant from the user's perspective. Part of the broader resume builder rebuild on the new stack.