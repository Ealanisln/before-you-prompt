# {{PROJECT}} — Requirements & handoff

> Requirements document for {{CLIENT_OR_VENDOR}}.
> Author: {{AUTHOR}}. Date: {{DATE}}.
> <!-- instruction: this preamble sets the scope and authority of the document; state who issues it, for whom, and the cutoff date. -->

## 1. Objective

<!-- instruction: 1–2 paragraphs. What is being built, for whom, and which problem it solves. If the process has high-level steps or phases, enumerate them here as a numbered list. -->

{{PROJECT_OBJECTIVE}}

## 2. Executive summary

<!-- instruction: bullets with the key decisions and traits of the requirement: audience, flow control, integrations, persistence, hard constraints. Each bullet starts with a bolded concept. Add "(decided {{DATE}})" stamps where applicable. -->

- **{{CONCEPT_1}}:** {{DESCRIPTION}}
- **{{CONCEPT_2}}:** {{DESCRIPTION}}
- **Persistence:** {{DB_AND_STORAGE}}

## 3. Scope

Includes:

<!-- instruction: list with a link to each sibling document and its one-line purpose. Adjust to the chosen cut (minimal or full, see _GUIDE.md). -->

- User stories with acceptance criteria → [`01-user-stories.md`](01-user-stories.md)
- Technical specification: validations, data model, states → [`02-technical-specification.md`](02-technical-specification.md)
- API contracts → [`03-api-contracts.md`](03-api-contracts.md)
- Non-functional requirements → [`04-non-functional-requirements.md`](04-non-functional-requirements.md)
- Security considerations → [`05-security.md`](05-security.md)
- Deep-dives for hard integrations → [`06-integrations/`](06-integrations/deep-dive-template.md)
- Test plan → [`07-test-plan.md`](07-test-plan.md)
- Delivery plan → [`08-delivery-plan.md`](08-delivery-plan.md)
- Traceability matrix → [`09-traceability-matrix.md`](09-traceability-matrix.md)
- Open items (decisions still pending) → [`10-open-items.md`](10-open-items.md)
- Prototype/design prompt and visual handoff → [`DESIGN-PROMPT.md`](DESIGN-PROMPT.md)

**Out of scope (for now):**

<!-- instruction: explicit list of what is NOT being built in this iteration. Prevents misunderstandings with the vendor. Close by stating what this project is relative to the larger system, if applicable. -->

{{OUT_OF_SCOPE}}

## 4. Actors

| Actor | Description | Authentication |
|---|---|---|
| **{{ACTOR_1}}** | {{DESCRIPTION}} | {{AUTH_MECHANISM}} |
| **{{ACTOR_2}}** | {{DESCRIPTION}} | {{AUTH_MECHANISM}} |

## 5. Glossary

<!-- instruction: define every domain term, acronym, or system name an external reader would not know. Format: bolded term + one-line definition. -->

- **{{TERM_1}}:** {{DEFINITION}}
- **{{TERM_2}}:** {{DEFINITION}}

## 6. Document index

<!-- instruction: table with ALL documents in the folder and their one-line purpose. This is the navigation map; keep it in sync when adding or removing documents. -->

| Document | Purpose |
|---|---|
| [`01-user-stories.md`](01-user-stories.md) | User stories with business rules and acceptance criteria |
| [`02-technical-specification.md`](02-technical-specification.md) | Validations, data model, migrations, state flow |
| [`03-api-contracts.md`](03-api-contracts.md) | Global conventions and per-endpoint contracts |
| [`04-non-functional-requirements.md`](04-non-functional-requirements.md) | Performance, SLA, devices, limits, observability |
| [`05-security.md`](05-security.md) | Controls, accepted risks, and severity mapping |
| [`06-integrations/`](06-integrations/deep-dive-template.md) | Deep-dives for hard integrations (one per integration) |
| [`07-test-plan.md`](07-test-plan.md) | Test strategy and cases, exit criteria |
| [`08-delivery-plan.md`](08-delivery-plan.md) | Phases, environments, go-live, rollback, operations |
| [`09-traceability-matrix.md`](09-traceability-matrix.md) | US ↔ endpoints ↔ data ↔ screens ↔ tests |
| [`10-open-items.md`](10-open-items.md) | Living register of open decisions (OI-xx) |
| [`DESIGN-PROMPT.md`](DESIGN-PROMPT.md) | Design prompt and visual handoff brief |

## 7. Status and approvals

<!-- instruction: editorial status of each document in the suite. Status values: draft / in review / approved. Update this table at every checkpoint; it is the source of truth for what can already be built. -->

| Document | Status | Approver | Date |
|---|---|---|---|
| `README.md` | draft | {{APPROVER}} | — |
| `01-user-stories.md` | draft | {{APPROVER}} | — |
| `02-technical-specification.md` | draft | {{APPROVER}} | — |
| `10-open-items.md` | draft | {{APPROVER}} | — |
<!-- instruction: add one row per additional document included in the cut. -->

## 8. Suite change history

<!-- instruction: one row per delivered version of the full package (not per minor edit). -->

| Version | Date | Author | Change |
|---|---|---|---|
| 1.0 | {{DATE}} | {{AUTHOR}} | Initial version |
