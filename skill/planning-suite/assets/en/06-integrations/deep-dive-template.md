# {{INTEGRATION}} — technical deep-dive

> Deep-dive for the integration with **{{EXTERNAL_SYSTEM}}** ({{PROTOCOL — SOAP / REST /
> queue / file}}). Documents the system **as it is today** and what must be built.
> <!-- instruction: create one file per HARD integration (external, legacy, poorly documented, or non-trivial protocol), named NN-name.md inside 06-integrations/. A modern, well-documented REST API does NOT warrant a deep-dive: cite it in 03-api-contracts.md. -->

---

## 1. What it does and how it is built

<!-- instruction: purpose of the external system, technology, where it lives (network, VPN, environments), and architecture rules (e.g. "always consumed server-side, never from the browser"). -->

{{SYSTEM_DESCRIPTION_AND_ARCHITECTURE}}

> **Architecture rule:** {{KEY_RULE — e.g. the call is always made server-side; the
> endpoint is never exposed to the Internet}}.

## 2. Flow / state machine

<!-- instruction: ASCII diagram of the integration's real flow, including retries and error paths. -->

```
{{step_1}} --({{event}})--> {{step_2}}
{{step_2}} --({{success}})--> {{final_step}}
{{step_2}} --({{error}})--> {{error_step / retry}}
```

## 3. Current contract (input / output)

<!-- instruction: real endpoint/queue/path, method, headers, and a REAL example payload (anonymized or with authorized test data; never third-party PII without consent). -->

- **Endpoint:** `{{URL_OR_RESOURCE}}`
- **Method / operation:** `{{METHOD_OR_OPERATION}}`
- **Environments:** {{PROD / QA and how each is reached}}

Example request:

```{{format}}
{{REAL_EXAMPLE_PAYLOAD}}
```

Example response:

```{{format}}
{{REAL_EXAMPLE_RESPONSE}}
```

## 4. Error code catalog

<!-- instruction: ALL known codes, even the rare ones. "Suggested action" is what the system or the operator must do, not a description. -->

| Code | Meaning | Suggested action |
|---|---|---|
| `{{00}}` | {{SUCCESS}} | Continue the flow |
| `{{XX}}` | {{MEANING}} | {{RETRY / FIX_DATA / ESCALATE_TO_[IT]}} |

## 5. "Service down" vs "operation failed"

<!-- instruction: critical distinction for error handling. Down = timeout, 5xx, network → retry/queue. Failed = the service responded with a rejection → do NOT blindly retry; follow the catalog's action. -->

| Situation | How it is detected | Expected behavior |
|---|---|---|
| Service down | {{TIMEOUT / 5XX / NETWORK_ERROR}} | {{RETRY_WITH_BACKOFF / QUEUE / ALERT}} |
| Operation failed | {{REJECTION_CODE_IN_RESPONSE}} | {{CATALOG_ACTION; no blind retries}} |

## 6. Timeouts, retries, and idempotency

- **Timeout:** {{S}} s per call.
- **Retries:** {{N}} with {{SCHEME}} backoff; only on {{CONDITIONS}}.
- **Idempotency:** {{HOW_DUPLICATES_ARE_PREVENTED — idempotency key, unique reference
  per transaction, pre-check}}.

## 7. Provider SLA and limits

| Aspect | Value |
|---|---|
| Committed SLA / availability | {{VALUE}} |
| Rate limit | {{VALUE}} |
| Provider support hours | {{VALUE}} |
| Cost per transaction (if any) | {{VALUE}} |

## 8. Test data / sandbox

<!-- instruction: how to test without touching production: environment, credentials (reference to the secrets manager, never the value), known-good and known-bad test cases. -->

- Test environment: {{QA_URL_OR_RESOURCE}}.
- Credentials: {{WHERE_TO_OBTAIN_THEM}}.
- Known cases: {{GOOD_CASE}} / {{REJECTION_CASE}}.

## 9. As-is vs to-be

<!-- instruction: explicit contrast between how it works today and how it must end up. This grounds the build list. -->

| Aspect | As-is (today) | To-be (target) |
|---|---|---|
| {{ASPECT_1}} | {{HOW_IT_IS_TODAY}} | {{HOW_IT_MUST_END_UP}} |
| {{ASPECT_2}} | {{AS_IS}} | {{TO_BE}} |

## 10. What must be built

<!-- instruction: numbered, actionable list; each item must be convertible into a task. Cite the US-xx that depend on each piece. -->

1. {{PIECE_TO_BUILD}} (supports {{US-xx}}).
2. {{PIECE_TO_BUILD}}.
3. {{PIECE_TO_BUILD}}.

## 11. curl example

<!-- instruction: reproducible call against the test environment, with placeholders for secrets. It must work by copy-paste after substituting variables. -->

```bash
curl -X POST '{{QA_URL}}' \
  -H 'Content-Type: {{CONTENT_TYPE}}' \
  -H 'Authorization: Bearer {{TOKEN}}' \
  -d '{{MINIMAL_PAYLOAD}}'
```
