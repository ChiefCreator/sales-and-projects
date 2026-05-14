# Ditch Formik in resume builder

Priority: P2
Stage: Ready
Status: Not started
Track: Resume Builder

Replace Formik in the resume builder with React Hook Form. Formik's performance and complexity have been a drag on the builder; React Hook Form is the named replacement candidate — confirm at scoping time, but plan around it. Ties into the broader resume builder replatform; swap as part of the lift-and-shift to the new stack, not as a standalone refactor.