# UI: Better-auth modal — email/password + magic link

Order: 1
Priority: P1
Stage: Ready
Status: Not started
Track: Auth

Ship the modal-style login on the new app, matching the legacy authentication shape: email and password, plus magic link. Modal-first because the existing sign-in standalone page is rarely used. Has to be in place before any landing page ships to a canonical URL, since login controls on those pages need to work without bouncing users back to the legacy site. Social providers (Google Sign-On, Google One Tap) follow shortly after — tracked separately.