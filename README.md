# Before You Prompt

> A modern planning guide for people who want to build a web project with AI —
> and have no idea where to start.

AI can write your code, but it can't decide what you're building. That part is
yours. **Before You Prompt** is a bilingual (English/Spanish) suite of planning
documents that walks you from "I have an idea" to a complete, buildable spec —
plus a [Claude Code](https://claude.com/claude-code) skill that generates and
fills it for you.

Reverse-engineered from a real-world requirements handoff that worked well, then
extended with the pieces most planning docs are missing: API contracts,
non-functional requirements, an OWASP-mapped security doc, a test plan, a
delivery plan, and a traceability matrix. Fill these documents first, hand them
to your AI (or your team), and every prompt you write afterwards gets sharper.

## What's inside

```
planning-template/
├── es/   13 documents in Spanish   (start at _GUIA.md)
└── en/   13 documents in English   (start at _GUIDE.md)
skill/planning-suite/               Claude Code skill (SKILL.md + assets)
INSTALL.md                          Installation guide (ES/EN)
install.sh                          One-step installer (macOS/Linux)
```

Each language tree contains:

| Doc | Purpose |
|-----|---------|
| `README.md` | Hub: objective, scope, actors, glossary, doc index, sign-off |
| `01` User stories | Fixed story template with MoSCoW priority and Given/When/Then criteria |
| `02` Technical specification | Field validation, data model, state flow, migrations |
| `03` API contracts | Auth, error envelope, per-endpoint schemas with worked example |
| `04` Non-functional requirements | Performance, SLA, device matrix, accessibility, observability |
| `05` Security | Per-area controls, accepted-risk register, **OWASP Top 10 (2021) mapping** |
| `06` Integration deep-dives | As-is/to-be diff, error catalogs, retry/idempotency policy |
| `07` Test plan | Test cases linked to stories, negative cases mandatory |
| `08` Delivery plan | Phases/MVP cut, environments, go-live, rollback |
| `09` Traceability matrix | Story → endpoint → table → screen → test case |
| `10` Open items | Numbered decision register, resolved in place with dates |
| Design prompt | Executable prompt to generate the UI prototype and design handoff |

## Design principles

- **WHAT → HOW → RISK → DEEP-DIVES → QUALITY → DELIVERY → UNKNOWNS** ordering.
- Stable ID spaces (`US-01`/`HU-01`, `OI-01`/`P-01`, `TC-01`/`CP-01`) so every
  document can cross-reference every other.
- Decisions are resolved **in place with a date**, never deleted — the open-items
  register doubles as a decision log.
- Deep-dives only for genuinely hard integrations; a minimal cut
  (README + 01 + 02 + 10) for small projects.
- Security is a first-class document with an explicit accepted-risk section.

## Install

```bash
./install.sh
```

Or manually — see [INSTALL.md](INSTALL.md). The templates are plain Markdown and
work without Claude Code; the skill adds `/planning-suite`, which interviews you
briefly and generates a filled suite in `<project>/docs/planning/`.

## License

[Apache-2.0](LICENSE) — © Emmanuel Alanis.

---

## Español

> Una guía moderna de planeación para quien quiere construir un proyecto web con
> IA y no tiene idea de por dónde empezar.

La IA puede escribir tu código, pero no puede decidir qué estás construyendo.
Esa parte es tuya. Esta suite bilingüe de documentos de planeación te lleva de
"tengo una idea" a una especificación completa y construible, más un skill de
Claude Code que la genera por ti. Nació de la ingeniería inversa de un handoff
de requerimientos real que funcionó bien, extendido con lo que suele faltar:
contratos de API, requisitos no funcionales, seguridad con mapeo OWASP Top 10,
plan de pruebas, plan de entrega y matriz de trazabilidad.

Instalación: `./install.sh` o ver [INSTALL.md](INSTALL.md). Las plantillas son
Markdown puro y funcionan sin Claude Code; el skill agrega `/planning-suite`.
Empieza por `planning-template/es/_GUIA.md`.
