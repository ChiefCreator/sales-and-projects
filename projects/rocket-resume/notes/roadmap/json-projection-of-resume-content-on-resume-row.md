# JSON projection of resume content on resume row

Order: 2
Priority: P1
Stage: Ready
Status: In progress
Track: Resume Builder

Dual-write the full resume content as a JSON blob on the resume row, alongside the existing normalized child tables. Read on the hot path. The normalized schema stays in place; the JSON projection sits next to it. The goal is to kill the fan-out write cost on save, where today one resume save touches many tables and each one pays cross-region cost on the regional-by-row distributed database.