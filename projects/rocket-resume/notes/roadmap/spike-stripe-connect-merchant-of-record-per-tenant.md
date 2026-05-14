# SPIKE: Stripe Connect / merchant-of-record per tenant

Priority: P2
Stage: Ready
Status: Not started
Track: Tenants & Theming

Tenant partners need to receive their own revenue. The Stripe Connect model: ShipCru holds the platform Stripe account, each tenant is a connected account that processes its own revenue. Open design questions:

- Merchant of record per tenant
- Sales tax collection
- Chargeback routing back to the right account
- Cross-tenant refund mechanics

Spike output: a model proposal we walk through with the team before any implementation. Asked for early so the design lands before tenant onboarding ramps.