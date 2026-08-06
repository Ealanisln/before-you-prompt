---
name: planning-suite
description: "Trigger: planning, planeacion, nuevo proyecto, kickoff, historias de usuario, FRD, requerimiento, handoff, project planning, user stories, requirements handoff. Generate a bilingual (ES/EN) project-planning document suite from templates."
license: Apache-2.0
metadata:
  author: "ealanis"
  version: "1.1"
---

# planning-suite

## Activation Contract

Activate when the user starts planning a new project or feature, or asks for a
requerimiento, handoff, FRD, requirements package, or user-stories documentation.

## Hard Rules

- Generate documents in one language per project: neutral professional Spanish (`assets/es/`) or professional English (`assets/en/`). Never mix trees.
- Keep ID conventions everywhere — ES: `HU-01`, `P-01`, `CP-01`; EN: `US-01`, `OI-01`, `TC-01`. Owner tags: `[N]/[TI]/[PROV]` (ES) ≡ `[BIZ]/[IT]/[VENDOR]` (EN).
- Fill every `{{PLACEHOLDER}}` or remove its section deliberately; register meaningful omissions as `P-xx`/`OI-xx`.
- Never leave instruction comments (`<!-- instrucción -->` / `<!-- instruction -->`) in the final output.
- Create deep-dives (`06-integraciones/` / `06-integrations/`) only for genuinely hard integrations.
- Every business rule in a story must map to at least one acceptance criterion; negative/edge cases are mandatory.
- Keep the traceability matrix and the README index + status table in sync with every document you generate.

## Decision Gates

| Condition | Choice |
|---|---|
| User/project language is Spanish | Use `assets/es/` templates |
| User/project language is English | Use `assets/en/` templates |
| Language unclear | Ask before generating |
| Small project / single feature | Minimal cut: `README` + `01` + `02` + `10` |
| Multi-actor, API surface, delivery risk, or external team | Full suite (add `03`–`09`; design prompt if visual deliverable) |
| External/hard integration exists | One deep-dive per integration in the integrations folder |

## Execution Steps

1. Interview the user briefly for the project brief: objective, actors, scope/out of scope, hard integrations, phases. One question at a time.
2. Pick the language tree (`assets/es/` or `assets/en/`) per the decision gates, then copy the chosen templates into `<project>/docs/planning/` (or a user-chosen directory), keeping filenames and the integrations subfolder.
3. Fill placeholders from the brief; delete instruction comments; log every unknown as a `P-xx`/`OI-xx` row in the open-items register.
4. Generate the README last: document index, status/approvals table, change history.
5. Report files created and open items.

## Output Contract

Return: list of files created (absolute paths), the language and minimal-vs-full choices made and why, and the `P-xx`/`OI-xx` items registered.

## References

- `assets/es/` — Spanish templates; `assets/en/` — English templates (1:1 equivalents).
- Human-browsable master copy: `/Users/ealanis/Development/planning-template/` (`es/` + `en/`).
- `assets/es/_GUIA.md` / `assets/en/_GUIDE.md` — ordering logic, ID conventions, minimal-cut rules.
