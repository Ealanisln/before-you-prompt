# User stories — {{PROJECT}}

> Each story is documented with **ID / Role / Name / Priority / Phase / Dependencies / Attachments**,
> a **Description** ("As a… I need…, so that…"), numbered **Business Rules**,
> **Acceptance criteria** (Given / When / Then),
> **Refinement notes**, and a **Change log**.
> ID convention: `US-01`, `US-02`… — hyphenated, two digits, cited identically in every document.

## Story index

<!-- instruction: one row per story. Priority uses MoSCoW: Must / Should / Could / Won't. Phase = delivery phase per 08-delivery-plan.md. -->

| US | Role | Feature | Priority | Phase |
|---|---|---|---|---|
| US-01 | {{ROLE}} | {{FEATURE}} | Must | 1 |
| US-02 | {{ROLE}} | {{FEATURE}} | {{PRIORITY}} | {{PHASE}} |

---

## US-01 — Sign-in with phone number + OTP (WORKED EXAMPLE)

<!-- instruction: this story is a fully worked GENERIC example; use it as the reference level of detail, then delete it or replace it with a real story from the project. -->

| ID | Role | Name | Priority (MoSCoW) | Phase | Dependencies | Attachments |
|---|---|---|---|---|---|---|
| US-01 | End user | Sign-in with phone number and one-time code | Must | 1 | — | [`03-api-contracts.md`](03-api-contracts.md), [`05-security.md`](05-security.md) |

**Feature description**

As an **end user**, I need to sign in with my phone number and a one-time code, so
that I can access the application securely without a password.

**Business Rules**

| # | Rule |
|---|---|
| 1 | Access is by **phone + OTP** only; this actor has no password. |
| 2 | The OTP is a **6-digit** numeric code, **expires** in 5 minutes, and is **single-use**. |
| 3 | The OTP is stored **hashed**; it never travels back to the client and is never written to logs. |
| 4 | There is a maximum of **5 attempts** per code, plus **rate limiting** per phone number and IP. |
| 5 | Code resends are controlled: at most 3 resends per sign-in session. |
| 5.1 | When resends are exhausted, the flow locks for 15 minutes and a clear message shows the wait time. |
| 6 | A valid OTP starts a session with an expiring token; an invalid or expired one shows a clear message with a resend option. |

**Acceptance criteria**

<!-- instruction: Given/When/Then format. EVERY business rule must be covered by at least one criterion, and negative/edge cases (expired, exhausted, duplicate, exact limit) are MANDATORY, not optional. The "Rule(s)" column closes the mapping. -->

| # | Given | When | Then | Rule(s) |
|---|---|---|---|---|
| 1 | A registered user with a valid phone number | They request a code and enter the valid OTP | They are signed in and receive an expiring session token | 1, 2, 6 |
| 2 | An OTP issued more than 5 minutes ago | The user enters it | Access is rejected with an expiry message and a resend option | 2, 6 |
| 3 | An already-used OTP | The user enters it again | Access is rejected; the code is not reusable | 2 |
| 4 | A user who failed the same code 5 times | They try a sixth time | The code is invalidated and a new one must be requested | 4 |
| 5 | A user who exhausted the 3 resends | They request another resend | The flow locks for 15 minutes with a message showing the wait time | 5, 5.1 |
| 6 | The code store | It is inspected after an OTP is issued | The code is hashed and does not appear in application logs | 3 |

**Refinement notes**

_Open: define the OTP channel (SMS / WhatsApp / email) and provider. See OI-01 in
[`10-open-items.md`](10-open-items.md)._

**Change log**

| Version | Date | Author | Change |
|---|---|---|---|
| 1.0 | {{DATE}} | {{AUTHOR}} | Initial version |

---

## US-{{NN}} — {{FEATURE_NAME}}

<!-- instruction: empty template block; duplicate it for each story in the project. -->

| ID | Role | Name | Priority (MoSCoW) | Phase | Dependencies | Attachments |
|---|---|---|---|---|---|---|
| US-{{NN}} | {{ROLE}} | {{NAME}} | {{Must/Should/Could/Won't}} | {{PHASE}} | {{US-xx or —}} | {{LINKS_OR_—}} |

**Feature description**

As a **{{ROLE}}**, I need {{ACTION}}, so that {{BENEFIT}}.

**Business Rules**

<!-- instruction: numbered 1, 2, 3…; use sub-numbering (5.1, 5.2) for exceptions or variants of a rule. UI copy goes in *italics with quotes*. -->

| # | Rule |
|---|---|
| 1 | {{RULE}} |
| 2 | {{RULE}} |

**Acceptance criteria**

<!-- instruction: every business rule must appear in the "Rule(s)" column of at least one criterion. Always include negative and edge cases. -->

| # | Given | When | Then | Rule(s) |
|---|---|---|---|---|
| 1 | {{CONTEXT}} | {{ACTION}} | {{EXPECTED_RESULT}} | {{N}} |
| 2 | {{NEGATIVE_CONTEXT}} | {{ACTION}} | {{EXPECTED_REJECTION_OR_ERROR}} | {{N}} |

**Refinement notes**

_{{OPEN_QUESTIONS_OR_REFINEMENT_AGREEMENTS; cite open items as OI-xx.}}_

**Change log**

| Version | Date | Author | Change |
|---|---|---|---|
| 1.0 | {{DATE}} | {{AUTHOR}} | Initial version |
