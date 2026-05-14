set -euo pipefail

target="${1:?Usage: $0 <directory>}"
[[ -d "$target" ]] || { echo "Not a directory: $target" >&2; exit 1; }

# Walk depth-first so children are renamed before their parent folders move.
# Use -print0/read -d '' so spaces in names are preserved.
find "$target" -depth -print0 | while IFS= read -r -d '' path; do
  dir="$(dirname "$path")"
  base="$(basename "$path")"

  # Match: "<name> <32 lowercase hex chars><optional .ext>"
  if [[ "$base" =~ ^(.+)\ [0-9a-f]{32}(\.[a-zA-Z0-9]+)?$ ]]; then
    new_base="${BASH_REMATCH[1]}${BASH_REMATCH[2]:-}"
    new_path="$dir/$new_base"

    if [[ -e "$new_path" ]]; then
      echo "SKIP (target exists): $path -> $new_path" >&2
      continue
    fi

    mv -- "$path" "$new_path"
    echo "renamed: $base -> $new_base"
  fi
done
