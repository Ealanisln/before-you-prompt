# Technical specification — {{PROJECT}}

> Persistence: {{DB_ENGINE}} for data, {{FILE_STORAGE}} for files.
> Table and column names are a **proposal**; adapt them to the conventions of the team
> that builds the system. Suggested prefix: `{{PREFIX}}_`.

---

## 1. Input field validation

<!-- instruction: every field is validated on the client (UX) and on the server (authority). State prior normalization (trim, lowercase, whitespace collapse). One table per form if there are several. -->

| Field | Required | Type | Length / format | Rules |
|---|---|---|---|---|
| `{{field_1}}` | Yes | {{text/number/catalog}} | {{RANGE_OR_FORMAT}} | {{VALIDATION_RULES}} |
| `{{field_2}}` | No | {{type}} | {{RANGE}} | {{RULES}} |

---

## 2. Data model — proposal

<!-- instruction: one table per fenced pseudo-DDL block, with "--" comments per column when the name is not self-explanatory. snake_case, {{PREFIX}}_ prefix, engine and charset declared. Relevant columns only: this is a contract, not final DDL. -->

Engine {{ENGINE}}, charset {{CHARSET}}.

**Mandatory audit and retention convention (decided {{DATE}}):**

<!-- instruction: adapt this convention to the project and stamp it with a date once agreed; if still open, register it as OI-xx. -->

- **Every** table carries `created_at DATETIME` and `updated_at DATETIME`.
- Tables holding PII or case files additionally carry `deleted_at DATETIME NULL` for
  **soft-delete**: rows are never physically deleted; application queries filter
  `WHERE deleted_at IS NULL`.
- Retention period: {{RETENTION_POLICY}}.

### `{{PREFIX}}_{{table_1}}` — {{TABLE_PURPOSE}}

```
id           BIGINT PK AUTO_INCREMENT
{{column}}   {{TYPE}}          -- {{comment}}
{{column}}   {{TYPE}} NULL     -- {{comment}}
status       ENUM('{{a}}','{{b}}') DEFAULT '{{a}}'
created_at   DATETIME
updated_at   DATETIME
```

### `{{PREFIX}}_{{table_2}}` — {{PURPOSE}}

```
id             BIGINT PK
{{table_1}}_id BIGINT FK -> {{PREFIX}}_{{table_1}}.id
{{column}}     {{TYPE}}
created_at     DATETIME
updated_at     DATETIME
```

### 2.1 Indexes and foreign keys

<!-- instruction: indexes that back real queries (searches, paginated listings, uniqueness) and every FK with its ON DELETE/ON UPDATE policy. -->

| Table | Index / FK | Columns | Type | Rationale |
|---|---|---|---|---|
| `{{PREFIX}}_{{table_1}}` | `uq_{{column}}` | `{{column}}` | UNIQUE | {{WHY}} |
| `{{PREFIX}}_{{table_2}}` | `fk_{{table_2}}_{{table_1}}` | `{{table_1}}_id` | FK (ON DELETE RESTRICT) | {{WHY}} |

### 2.2 Migration plan

<!-- instruction: migration tool, creation order, strategy for existing data, and reversibility rule (every migration ships a down step or a documented reversal plan). -->

- Tool: {{MIGRATION_TOOL}}.
- Order: {{TABLE_CREATION_ORDER}}.
- Existing data: {{LOAD_OR_MIGRATION_STRATEGY}}.
- Reversibility: {{SCHEMA_ROLLBACK_RULE}}.

---

## 3. State flow

<!-- instruction: ASCII diagram of the main entity's lifecycle. Every state must exist in the data model's ENUM and every transition must have an actor who triggers it. -->

```
{{initial_state}} --({{action / actor}})--> {{state_2}}
{{state_2}}       --({{action / actor}})--> {{state_3}}
{{state_2}}       --({{rejection / actor}})--> {{rejected_state}}
```

| Transition | Triggering actor | Side effects |
|---|---|---|
| `{{initial_state}} → {{state_2}}` | {{ACTOR}} | {{NOTIFICATION_AUDIT_LOG_ETC}} |

---

## 4. Audit and retention convention

<!-- instruction: which actions land in the audit log (who and when), which data is kept, for how long, and on what grounds (privacy notice, regulation). Cite the OI-xx if the policy is still open. -->

- **Audit log:** every action by {{AUDITED_ACTORS}} on {{RESOURCES}} is recorded with
  user, action, resource, and timestamp.
- **Retention:** {{POLICY}} (decided {{DATE}}) / open item {{OI-xx}}.
- **Deletion:** {{SOFT_DELETE_OR_PURGE}}.
