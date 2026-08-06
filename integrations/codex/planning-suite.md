---
description: Generate a bilingual (ES/EN) project-planning document suite from the Before You Prompt templates
argument-hint: "[es|en] [minimal|full]"
---

You are running the "Before You Prompt" planning suite. Produce a complete,
buildable planning document suite for this project using the templates in this
repository (clone or vendored copy) under `planning-template/`.

User preferences (may be empty; may include language `es`/`en` and cut
`minimal`/`full`): $ARGUMENTS

Process:

1. Interview the user briefly for the project brief, ONE question at a time:
   objective, actors, scope/out-of-scope, hard external integrations, delivery
   phases. Wait for each answer.
2. Choose the language tree by the project's language (unless already given as
   an argument): Spanish -> `planning-template/es/` (IDs `HU-xx`/`P-xx`/`CP-xx`,
   tags `[N]/[TI]/[PROV]`); English -> `planning-template/en/` (IDs
   `US-xx`/`OI-xx`/`TC-xx`, tags `[BIZ]/[IT]/[VENDOR]`). The trees are 1:1
   equivalents; ask if unclear; never mix them.
3. Choose the cut (unless given): small project -> minimal cut (README + 01 +
   02 + 10); multi-actor, API surface, delivery risk, or external team -> full
   suite (03-09, plus the design prompt if there is a visual deliverable).
   Integration deep-dives (06) only for genuinely hard integrations.
4. Copy the chosen templates into `<project>/docs/planning/` and fill them:
   replace every `{{PLACEHOLDER}}` or remove its section deliberately; delete
   every instruction comment; every business rule must map to at least one
   Given/When/Then acceptance criterion with mandatory negative/edge cases; log
   every unknown as a `P-xx`/`OI-xx` row in the open-items register instead of
   guessing; keep the traceability matrix and the README index + status table
   in sync. Generate the README last.
5. Report: files created, language and cut chosen and why, open items
   registered.
