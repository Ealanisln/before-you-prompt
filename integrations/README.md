# Integrations — use Before You Prompt from any AI tool

The templates are **plain Markdown**, so any tool that can read files — or any chat
you can paste text into — can use this suite. Nothing here is required: these
integrations just add convenience (a slash command, an auto-loaded instruction) on
top of the same templates. Total freedom; works anywhere.

## Compatibility matrix

| Client | Mechanism | File | Install step |
|---|---|---|---|
| **Claude Code** | Skill (`/planning-suite`) | [`../skill/planning-suite/`](../skill/planning-suite/SKILL.md) | `cp -R skill/planning-suite ~/.claude/skills/` (or `./install.sh`) |
| **OpenAI Codex CLI** | Skill (recommended) or custom prompt `/prompts:planning-suite` | [`codex/planning-suite.md`](codex/planning-suite.md) | See [`codex/README.md`](codex/README.md) — `~/.codex/skills/` or `~/.codex/prompts/` |
| **Gemini CLI** | Custom command `/planning-suite` (TOML) | [`gemini/planning-suite.toml`](gemini/planning-suite.toml) | See [`gemini/README.md`](gemini/README.md) — `~/.gemini/commands/` |
| **Cursor / Zed / Copilot / Windsurf / Aider…** | [`AGENTS.md`](https://agents.md/) open standard | [`AGENTS-snippet.md`](AGENTS-snippet.md) | Paste the snippet into your project's `AGENTS.md` |
| **Anything else** (ChatGPT, Gemini web, local models) | Paste a prompt | [`universal-prompt.md`](universal-prompt.md) | Copy-paste; paste template contents too if the tool can't read files |
| **No AI at all** | Plain Markdown | [`../planning-template/`](../planning-template/README.md) | Copy the tree, fill `{{PLACEHOLDERS}}` by hand |

All integration prompts reference the templates by repo-relative path
(`planning-template/es/` or `planning-template/en/`) and assume you cloned or
vendored this repository into (or next to) your project.

`./install.sh` installs the Claude Code skill and templates, then offers the Codex
and Gemini installs automatically when it detects `~/.codex` / `~/.gemini`.

## Formats verified (2026-08)

- Codex custom prompts and skills: <https://developers.openai.com/codex/custom-prompts>, <https://developers.openai.com/codex/skills>
- Gemini CLI custom commands: <https://google-gemini.github.io/gemini-cli/docs/cli/custom-commands.html>
- AGENTS.md standard: <https://agents.md/>

If a client changes its format, fall back to [`universal-prompt.md`](universal-prompt.md)
— it always works.
