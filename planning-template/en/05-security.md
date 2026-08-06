# Security considerations — {{PROJECT}}

> {{RISK_CONTEXT — e.g. "This application handles sensitive PII (name, address,
> banking data). Applicable regulation: {{REGULATION}}; a privacy notice and explicit
> consent are required before capturing data."}}
> <!-- instruction: open by stating which sensitive data the system handles and which legal or regulatory framework applies. That justifies the rest of the document. -->

## 1. Authentication and session (OWASP A07)

<!-- instruction: per actor, the authentication mechanism and concrete rules (expiry, hashing, attempts, rate limiting). Specific values, not "secure". -->

- **{{ACTOR_1}} ({{MECHANISM}}):**
  - {{RULE — e.g. 6-digit OTP, expires in 5 min, single-use, stored hashed}}.
  - {{RULE — maximum attempts and rate limit per identifier and IP}}.
- **{{ACTOR_2}} ({{MECHANISM}}):**
  - Password hashing with **argon2id or bcrypt** (never plain MD5/SHA).
  - {{POLICY — lockout on failed attempts, 2FA if PII is accessible}}.
- **Sessions** with expiry and invalidation on logout. Cookies `HttpOnly`, `Secure`,
  `SameSite`.

## 2. Authorization (IDOR / access control) (OWASP A01)

- **The user identifier is ALWAYS taken from the session token, never from the
  body/query.** An endpoint that trusts a client-supplied `user_id` is an IDOR.
- **RBAC:** {{ROLES_AND_PERMISSIONS_PER_ACTION}}.

> Internal precedent: {{PRIOR_CASE — an internal finding or incident that grounds the
> rule; e.g. "system X had IDOR findings from trusting the user_id in the body instead
> of the JWT. Do not repeat that pattern here."}}
> <!-- instruction: the "Internal precedent" block anchors the rule in the organization's real experience; if there is no precedent, delete the blockquote. -->

## 3. File uploads (OWASP A03 / A05)

<!-- instruction: delete this section if the system does not receive files. -->

- Validate type by **content (magic bytes)**, not by extension or the client's
  `Content-Type`.
- Size limit ({{MB}} MB) enforced in the **backend**.
- **Private** storage, encrypted at rest; access only via short-lived **pre-signed
  URLs** after validating session and resource ownership.
- Storage key/path generated **server-side** (never the original filename → prevents
  path traversal).
- Serve downloads with `Content-Disposition: attachment`; never render uploaded HTML.

## 4. Data, retention, and compliance

- **Privacy notice** shown before capturing data.
- **Encryption at rest:** {{STRATEGY — storage and sensitive columns}}.
- **Retention and deletion:** {{POLICY}} (decided {{DATE}}) / open item {{OI-xx}}.
- **Audit log** for every action on PII.

## 5. Transport and headers (OWASP A02 / A05)

- **TLS mandatory** on all traffic.
- Headers: `Content-Security-Policy`, `X-Content-Type-Options: nosniff`,
  `X-Frame-Options` / `frame-ancestors`.
- **Server-side input validation** for every field.
- **CSRF** protection on session-based forms; **XSS** via escaping/CSP; **SSRF**:
  validate any identifier used to build a URL.

## 6. Secrets and dependencies (OWASP A02 / A06)

- **Secrets** (keys, credentials, tokens) out of the repository: environment variables
  or a secrets manager. Never in the frontend or in version control.
- Dependencies with {{STRATEGY — periodic audits, lockfiles, renewal policy}}.

## 7. Accepted risk

<!-- instruction: security trade-offs consciously ACCEPTED by the business. Documenting them here prevents them from resurfacing as a "finding" in every audit. Each one with its partial mitigation and who accepted it. -->

| Risk | Why it is accepted | Partial mitigation | Accepted by / date |
|---|---|---|---|
| {{RISK — e.g. "already registered" message enables enumeration}} | {{REASON — business UX}} | {{MITIGATION — rate limit + CAPTCHA}} | {{OWNER}} / {{DATE}} |

## 8. Control mapping

<!-- instruction: close by linking each control to what it protects and who implements it. Severity: critical / high / medium / low. Owner with tags [BIZ] / [IT] / [VENDOR]. -->

| Control | Severity | Related US / Endpoint | Owner |
|---|---|---|---|
| {{CONTROL — e.g. hashed OTP + rate limit}} | {{SEVERITY}} | {{US-xx / METHOD /path}} | {{[IT]/[VENDOR]}} |
| {{CONTROL}} | {{SEVERITY}} | {{US-xx}} | {{OWNER}} |

## 9. OWASP Top 10 (2021) mapping

<!-- instruction: coverage checklist against the OWASP Top 10. For each category: Applies? = yes / no (with a short reason if no); "Controls in this project" cites sections of this document or other controls; Status: covered / partial / open (OI-xx). Never delete a row: a non-applicable category is marked "no" with its reason. -->

| Category | Applies? | Controls in this project | Related US/Endpoint | Status |
|---|---|---|---|---|
| A01 — Broken Access Control <!-- instruction: IDOR, RBAC, resource ownership, endpoints missing authorization (see §2) --> | {{yes/no}} | {{CONTROLS}} | {{US-xx}} | {{STATUS}} |
| A02 — Cryptographic Failures <!-- instruction: TLS, encryption at rest, password/OTP hashing, exposed secrets (see §5, §6) --> | {{yes/no}} | {{CONTROLS}} | {{US-xx}} | {{STATUS}} |
| A03 — Injection <!-- instruction: SQLi, XSS, command injection; parameterized queries, output escaping, input validation --> | {{yes/no}} | {{CONTROLS}} | {{US-xx}} | {{STATUS}} |
| A04 — Insecure Design <!-- instruction: flows abusable by design (enumeration, unlimited retries, exploitable business logic); check against §7 Accepted risk --> | {{yes/no}} | {{CONTROLS}} | {{US-xx}} | {{STATUS}} |
| A05 — Security Misconfiguration <!-- instruction: headers, CORS, buckets/ACLs, verbose error messages, insecure defaults --> | {{yes/no}} | {{CONTROLS}} | {{US-xx}} | {{STATUS}} |
| A06 — Vulnerable and Outdated Components <!-- instruction: dependencies with CVEs, lockfiles, update policy (see §6) --> | {{yes/no}} | {{CONTROLS}} | {{US-xx}} | {{STATUS}} |
| A07 — Identification and Authentication Failures <!-- instruction: brute force, sessions, token expiry, weak credentials (see §1) --> | {{yes/no}} | {{CONTROLS}} | {{US-xx}} | {{STATUS}} |
| A08 — Software and Data Integrity Failures <!-- instruction: unverified CI/CD, insecure deserialization, unsigned updates --> | {{yes/no}} | {{CONTROLS}} | {{US-xx}} | {{STATUS}} |
| A09 — Security Logging and Monitoring Failures <!-- instruction: audit log of sensitive actions, abuse alerts, logs without PII (see 04 §7) --> | {{yes/no}} | {{CONTROLS}} | {{US-xx}} | {{STATUS}} |
| A10 — Server-Side Request Forgery (SSRF) <!-- instruction: URLs built from client data, remote resource fetching, configurable webhooks --> | {{yes/no}} | {{CONTROLS}} | {{US-xx}} | {{STATUS}} |

**APIs:** for API-heavy projects, also review the **OWASP API Security Top 10**
(object- and property-level authorization, unrestricted consumption) against
[`03-api-contracts.md`](03-api-contracts.md).

**Deeper verification:** for formal audits, the reference standard is **OWASP ASVS**;
register the target level ({{L1/L2}}) as {{OI-xx}} if not yet decided.
