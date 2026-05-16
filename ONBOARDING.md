# Onboarding to the Sales & Projects Knowledge Base 5 ццкц 333

**Time required:** ~10 minutes.
**What you'll end up with:** Obsidian installed locally, connected to the repo, with auto-sync running in the background. Editing a note in Obsidian becomes a commit on GitHub within ~10 minutes. Other people's changes show up in your vault within ~5 minutes.

Stuck? Post in **#kb-help** on Slack.

---

## Step 1 — Install Git

You only need to install Git once on your machine. It works in the background; you'll never need to use it directly after setup.

- **Windows:** open PowerShell and run `winget install Git.Git`. Restart your terminal.
- **macOS:** open Terminal and run `brew install git`. If you don't have Homebrew, macOS will prompt you to install Apple's developer tools — that includes Git, also fine.
- **Linux:** `sudo apt install git` (Debian/Ubuntu) or your distro's package manager.

Verify: open a terminal, run `git --version`. You should see something like `git version 2.40.0`.

**Mobile users:** skip this step. The mobile plugin includes Git internally.

## Step 2 — Install Obsidian

Download from **https://obsidian.md** and install. Free for our use.

## Step 3 — Clone the repo and seed the config

1. Pick a parent folder where the vault should live (e.g. `~/Documents/`). Don't create the `sales-and-projects` folder yourself — `git clone` will create it.
2. Open a terminal in that parent folder:
   - **Windows:** open **Git Bash** (installed alongside Git in Step 1).
   - **macOS/Linux:** open Terminal.
3. Clone the repo over HTTPS:

   ```bash
   git clone https://github.com/<our-org>/sales-and-projects.git
   ```

4. Move into the cloned folder and run the config seeder:

   ```bash
   cd sales-and-projects
   ./scripts/obsidian-setup.sh
   ```

   You'll see a list of `[wrote]` lines and a final `Done.` message. This copies the team-blessed Obsidian config (plugins, sync intervals, commit-message format) into your local `.obsidian/`.

## Step 4 — Open the folder as a vault in Obsidian

1. Open Obsidian.
2. On the welcome screen, click **"Open folder as vault"** (Obsidian's term for "use this directory as my notes repository").
3. Select the `sales-and-projects` folder you cloned in Step 3.
4. When Obsidian asks whether to trust community plugins from this vault, click **"Trust author and enable plugins"**.

You're set. The Obsidian Git plugin starts syncing automatically — pull every 5 min, auto-commit + push every 10 min. A small status indicator at the bottom-right of the Obsidian window confirms sync is alive.

---

## How editing works

- Edit any markdown file in Obsidian like normal.
- Save (`Ctrl/Cmd-S`). The plugin auto-commits + pushes within 10 minutes.
- Other people's edits land in your vault within 5 minutes.
- For a new project: copy the `projects/_template/` folder to `projects/<kebab-slug>/`, fill in `README.md`'s frontmatter.

## What's where

- **`projects/<slug>/README.md`** — main project page (client info, stack, team, links).
- **`projects/<slug>/transcripts/`** — meeting transcripts.
- **`projects/<slug>/notes/`** — long-form notes (tech decisions, integrations, etc.).
- **`_attachments/<slug>/`** — images and PDFs for that project.
- **`_inbox/`** — transcripts that auto-mirror from Notion but couldn't be routed to a project. The gardener triages weekly. _(Active once Phase 2 ships.)_

## Conventions

- **Root `README.md` edits go through a PR**, not direct commit. It's the highest-conflict file. The gardener will revert direct commits to root `README.md`.
- **Save often.** Many small commits are better than one giant one — fewer conflicts.
- **Use the template.** Don't hand-craft project folder structures.

## If sync gets stuck (the 4-step recipe)

Symptom: Obsidian Git shows a banner about "conflict" or "rebase". This means two people edited the same lines of the same file.

1. **Don't panic, don't delete the vault.** Your work is safe inside the conflicted file.
2. **Open the conflicted file.** Look for `<<<<<<<`, `=======`, and `>>>>>>>` markers wrapping both versions.
3. **Edit the file to keep what you want.** Delete the markers. Save.
4. **Command palette (`Ctrl/Cmd-P`) → "Obsidian Git: Continue rebase".** Done.

If that doesn't work, paste the file contents into **#kb-help** — the gardener will resolve it.

## Mobile (advanced, optional)

Obsidian on iOS/Android works with the Git plugin, but it's finicky on large vaults. Don't make it your primary device. Setup is similar to Step 3–4 but you'll authenticate inside the plugin's settings.
