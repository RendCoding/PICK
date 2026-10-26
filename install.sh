#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
TARGET="$HOME/.local/bin/pick"
BACKUP_ROOT="${XDG_DATA_HOME:-$HOME/.local/share}/pick/backups"
SOURCE="$HERE/pick"
[[ -f "$SOURCE" ]] || { echo "Installer error: bundled pick script is missing." >&2; exit 1; }
command -v bash >/dev/null 2>&1 || { echo 'Bash is required.' >&2; exit 1; }
bash -n "$SOURCE" || { echo 'The new PICK script failed its syntax check; nothing installed.' >&2; exit 1; }
mkdir -p "$(dirname "$TARGET")" "$BACKUP_ROOT"
if [[ -f "$TARGET" ]]; then
  stamp="$(date +%Y%m%d-%H%M%S)"
  backup="$BACKUP_ROOT/pick-pre-0.1.8-$stamp-$$"
  mkdir -p "$backup"
  cp -p "$TARGET" "$backup/pick"
  cfg="${XDG_CONFIG_HOME:-$HOME/.config}/pick/commands.tsv"
  [[ ! -f "$cfg" ]] || cp -p "$cfg" "$backup/commands.tsv"
  echo "Backup created: $backup"
fi
tmp="$(mktemp "$(dirname "$TARGET")/.pick.XXXXXX")"
trap 'rm -f "$tmp"' EXIT
install -m 755 "$SOURCE" "$tmp"
bash -n "$tmp"
mv -f "$tmp" "$TARGET"
trap - EXIT
echo 'PICK 0.1.8 installed.'
echo 'Run: pick -V && pick doctor'
echo 'Open the interface with: pick centre'
