# Notion manual migration

One-time tool for moving content from Notion into this repo.

## Tools

### `strip-notion-hashes.sh`

Removes Notion's 32-hex-char ID suffixes from filenames and folder names produced by Notion's "Export → Markdown & CSV" feature.

**Usage:**

```bash
bash tools/notion-manual-migrate/strip-notion-hashes.sh <path-to-unzipped-notion-export>
```

**Example:**

```bash
bash tools/notion-manual-migrate/strip-notion-hashes.sh ~/Downloads/Export-2026-05-14
```

**On Windows:** use Git Bash (bundled with Git for Windows), not PowerShell — the script relies on POSIX `find` and `bash` regex.

## Manual migration procedure (per project)

1. In Notion: project page → `...` → **Export** → format **Markdown & CSV** → "Include subpages" ON → download ZIP.
2. Unzip into a scratch folder.
3. Run `bash tools/notion-manual-migrate/strip-notion-hashes.sh <scratch-folder>` to clean up filenames.
4. Reshape:
   - Top-level project `.md` → `projects/<kebab-slug>/README.md`
   - Meeting/call subpages → `projects/<kebab-slug>/transcripts/<YYYY-MM-DD>-<title>.md`
   - Tech/notes subpages → `projects/<kebab-slug>/notes/<topic>.md`
   - Attachments → `_attachments/<kebab-slug>/`, fix relative links.
5. Add frontmatter to `README.md` per `projects/_template/README.md`.
6. Commit: `git commit -m "migrate: <slug>"`.
7. Verify in Obsidian.
