# Sales & Projects update 2

The company's project knowledge base — every active and past project, with their main pages, call transcripts, tech notes, integrations, team, and links.

This repo is the canonical store. Most people interact with it through **Obsidian**, which keeps everything in sync automatically.

## I'm new here — how do I get set up?

Read **[ONBOARDING.md](./ONBOARDING.md)**. Takes ~15 minutes.

## First-time setup (after clone)

After cloning the repo — and any time you want to resync to the latest team config — run:

```bash
./scripts/obsidian-setup.sh
```

This copies every file from `.obsidian-template/` into `.obsidian/` (plugins, vault settings, Obsidian Git defaults), overwriting any existing local versions. Safe to re-run.

## Updating the shared Obsidian config

The live `.obsidian/` directory is gitignored. To change the team-blessed config:

1. Tweak your settings in Obsidian.
2. Copy the changed file(s) from `.obsidian/` into `.obsidian-template/`.
3. Commit `.obsidian-template/` only.

## Where is everything?

- **`projects/<slug>/`** — one folder per project.
  - `README.md` — the project's main page (client, stack, team, links).
  - `transcripts/` — meeting transcripts.
  - `notes/` — long-form notes (tech decisions, integrations, etc.).
- **`projects/_template/`** — copy this when starting a new project.
- **`_attachments/<slug>/`** — images and PDFs.

## How does sync work?

The Obsidian Git community plugin runs in your vault:

- **Pull** every 5 min — picks up everyone else's edits.
- **Auto-commit + push** every 10 min — sends your edits up.
- **Conflicts** (rare) show up in Obsidian with the 4-step recipe in `ONBOARDING.md`.

The single shared branch is `main`. No PRs for routine edits. The only exception (convention, not enforced): edits to **this** `README.md` go through a PR.

## Conventions

- Project folder names: `kebab-case`.
- Project display name lives in `README.md` frontmatter (`name: "..."`).
- Transcript filenames: `YYYY-MM-DD-<kebab-title>.md`.
- Attachments: never paste images into project folders directly — Obsidian is configured to put them in `_attachments/`.
