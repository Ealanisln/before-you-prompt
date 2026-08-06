# How to use this planning template

> This document explains **how to use the suite**; it is not part of the final
> deliverable. Delete it (or keep it as internal reference) once the project
> documentation is ready to hand off.

---

## 1. Document ordering logic

The suite follows a deliberate progression: **WHAT → HOW → RISK → DEEP-DIVE →
QUALITY → DELIVERY → UNKNOWNS**.

| Order | Document | Question it answers |
|---|---|---|
| WHAT | [`README.md`](README.md) + [`01-user-stories.md`](01-user-stories.md) | What are we building, and for whom? |
| HOW | [`02-technical-specification.md`](02-technical-specification.md) + [`03-api-contracts.md`](03-api-contracts.md) + [`04-non-functional-requirements.md`](04-non-functional-requirements.md) | How is it built, and under which constraints? |
| RISK | [`05-security.md`](05-security.md) | What can go wrong, and which trade-offs are accepted? |
| DEEP-DIVE | [`06-integrations/`](06-integrations/deep-dive-template.md) | Which hard integrations need extra detail? |
| QUALITY | [`07-test-plan.md`](07-test-plan.md) | How do we verify it works? |
| DELIVERY | [`08-delivery-plan.md`](08-delivery-plan.md) + [`09-traceability-matrix.md`](09-traceability-matrix.md) | How does it reach production, and how do we confirm nothing was left loose? |
| UNKNOWNS | [`10-open-items.md`](10-open-items.md) | Which decisions are still open? |

[`DESIGN-PROMPT.md`](DESIGN-PROMPT.md) is a cross-cutting meta-document: use it when
the project needs a visual prototype/design; it reserves `11-design-handoff.md`.

## 2. ID conventions

Use the **same hyphenated format** across every document:

| Prefix | Meaning | Example | Defined in |
|---|---|---|---|
| `US-xx` | User story | `US-01` | `01-user-stories.md` |
| `OI-xx` | Open item (pending decision) | `OI-03` | `10-open-items.md` |
| `TC-xx` | Test case | `TC-12` | `07-test-plan.md` |

Rules:

- Two-digit numbering (`US-01`, not `US1` or `US01` without the hyphen).
- Other documents **cite** these IDs; they never duplicate their content.
- Business rules inside a story are numbered `1, 2, 3…`; exceptions or sub-rules use
  sub-numbering (`5.1`, `5.2`).

**Spanish equivalence:** this suite also exists in Spanish under `../es/`. The IDs map
1:1 — `US-xx` ≡ `HU-xx`, `OI-xx` ≡ `P-xx`, `TC-xx` ≡ `CP-xx` — and the owner tags map
`[BIZ]` ≡ `[N]`, `[IT]` ≡ `[TI]`, `[VENDOR]` ≡ `[PROV]`. Pick one language per project;
do not mix trees.

## 3. Owner tags

Every decision or open item carries an owner tag:

- **[BIZ]** — business / requesting area.
- **[IT]** — internal IT team.
- **[VENDOR]** — vendor / external development team.

## 4. Dated decision stamp

When a decision is made, document it **in the place where the question lived**, with
the stamp `(decided {{DATE}})`. Never delete the original question: the trail of how
the decision was reached is preserved.

## 5. Minimal cut for small projects

Not every project needs the full suite. The **minimal cut** is:

| Document | Why it is non-negotiable |
|---|---|
| `README.md` | Hub: objective, scope, actors, index. |
| `01-user-stories.md` | The WHAT, with acceptance criteria. |
| `02-technical-specification.md` | The HOW: validations and data model. |
| `10-open-items.md` | Unknowns are never left implicit. |

Documents 03, 04, 05, 07, 08 and 09 are added as the project grows in API surface,
operational requirements, risk, or team size. `DESIGN-PROMPT.md` only when there is a
visual deliverable.

## 6. The deep-dive rule

**Deep-dives are only for hard integrations.** A document in `06-integrations/` is
justified only when the integration is external, legacy, poorly documented, or uses a
non-trivial protocol (SOAP, queues, hardware, a banking core, etc.). A modern,
well-documented REST API does NOT need a deep-dive: citing it in
`03-api-contracts.md` is enough.

## 7. How to fill in the templates

1. Replace every `{{LIKE_THIS}}` marker with the real value.
2. The `<!-- instruction: ... -->` comments tell you what belongs in each section;
   **remove them** from the final document.
3. If a section does not apply, delete it **deliberately** (never leave it empty) and,
   if the omission matters, log it in `10-open-items.md`.
4. Keep the `README.md` index/status tables and the `09-traceability-matrix.md` in
   sync every time a document changes.
