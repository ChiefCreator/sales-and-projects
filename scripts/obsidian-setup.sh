#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
Usage: scripts/obsidian-setup.sh [--help]

  Sync .obsidian/ from .obsidian-template/.

  Copies every file from .obsidian-template/ into the matching path under
  .obsidian/, overwriting any existing file. Restart Obsidian afterwards
  to pick up the new config.

  --help   Show this message.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --help|-h) usage; exit 0 ;;
    *)
      echo "Unknown flag: $1" >&2
      usage >&2
      exit 2
      ;;
  esac
  shift
done

repo_root=$(git rev-parse --show-toplevel)
template_dir="$repo_root/.obsidian-template"
target_dir="$repo_root/.obsidian"

if [[ ! -d "$template_dir" ]]; then
  echo "Error: $template_dir does not exist" >&2
  exit 1
fi

mkdir -p "$target_dir"

while IFS= read -r -d '' src; do
  rel="${src#"$template_dir"/}"
  dst="$target_dir/$rel"
  mkdir -p "$(dirname "$dst")"
  cp -p "$src" "$dst"
  echo "[wrote] .obsidian/$rel"
done < <(find "$template_dir" -type f -print0)

echo ""
echo "Done. Restart Obsidian to apply the new config."
