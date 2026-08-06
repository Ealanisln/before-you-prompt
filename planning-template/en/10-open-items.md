# Open items — {{PROJECT}}

> Living register of decisions that must be made before estimating/building without
> assumptions. ID convention: `OI-01`, `OI-02`… Other documents cite these IDs.
> Owners: **[BIZ]** business, **[IT]** internal IT, **[VENDOR]** vendor.

---

## 1. Open items register

<!-- instruction: one row per open decision. Severity: critical (blocks the build) / high (blocks a story) / medium / low. Status: open / in progress / decided. GOLDEN RULE: when a decision is made, the row is NOT deleted — the status changes to "decided" and the resolution is written with its date in the last column. The decision history is always preserved. -->

| ID | Title | Area | Owner | Blocks | Severity | Status | Resolution + date |
|---|---|---|---|---|---|---|---|
| OI-01 | {{SHORT_TITLE — e.g. OTP channel (SMS/WhatsApp) and provider}} | {{product / identity / data / technical / design}} | {{[BIZ][IT]}} | {{US-01}} | {{high}} | open | — |
| OI-02 | {{TITLE}} | {{AREA}} | {{OWNER}} | {{US-xx / —}} | {{SEVERITY}} | {{STATUS}} | {{— or "Decided: RESOLUTION (decided DATE)"}} |

## 2. Item details

<!-- instruction: optional — for items that need more context than one row. Same ID; the resolution is written RIGHT HERE with the "(decided DATE)" stamp, below the original question, without deleting it. -->

### OI-01 — {{TITLE}}

{{CONTEXT_OF_THE_QUESTION: what needs deciding, options on the table, impact on cost
or scope.}}

→ **Decided ({{DATE}}):** {{RESOLUTION_AND_WHO_MADE_IT}}.

## 3. Decision checkpoint summary

<!-- instruction: whenever a decision session happens, add a blockquote with the date and the items resolved that day. It is the project's decision changelog. -->

> **Decisions made on {{DATE}}:** {{OI-xx: short resolution}}; {{OI-xx: short
> resolution}}.
