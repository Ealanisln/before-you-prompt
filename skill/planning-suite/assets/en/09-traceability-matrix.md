# Traceability matrix — {{PROJECT}}

> The complete map: US ↔ endpoints ↔ data ↔ screens ↔ tests ↔ open items.
> This is the project's **closing checklist**: it is updated every time any document
> in the suite changes, and a row with gaps is unfinished work.

---

## 1. Matrix

<!-- instruction: one row per user story. Endpoints per 03-api-contracts.md; tables per 02-technical-specification.md; screens per the design handoff (11-design-handoff.md); cases per 07-test-plan.md; open items as OI-xx. Use "—" when something genuinely does not apply; never leave a cell empty. -->

| US | Endpoint(s) | Data table(s) | Screen(s) | Test case(s) | Open item(s) |
|---|---|---|---|---|---|
| US-01 | {{METHOD /path}} | `{{PREFIX}}_{{table}}` | {{SCREEN}} | TC-01, TC-02 | {{OI-xx / —}} |
| US-{{NN}} | {{ENDPOINTS}} | {{TABLES}} | {{SCREENS}} | {{TC-xx}} | {{OI-xx / —}} |

## 2. Maintenance rules

- **Traceability is two-way:** every story must have endpoints, data, and tests; and
  every endpoint, table, or test case must belong to some story. An artifact with no
  story is unauthorized scope; a story with no tests is unverified scope.
- Before closing a phase, check that **no row of its stories has gaps** or open items
  `OI-xx` still in `open` status.
- If an element does not apply (e.g. a story with no screen), write `—` deliberately;
  an empty cell means "work missing", the dash means "not applicable".
