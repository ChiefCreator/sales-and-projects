# Onboarding to the Sales & Projects Knowledge Base

**Time required:** ~15 minutes.
**What you'll end up with:** Obsidian installed locally, connected to the repo, with auto-sync running in the background. Editing a note in Obsidian becomes a commit on GitHub within ~10 minutes. Other people's changes show up in your vault within ~5 minutes.

Stuck? Post in **#kb-help** on Slack.

---

## Step 1 — Install Git

You only need to install Git once on your machine. It works in the background; you'll never need to use it directly.

- **Windows:** open PowerShell and run `winget install Git.Git`. Restart your terminal.
- **macOS:** open Terminal and run `brew install git`. If you don't have Homebrew, macOS will prompt you to install Apple's developer tools — that includes Git, also fine.
- **Linux:** `sudo apt install git` (Debian/Ubuntu) or your distro's package manager.

Verify: open a terminal, run `git --version`. You should see something like `git version 2.40.0`.

**Mobile users:** skip this step. The mobile plugin includes Git internally.

## Step 2 — Install Obsidian

Download from **https://obsidian.md** and install. Free for our use.

## Step 3 — Generate a GitHub Personal Access Token

We use a "fine-grained" token scoped to just this one repo — if your laptop is ever compromised, the blast radius is this repo only.

1. Go to **https://github.com/settings/tokens?type=beta** → "Generate new token".
2. **Token name:** `obsidian-sales-and-projects-<your-laptop>`
3. **Expiration:** 1 year (calendar reminder yourself for renewal).
4. **Resource owner:** select our company org (ask the gardener which one if unsure).
5. **Repository access:** "Only select repositories" → choose `sales-and-projects`.
6. **Permissions → Repository permissions:**
   - **Contents:** Read and write
   - **Metadata:** Read-only (this is mandatory; GitHub auto-selects it)
7. Click **Generate token**. **Copy the token now** — GitHub won't show it again.

## Step 4 — Clone the vault into Obsidian

You will NOT use a terminal for this step.

1. Open Obsidian.
2. On the welcome screen, click **"Open another vault"** (bottom-left).
3. Click **"Clone existing remote vault"**.
4. **Repo URL:** `https://github.com/<our-org>/sales-and-projects.git` _(replace `<our-org>`)_
5. **Username:** your GitHub username.
6. **Password:** paste the PAT from Step 3 (not your GitHub password — the token).
7. **Local path:** anywhere you like (e.g. `~/Documents/sales-and-projects`).
8. Click **Clone**. Wait ~30 seconds.

## Step 5 — Trust and enable plugins

When the vault opens, Obsidian will show a dialog asking whether to enable community plugins from this vault. **Click "Trust author and enable plugins"**.

Then:

1. Open **Settings → Community plugins**.
2. Click **Browse** and search for "Git". Install **"Obsidian Git"** by Vinzent.
3. Toggle it **on** in the installed plugins list. The plugin reads the committed settings automatically — you do NOT need to configure intervals, sync method, or anything else.

You should see a small status indicator at the bottom-right of Obsidian (something like "✓" or commit info). That means sync is alive.

## Step 6 — Verify end-to-end

1. Open the file `projects/_template/notes/.gitkeep` (yes, the empty placeholder). Add a single line like `hello from <your name>`. Save (`Ctrl/Cmd-S`).
2. Wait up to 10 minutes (you can speed it up: command palette → **"Obsidian Git: Commit-and-sync"**).
3. Go to **https://github.com/<our-org>/sales-and-projects/commits/main** on GitHub. You should see your commit at the top, attributed to you with the message `vault: YYYY-MM-DD HH:mm:ss <your-hostname>`.
4. Revert your change (delete the line, save, wait or run "Commit-and-sync" again).

You're set.

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

Obsidian on iOS/Android works with the Git plugin, but it's finicky on large vaults. Don't make it your primary device. Setup is similar to Step 4 but you'll authenticate inside the plugin's settings.

## Token renewal

When your PAT expires (1 year), the plugin will start failing silently. Generate a new one (Step 3) and paste it into the plugin's settings.
