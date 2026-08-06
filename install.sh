#!/usr/bin/env bash
# Planning Suite v1.1 installer (macOS / Linux)
set -euo pipefail

SRC_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILL_DEST="$HOME/.claude/skills/planning-suite"
TEMPLATE_DEST="$HOME/planning-template"

confirm_overwrite() {
  local dest="$1"
  if [ -e "$dest" ]; then
    read -r -p "$dest already exists. Overwrite? [y/N] " answer
    case "$answer" in
      [yY]*) rm -rf "$dest" ;;
      *) echo "Skipped $dest"; return 1 ;;
    esac
  fi
  return 0
}

echo "Installing planning-suite skill..."
if confirm_overwrite "$SKILL_DEST"; then
  mkdir -p "$HOME/.claude/skills"
  cp -R "$SRC_DIR/skill/planning-suite" "$SKILL_DEST"
  echo "  -> $SKILL_DEST"
fi

echo "Installing browsable templates..."
if confirm_overwrite "$TEMPLATE_DEST"; then
  cp -R "$SRC_DIR/planning-template" "$TEMPLATE_DEST"
  echo "  -> $TEMPLATE_DEST"
fi

echo
echo "Done. Open Claude Code in any project and run: /planning-suite"
echo "Browsable templates: $TEMPLATE_DEST (start at es/_GUIA.md or en/_GUIDE.md)"
