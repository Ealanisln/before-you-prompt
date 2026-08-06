# API contracts — {{PROJECT}}

> Contract between frontend and backend (or between {{CLIENT_OR_VENDOR}} and internal
> systems). Every new endpoint is documented here **before** it is built and is linked
> to its user story.

---

## 1. Global conventions

<!-- instruction: define the cross-cutting rules once; endpoints only document what deviates from these conventions. -->

### 1.1 Authentication

| Mechanism | Header | Applies to |
|---|---|---|
| {{Bearer JWT / API key / session}} | `Authorization: Bearer {{token}}` | {{WHICH_ENDPOINTS}} |

### 1.2 Standard error envelope

Every error response uses this JSON:

```json
{
  "error": {
    "code": "{{INTERNAL_CODE}}",
    "message": "{{User-readable message}}",
    "detail": "{{Optional: technical context, never stack traces or PII}}"
  }
}
```

### 1.3 Status codes

| Code | Use |
|---|---|
| 200 / 201 | Success / resource created |
| 400 | Input validation failed |
| 401 | Missing authentication or invalid token |
| 403 | Authenticated but not allowed on the resource |
| 404 | Resource does not exist (or is hidden by authorization) |
| 409 | Conflict (duplicate, invalid state for the operation) |
| 422 | Business rule not met |
| 429 | Rate limit exceeded |
| 500 | Internal error (generic message; detail only in logs) |

### 1.4 Versioning, pagination, and limits

- **Versioning:** {{SCHEME — e.g. /v1/ prefix}}.
- **Pagination:** {{SCHEME — e.g. ?page=&per_page=, default 50, max 100}}; responses
  include `total`, `page`, `per_page`.
- **Rate limits:** {{LIMITS_PER_IP_AND_PER_USER}}.

---

## 2. Endpoints

### 2.1 `POST /v1/auth/otp/verify` — Verify one-time code (WORKED EXAMPLE)

<!-- instruction: fully worked example endpoint (pairs with US-01); use it as the reference level of detail and replace it with real endpoints. -->

| Method and path | Auth required | Related stories |
|---|---|---|
| `POST /v1/auth/otp/verify` | No (this is the sign-in) | US-01 |

**Description.** Validates the one-time code sent to the phone and, if correct,
issues the session token.

**Request**

```json
{
  "phone": "5512345678",
  "code": "482913"
}
```

**Responses**

`200 OK` — valid code:

```json
{
  "token": "eyJhbGciOi...",
  "expires_in": 3600
}
```

`422` — invalid or expired code:

```json
{
  "error": {
    "code": "OTP_INVALID",
    "message": "The code is not valid or has expired. Request a new one."
  }
}
```

`429` — attempts exhausted:

```json
{
  "error": {
    "code": "OTP_LOCKED",
    "message": "Too many attempts. Wait 15 minutes and try again."
  }
}
```

**Possible errors**

| HTTP code | `error.code` | Cause |
|---|---|---|
| 422 | `OTP_INVALID` | Wrong, expired, or already-used code |
| 429 | `OTP_LOCKED` | Maximum attempts or resends exhausted |

---

### 2.{{N}} `{{METHOD}} {{/path}}` — {{ENDPOINT_NAME}}

<!-- instruction: template block; duplicate per endpoint. Document only deviations from the global conventions. -->

| Method and path | Auth required | Related stories |
|---|---|---|
| `{{METHOD}} {{/path}}` | {{Yes (mechanism) / No}} | {{US-xx}} |

**Description.** {{WHAT_IT_DOES_IN_ONE_OR_TWO_LINES}}

**Request**

```json
{{INPUT_SCHEMA_WITH_EXAMPLE_VALUES}}
```

**Responses**

`{{200/201}}`:

```json
{{SUCCESS_SCHEMA}}
```

`{{4xx}}`:

```json
{{ERROR_ENVELOPE_WITH_SPECIFIC_CODE}}
```

**Possible errors**

| HTTP code | `error.code` | Cause |
|---|---|---|
| {{4xx}} | `{{CODE}}` | {{CAUSE}} |
