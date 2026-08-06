# OpenAI Codex CLI integration

Two ways to use Before You Prompt from [Codex CLI](https://developers.openai.com/codex/),
both verified against the official docs (2026-08).

## Option A — Codex skill (recommended)

Codex supports the same `SKILL.md` agent-skills format as Claude Code, from
`~/.codex/skills/` (personal) or `.codex/skills/` (project). The skill shipped in
this repo works as-is:

```bash
mkdir -p ~/.codex/skills
cp -R skill/planning-suite ~/.codex/skills/planning-suite
```

Codex discovers the skill and can invoke it when you ask for project planning.
Docs: <https://developers.openai.com/codex/skills>

## Option B — Custom prompt (`/prompts:planning-suite`)

Codex custom prompts are Markdown files in `~/.codex/prompts/`, invoked from the
slash menu as `/prompts:<filename>`. Note: OpenAI marks custom prompts as
**deprecated** in favor of skills — they still work, but prefer Option A.

```bash
mkdir -p ~/.codex/prompts
cp integrations/codex/planning-suite.md ~/.codex/prompts/planning-suite.md
```

Then, inside Codex CLI, run:

```
/prompts:planning-suite en full
```

Arguments are optional (`$ARGUMENTS` in the prompt): language (`es`/`en`) and cut
(`minimal`/`full`).
Docs: <https://developers.openai.com/codex/custom-prompts>

## Notes

- Both options assume the project has this repo cloned or vendored so
  `planning-template/es|en/` is readable; otherwise fall back to
  [`../universal-prompt.md`](../universal-prompt.md).
- Codex also reads `AGENTS.md` natively — see
  [`../AGENTS-snippet.md`](../AGENTS-snippet.md) for a paste-in section.
