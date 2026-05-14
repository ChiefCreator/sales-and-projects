# SPIKE: Custom Hostnames / CF for SaaS implementation

Priority: P2
Stage: Ready
Status: Not started
Track: Tenants & Theming

Investigate how to host many tenant domains on a single Cloudflare Worker via Custom Hostnames / Cloudflare for SaaS. Covers: required plan tier, certificate provisioning flow, DNS onboarding UX for a new tenant, host-based routing inside the Worker, cookie shape across tenant domains, and alternatives if Custom Hostnames isn't viable. Output: an implementation plan with pros and cons.