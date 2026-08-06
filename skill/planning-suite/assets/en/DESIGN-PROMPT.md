# Prompt for prototype/design + handoff — {{PROJECT}}

> Meta-document: a ready-to-paste prompt for asking a design skill/tool for a
> **navigable prototype** of the project, plus the brief for the **handoff** that gets
> attached to this documentation as `11-design-handoff.md`.

## 1. How to use it

<!-- instruction: adapt the flow to the available tools (design-shotgun / design-consultation / design-html or others). The final step is ALWAYS saving the handoff next to the rest of the suite. -->

1. **Explore visual variants:** paste the prompt below into the design-exploration
   tool ({{TOOL}}).
2. **Land the chosen design** as navigable HTML with {{HTML_TOOL}}.
3. **Generate the handoff** (see section 3) and save it as `11-design-handoff.md` in
   this same folder, so it stays attached to the requirements.

---

## 2. PROMPT (paste as is)

<!-- instruction: fill in the block's placeholders. In "SCREENS TO DESIGN", REFERENCE the US-xx (title + ID); do NOT copy their business rules here — if the prompt duplicates story content, it drifts out of sync the moment a story changes. The source of truth is 01-user-stories.md. -->

```
You are a product designer. Design {{APPLICATION_TYPE — e.g. a responsive,
mobile-first web app}} for {{PROJECT}} at {{ORGANIZATION}}.

BRAND IDENTITY (use as a compass, not a rigid cage):
- Who {{ORGANIZATION}} is: {{SHORT_DESCRIPTION_AND_BRAND_PERSONALITY}}.
- Values every screen must convey: {{VALUES — e.g. warmth, trust, speed}}.
- Voice and tone: {{TONE — e.g. conversational, warm, plain language, no jargon}}.
- Reference colors: {{HEX_PALETTE_AND_USAGE — action / text / accent / surfaces}}.
- Reference typography: {{FAMILY_AND_WEIGHTS}}.
- Accessibility: AA contrast, touch targets ≥ 44px, visible focus states.

AUDIENCE AND TONE:
- {{ACTOR_1}}: {{PROFILE_AND_UX_NEEDS — e.g. mid-range Android, simple language,
  short steps}}.
- {{ACTOR_2}}: {{PROFILE — e.g. dense, efficient panel for fast operation}}.

SCREENS TO DESIGN (functional detail lives in 01-user-stories.md; design against
those stories, cited by ID):

A) {{FLOW_1 — e.g. end-user flow (mobile)}}:
  1. {{SCREEN}} — covers US-{{xx}}.
  2. {{SCREEN}} — covers US-{{xx}}.

B) {{FLOW_2 — e.g. admin panel (desktop-first, responsive)}}:
  1. {{SCREEN}} — covers US-{{xx}}.
  2. {{SCREEN}} — covers US-{{xx}}.

DESIGN REQUIREMENTS:
- {{MOBILE_FIRST_OR_OTHER — e.g. lay out 375px first}}.
- Empty, loading, error, and success states for every screen.
- Microcopy in {{LANGUAGE}}, {{TONE}}, brief.
- Consistent status indicators and reusable components.

DELIVERABLES:
- A set of screens as self-contained, navigable HTML/CSS, consistent with the brand.
- An inventory of reusable components with their states.
- Accessibility and responsiveness notes (breakpoints).
```

---

## 3. Handoff to generate (to attach to the requirements)

Once the tool produces the design, explicitly ask it for the **handoff** with this
brief:

```
Generate a design handoff document for development that includes:
1) A screen index with a capture/thumbnail of each screen and its purpose.
2) An inventory of reusable components (name, variants, states) and which screens
   they appear on.
3) Tokens used: colors (hex), typography, spacing, radii, shadows — as a table, so
   they translate into CSS variables.
4) Interaction specification per screen: validations, messages, transitions, and
   states (empty, loading, error, success).
5) Screen → user story map (mandatory: each screen cites its US-xx, referencing
   01-user-stories.md).
6) Breakpoints and responsive behavior.
7) Accessibility notes (contrast, focus, touch targets, screen readers).
Format: Markdown, ready to be saved as 11-design-handoff.md next to the rest of the
requirements documentation.
```

<!-- instruction: when the handoff arrives, save it as 11-design-handoff.md, add it to the README.md index and status table, and pour the screen→US map into the "Screen(s)" column of 09-traceability-matrix.md. -->

With that, the package is complete: requirements + stories + technical + security +
integrations + tests + delivery + design.
