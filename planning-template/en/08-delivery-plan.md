# Delivery plan — {{PROJECT}}

> How the project reaches production: phases, environments, go-live, rollback, and
> operations. The phases cited here are the same ones used by the index in
> [`01-user-stories.md`](01-user-stories.md).

---

## 1. Phases and MVP cut

<!-- instruction: which user stories go into each phase. Phase 1 is the MVP: the minimum that already delivers value in production. Justify what stays out of the MVP and why. -->

| Phase | Scope (stories) | Milestone | Target date |
|---|---|---|---|
| 1 (MVP) | {{US-01, US-02…}} | {{WHAT_CAN_BE_DONE_AT_CLOSE}} | {{DATE}} |
| 2 | {{US-xx…}} | {{MILESTONE}} | {{DATE}} |

## 2. Environments

| Environment | URL | Data | Access |
|---|---|---|---|
| dev | {{URL}} | Synthetic | {{WHO_AND_HOW}} |
| QA | {{URL}} | Synthetic + authorized test cases | {{WHO_AND_HOW}} |
| prod | {{URL}} | Real | {{WHO_AND_HOW}} |

## 3. CI/CD and branching strategy

<!-- instruction: branching flow, what triggers each deployment, and which gates exist (tests, review, manual approval to prod). -->

- Branches: {{SCHEME — e.g. trunk-based / main + feature branches with PRs}}.
- CI: {{WHAT_RUNS_ON_EACH_PR — lint, unit, integration}}.
- CD: {{WHAT_DEPLOYS_WHERE — merge to main → QA; tag/approval → prod}}.

## 4. Go-live plan

<!-- instruction: ordered checklist for launch day, with an owner per step and a "go" criterion. -->

| # | Step | Owner | Ready criterion |
|---|---|---|---|
| 1 | {{DB_MIGRATIONS_EXECUTED}} | {{[IT]/[VENDOR]}} | {{CRITERION}} |
| 2 | {{PROD_SECRETS_AND_CONFIG_LOADED}} | {{OWNER}} | {{CRITERION}} |
| 3 | {{DEPLOY_AND_SMOKE_TESTS}} | {{OWNER}} | TC-{{xx}} green in prod |
| 4 | {{USER_COMMUNICATION / OPENING}} | {{[BIZ]}} | {{CRITERION}} |

## 5. Rollback plan

<!-- instruction: how to revert if go-live fails: decision threshold, who decides, technical steps (including migration reversal or compatibility), and communication. -->

- **Decision threshold:** {{CONDITION — e.g. critical error with no workaround within
  the first hour}}. Decides: {{OWNER}}.
- **Steps:** {{REVERT_DEPLOY → REVERSE_MIGRATIONS_OR_COMPATIBILITY → VERIFY}}.
- **Data:** {{WHAT_HAPPENS_TO_DATA_CAPTURED_DURING_THE_WINDOW}}.

## 6. Post-launch operations

<!-- instruction: who watches what during the first weeks and who gets escalations. The minimal runbook covers the 3–5 most likely incidents. -->

- **Monitoring:** {{ACTIVE_METRICS_AND_ALERTS (see 04-non-functional-requirements.md §7)}}.
- **Minimal runbook:**

| Likely incident | Quick diagnosis | Action |
|---|---|---|
| {{EXTERNAL_SERVICE_DOWN}} | {{HOW_TO_CONFIRM_IT}} | {{ACTION_AND_WHO_TO_NOTIFY}} |
| {{MASSIVE_VALIDATION_ERRORS}} | {{DIAGNOSIS}} | {{ACTION}} |

- **Escalation:** {{LEVEL_1 → LEVEL_2 → VENDOR, with hours and channel}}.
- **Stabilization period:** {{DAYS/WEEKS}} with {{REVIEW_FREQUENCY}}.
