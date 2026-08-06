#!/usr/bin/env bash
# Before You Prompt installer (macOS / Linux)
set -euo pipefail

SRC_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILL_DEST="$HOME/.claude/skills/planning-suite"
TEMPLATE_DEST="$HOME/planning-template"
INSTALLED=""

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

ask_yes() {
  local question="$1" answer
  read -r -p "$question [y/N] " answer
  case "$answer" in
    [yY]*) return 0 ;;
    *) return 1 ;;
  esac
}

echo "Installing planning-suite skill (Claude Code)..."
if confirm_overwrite "$SKILL_DEST"; then
  mkdir -p "$HOME/.claude/skills"
  cp -R "$SRC_DIR/skill/planning-suite" "$SKILL_DEST"
  echo "  -> $SKILL_DEST"
  INSTALLED="$INSTALLED
  - Claude Code skill: $SKILL_DEST"
fi

echo "Installing browsable templates..."
if confirm_overwrite "$TEMPLATE_DEST"; then
  cp -R "$SRC_DIR/planning-template" "$TEMPLATE_DEST"
  echo "  -> $TEMPLATE_DEST"
  INSTALLED="$INSTALLED
  - Templates: $TEMPLATE_DEST"
fi

# --- Optional: other AI clients (only offered if the client is detected) ---

if [ -d "$HOME/.codex" ]; then
  echo
  echo "Detected OpenAI Codex CLI (~/.codex)."
  if ask_yes "Install the Codex skill (recommended)?"; then
    if confirm_overwrite "$HOME/.codex/skills/planning-suite"; then
      mkdir -p "$HOME/.codex/skills"
      cp -R "$SRC_DIR/skill/planning-suite" "$HOME/.codex/skills/planning-suite"
      echo "  -> $HOME/.codex/skills/planning-suite"
      INSTALLED="$INSTALLED
  - Codex skill: $HOME/.codex/skills/planning-suite"
    fi
  fi
  if ask_yes "Install the Codex custom prompt (/prompts:planning-suite)?"; then
    if confirm_overwrite "$HOME/.codex/prompts/planning-suite.md"; then
      mkdir -p "$HOME/.codex/prompts"
      cp "$SRC_DIR/integrations/codex/planning-suite.md" "$HOME/.codex/prompts/planning-suite.md"
      echo "  -> $HOME/.codex/prompts/planning-suite.md"
      INSTALLED="$INSTALLED
  - Codex prompt: $HOME/.codex/prompts/planning-suite.md"
    fi
  fi
fi

if [ -d "$HOME/.gemini" ]; then
  echo
  echo "Detected Gemini CLI (~/.gemini)."
  if ask_yes "Install the Gemini custom command (/planning-suite)?"; then
    if confirm_overwrite "$HOME/.gemini/commands/planning-suite.toml"; then
      mkdir -p "$HOME/.gemini/commands"
      cp "$SRC_DIR/integrations/gemini/planning-suite.toml" "$HOME/.gemini/commands/planning-suite.toml"
      echo "  -> $HOME/.gemini/commands/planning-suite.toml"
      INSTALLED="$INSTALLED
  - Gemini command: $HOME/.gemini/commands/planning-suite.toml"
    fi
  fi
fi

echo
if [ -n "$INSTALLED" ]; then
  echo "Done. Installed:$INSTALLED"
else
  echo "Done. Nothing installed."
fi
echo
echo "Claude Code: run /planning-suite in any project."
echo "Other tools (Cursor, Zed, Copilot, anything): see integrations/README.md"
echo "Browsable templates: $TEMPLATE_DEST (start at es/_GUIA.md or en/_GUIDE.md)"
