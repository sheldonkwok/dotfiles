#!/usr/bin/env bash
set -euo pipefail

if ! command -v jq &>/dev/null; then
  echo "error: jq is required (e.g. brew install jq; jq is in this repo's Brewfile)" >&2
  exit 1
fi

STOCK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CUTTINGS_JSON="${STOCK_DIR}/cuttings.json"

if [[ ! -f "$CUTTINGS_JSON" ]]; then
  echo "error: missing $CUTTINGS_JSON" >&2
  exit 1
fi

while IFS=$'\t' read -r key value; do
  [[ -z "${key:-}" ]] && continue
  local_src="${STOCK_DIR}/${key}"
  dest="${HOME}/${value}"

  if [[ ! -e "$local_src" ]]; then
    echo "error: source does not exist: $local_src" >&2
    exit 1
  fi

  mkdir -p "$(dirname "$dest")"

  # Absolute path to source for stable symlinks
  abs_src=$(
    cd "$(dirname "$local_src")" && pwd
  )/$(basename "$local_src")

  if [[ -L "$dest" ]]; then
    old_target="$(readlink "$dest")"
    if [[ "$old_target" == "$abs_src" ]]; then
      echo "ok: $dest (already -> $abs_src)"
      continue
    fi
    ln -sfn "$abs_src" "$dest"
    echo "updated: $dest -> $abs_src (was -> $old_target)"
    continue
  fi

  if [[ -e "$dest" ]]; then
    echo "error: $dest exists and is not a symlink" >&2
    exit 1
  fi

  ln -sfn "$abs_src" "$dest"
  echo "linked: $dest -> $abs_src"
done < <(jq -r 'to_entries[] | "\(.key)\t\(.value)"' "$CUTTINGS_JSON")
