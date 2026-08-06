# Test plan — {{PROJECT}}

> Test strategy and cases for the project. Every test case is linked to a user story
> (`US-xx`) and appears in the [`09-traceability-matrix.md`](09-traceability-matrix.md).
> ID convention: `TC-01`, `TC-02`…

---

## 1. Strategy per level

<!-- instruction: what is tested at each level, with which tool, and who owns it. Delete levels that do not apply — deliberately. -->

| Level | Scope | Tool | Owner |
|---|---|---|---|
| Unit | {{BUSINESS_LOGIC_AND_VALIDATIONS}} | {{TOOL}} | {{[VENDOR]/[IT]}} |
| Integration | {{API + DB + MOCKED_EXTERNAL_SERVICES}} | {{TOOL}} | {{OWNER}} |
| E2E | {{FULL_CRITICAL_FLOWS}} | {{TOOL}} | {{OWNER}} |
| UAT | {{BUSINESS_VALIDATION_IN_QA}} | Manual, guided by TC-xx cases | {{[BIZ]}} |

## 2. Test cases

<!-- instruction: derive cases from each story's acceptance criteria: every criterion produces at least one case, and negative/edge cases are mandatory. Type: positive / negative. -->

| ID | Related US | Scenario | Data | Expected result | Type |
|---|---|---|---|---|---|
| TC-01 | US-01 | {{HAPPY_PATH_SCENARIO}} | {{DATA}} | {{RESULT}} | positive |
| TC-02 | US-01 | {{REJECTION_OR_EDGE_SCENARIO}} | {{DATA}} | {{EXPECTED_REJECTION}} | negative |
| TC-{{NN}} | US-{{NN}} | {{SCENARIO}} | {{DATA}} | {{RESULT}} | {{TYPE}} |

## 3. Device matrix

<!-- instruction: the combinations on which manual/E2E tests run; align with the support matrix in 04-non-functional-requirements.md. -->

| Device / browser | Version | Cases executed |
|---|---|---|
| {{Mid-range Android / Chrome}} | {{VERSION}} | {{ALL / TC-xx…}} |
| {{iPhone / Safari}} | {{VERSION}} | {{CASES}} |
| {{Desktop / Chrome}} | {{VERSION}} | {{CASES}} |

## 4. Test data and environments

<!-- instruction: where testing happens and with which data. Never real third-party PII; use synthetic data or authorized test cases. Cite the sandboxes from the deep-dives (06-integrations/). -->

- Test environment: {{QA_URL}} (see [`08-delivery-plan.md`](08-delivery-plan.md)).
- Synthetic data: {{HOW_IT_IS_GENERATED_OR_WHERE_IT_LIVES}}.
- External services: {{SANDBOX_OR_MOCK_PER_INTEGRATION}}.

## 5. Exit criteria / UAT sign-off

<!-- instruction: objective conditions to consider the project tested; the sign-off is the business acceptance record. -->

- 100 % of `Must` cases executed and green; no open {{CRITICAL/HIGH}} defects.
- {{THRESHOLD — e.g. minimum unit coverage, medium defects with a plan}}.
- UAT signed off by **{{BUSINESS_APPROVER}}** on {{DATE}}.

| UAT cycle | Date | Result | Notes |
|---|---|---|---|
| 1 | {{DATE}} | {{approved / rejected}} | {{NOTES}} |
