# Non-functional requirements — {{PROJECT}}

> Operational and quality constraints that apply to the **whole** system, regardless
> of individual user stories. Every target must be **measurable**; anything that
> cannot be measured is registered as an open item `OI-xx`.

---

## 1. Performance

<!-- instruction: measurable targets under expected load, not lab ideals. Use percentiles (p95), not averages. -->

| Metric | Target |
|---|---|
| API response time (p95) | ≤ {{MS}} ms |
| Initial load of the main page (mobile, 4G) | ≤ {{S}} s |
| {{CRITICAL_OPERATION}} | ≤ {{TARGET}} |

## 2. Availability / SLA

<!-- instruction: the business's real operating hours, availability target, and agreed maintenance windows. If a vendor is involved, align with their contractual SLA. -->

- Critical operating hours: {{HOURS}}.
- Availability target: {{PERCENTAGE}} % monthly.
- Maintenance windows: {{WINDOWS}}.

## 3. Supported browsers and devices

| Platform | Minimum supported | Notes |
|---|---|---|
| Android (Chrome) | {{VERSION}} | {{e.g. mid-range devices, 360–412 px screens}} |
| iOS (Safari) | {{VERSION}} | {{NOTES}} |
| Desktop (Chrome/Edge/Firefox) | {{VERSIONS}} | {{e.g. admin panel only}} |

## 4. Accessibility

<!-- instruction: target level plus concrete verifiable rules; avoid "must be accessible" without a criterion. -->

- Target level: WCAG {{2.1/2.2}} level {{AA}}.
- Minimum contrast {{4.5:1}}; touch targets ≥ {{44}} px; visible focus; forms with
  labels and associated error messages.

## 5. Languages / i18n

- Language(s): {{LANGUAGES}}.
- {{STRATEGY — e.g. single locale, centralized copy for future translation}}.

## 6. Limits

<!-- instruction: hard limits the backend must enforce (not just the client). -->

| Limit | Value |
|---|---|
| Maximum file size | {{MB}} MB |
| Allowed file formats | {{FORMATS}} |
| Timeout for external service calls | {{S}} s |
| Session timeout | {{MIN}} min |
| {{OTHER_LIMIT}} | {{VALUE}} |

## 7. Observability

<!-- instruction: what gets logged, what gets measured, and what wakes someone up. Logs never contain sensitive PII or secrets. -->

- **Logs:** {{WHAT_IS_LOGGED_AND_WHERE}}; no sensitive PII or credentials.
- **Metrics:** {{KEY_METRICS — e.g. latency, error rate, usage per endpoint}}.
- **Alerts:** {{CONDITION → CHANNEL → OWNER}}.

## 8. Expected capacity

<!-- instruction: business numbers that size the infrastructure; if they do not exist, estimate them and mark them as estimates. -->

| Dimension | Expected value |
|---|---|
| Peak concurrent users | {{N}} |
| New records per {{DAY/MONTH}} | {{N}} |
| File storage per {{MONTH/YEAR}} | {{GB}} |
| Estimated annual growth | {{PERCENTAGE}} % |
