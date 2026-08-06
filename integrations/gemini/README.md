# Gemini CLI integration

[Gemini CLI](https://github.com/google-gemini/gemini-cli) custom commands are TOML
files; format verified against the official docs (2026-08):
<https://google-gemini.github.io/gemini-cli/docs/cli/custom-commands.html>

- **Global:** `~/.gemini/commands/planning-suite.toml` → available everywhere as `/planning-suite`
- **Project:** `<project>/.gemini/commands/planning-suite.toml` → project-only (overrides global)
- Schema: `prompt` (required), `description` (optional); `{{args}}` is replaced with
  whatever you type after the command name.

## Install

```bash
mkdir -p ~/.gemini/commands
cp integrations/gemini/planning-suite.toml ~/.gemini/commands/planning-suite.toml
```

Then, inside Gemini CLI:

```
/planning-suite en full
```

Arguments are optional: language (`es`/`en`) and cut (`minimal`/`full`).

## Notes

- The command assumes the project has this repo cloned or vendored so
  `planning-template/es|en/` is readable; otherwise fall back to
  [`../universal-prompt.md`](../universal-prompt.md).
- Gemini CLI also reads `AGENTS.md` context files natively — see
  [`../AGENTS-snippet.md`](../AGENTS-snippet.md).
