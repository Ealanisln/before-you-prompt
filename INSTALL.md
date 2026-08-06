# Planning Suite v1.1 — Guía de instalación / Installation Guide

Suite bilingüe (ES/EN) de documentos de planeación de proyectos, más un skill de
Claude Code que la genera automáticamente.

---

## Español

### ¿Qué incluye?

```
before-you-prompt/
├── INSTALL.md                  ← esta guía
├── install.sh                  ← instalador (macOS / Linux)
├── planning-template/          ← plantillas navegables
│   ├── es/                     ← 13 documentos en español
│   └── en/                     ← 13 documentos en inglés
└── skill/planning-suite/       ← skill de Claude Code
    ├── SKILL.md
    └── assets/es|en/           ← copia de las plantillas que usa el skill
```

La suite cubre: historias de usuario, especificación técnica, contratos de API,
requisitos no funcionales, seguridad (con mapeo OWASP Top 10 2021), deep-dives de
integraciones, plan de pruebas, plan de entrega, matriz de trazabilidad y registro
de pendientes. Empieza por `planning-template/es/_GUIA.md`.

### Requisitos

- Para usar solo las plantillas: nada, son Markdown.
- Para usar el skill: [Claude Code](https://claude.com/claude-code) instalado.

### Instalación automática (macOS / Linux)

```bash
cd before-you-prompt
./install.sh
```

Copia el skill a `~/.claude/skills/planning-suite/` y las plantillas a
`~/planning-template/` (pregunta antes de sobrescribir).

### Instalación manual

1. Copia el skill:
   ```bash
   cp -R skill/planning-suite ~/.claude/skills/planning-suite
   ```
2. Copia `planning-template/` a donde quieras tenerla como referencia.
3. En Windows, la carpeta de skills es `%USERPROFILE%\.claude\skills\`.

### Uso

En cualquier proyecto, dentro de Claude Code:

```
/planning-suite
```

El skill entrevista brevemente (objetivo, actores, alcance, integraciones),
decide entre corte mínimo o suite completa, elige idioma ES/EN según el proyecto
y genera los documentos en `<proyecto>/docs/planning/`.

También puedes copiar las plantillas a mano desde `planning-template/` y llenar
los marcadores `{{...}}` siguiendo los comentarios `<!-- instrucción: ... -->`.

---

## English

### What's included

Bilingual (ES/EN) project-planning document suite plus a Claude Code skill that
generates it. See the tree above; start at `planning-template/en/_GUIDE.md`.

The suite covers: user stories, technical specification, API contracts,
non-functional requirements, security (with an OWASP Top 10 2021 mapping),
integration deep-dives, test plan, delivery plan, traceability matrix, and an
open-items register.

### Requirements

- Templates only: none — they are plain Markdown.
- Skill: [Claude Code](https://claude.com/claude-code) installed.

### Install

Automatic (macOS / Linux): `./install.sh`

Manual:

1. Copy the skill: `cp -R skill/planning-suite ~/.claude/skills/planning-suite`
2. Copy `planning-template/` anywhere you want it as a browsable reference.
3. On Windows, the skills folder is `%USERPROFILE%\.claude\skills\`.

### Usage

Run `/planning-suite` inside Claude Code in any project. It runs a short
interview, picks the minimal or full suite, chooses ES/EN based on the project,
and generates the documents under `<project>/docs/planning/`. You can also copy
templates by hand and fill the `{{...}}` placeholders following the
`<!-- instruction -->` comments.
