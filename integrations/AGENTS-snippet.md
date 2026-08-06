# AGENTS.md snippet

[AGENTS.md](https://agents.md/) is the open, plain-Markdown standard read natively by
Codex, Cursor, GitHub Copilot, Gemini CLI, Zed, Windsurf, Aider, and 20+ other tools
(no required fields, no frontmatter — verified 2026-08).

Paste the section below into your project's `AGENTS.md` (create the file at the repo
root if it does not exist). It assumes this repo is cloned or vendored so
`planning-template/` is readable; adjust the path if you vendored it elsewhere.

---

```markdown
## Project planning (Before You Prompt)

When the user asks to plan a project or feature, or asks for requirements,
user stories, or a handoff document package, generate the planning suite from
the templates in `planning-template/`:

1. Interview the user briefly, one question at a time: objective, actors,
   scope/out-of-scope, hard external integrations, delivery phases.
2. Pick ONE language tree — Spanish `planning-template/es/` (IDs HU-xx, P-xx,
   CP-xx; tags [N]/[TI]/[PROV]) or English `planning-template/en/` (IDs US-xx,
   OI-xx, TC-xx; tags [BIZ]/[IT]/[VENDOR]) — by project language; ask if
   unclear; never mix trees.
3. Pick the cut: minimal (README + 01 + 02 + 10) for small projects; full
   suite (03-09, plus the design prompt for visual deliverables) for
   multi-actor, API-heavy, or vendor-facing projects. Integration deep-dives
   (06) only for genuinely hard integrations.
4. Generate into `docs/planning/`: fill every {{PLACEHOLDER}} or remove its
   section deliberately; delete all instruction comments; map every business
   rule to at least one Given/When/Then acceptance criterion (negative/edge
   cases mandatory); log unknowns as P-xx/OI-xx open items instead of
   guessing; keep the traceability matrix and README index/status in sync;
   generate the README last.
5. Report files created, choices made, and open items registered.
```
