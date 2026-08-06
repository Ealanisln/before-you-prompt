# {{PROYECTO}} — Requerimiento y handoff

> Documento de requerimiento para {{CLIENTE_O_VENDOR}}.
> Autor: {{AUTOR}}. Fecha: {{FECHA}}.
> <!-- instrucción: este preámbulo fija el alcance y la autoridad del documento; indica quién lo emite, para quién y con qué fecha de corte. -->

## 1. Objetivo

<!-- instrucción: 1–2 párrafos. Qué se construye, para quién y qué problema resuelve. Si el proceso tiene pasos o fases de alto nivel, enuméralos aquí (como lista numerada). -->

{{OBJETIVO_DEL_PROYECTO}}

## 2. Resumen ejecutivo

<!-- instrucción: bullets con las decisiones y rasgos clave del requerimiento: público, control de flujo, integraciones, persistencia, restricciones fuertes. Cada bullet inicia con un concepto en negritas. Incluye sellos "(decidido {{FECHA}})" cuando aplique. -->

- **{{CONCEPTO_1}}:** {{DESCRIPCION}}
- **{{CONCEPTO_2}}:** {{DESCRIPCION}}
- **Persistencia:** {{BD_Y_ALMACENAMIENTO}}

## 3. Alcance

Incluye:

<!-- instrucción: lista con link a cada documento hermano y su propósito en una línea. Ajusta según el corte elegido (mínimo o completo, ver _GUIA.md). -->

- Historias de usuario con criterios de aceptación → [`01-historias-de-usuario.md`](01-historias-de-usuario.md)
- Especificación técnica: validaciones, modelo de datos, estados → [`02-especificacion-tecnica.md`](02-especificacion-tecnica.md)
- Contratos de API → [`03-contratos-de-api.md`](03-contratos-de-api.md)
- Requisitos no funcionales → [`04-requisitos-no-funcionales.md`](04-requisitos-no-funcionales.md)
- Consideraciones de seguridad → [`05-seguridad.md`](05-seguridad.md)
- Deep-dives de integraciones difíciles → [`06-integraciones/`](06-integraciones/plantilla-deep-dive.md)
- Plan de pruebas → [`07-plan-de-pruebas.md`](07-plan-de-pruebas.md)
- Plan de entrega → [`08-plan-de-entrega.md`](08-plan-de-entrega.md)
- Matriz de trazabilidad → [`09-matriz-de-trazabilidad.md`](09-matriz-de-trazabilidad.md)
- Pendientes por detallar (decisiones que faltan) → [`10-pendientes-por-detallar.md`](10-pendientes-por-detallar.md)
- Prompt para prototipo/diseño y handoff visual → [`PROMPT-DISENO.md`](PROMPT-DISENO.md)

**Fuera de alcance (por ahora):**

<!-- instrucción: lista explícita de lo que NO se construye en esta iteración. Evita malentendidos con el proveedor. Cierra indicando qué es este proyecto respecto al sistema mayor, si aplica. -->

{{FUERA_DE_ALCANCE}}

## 4. Actores

| Actor | Descripción | Autenticación |
|---|---|---|
| **{{ACTOR_1}}** | {{DESCRIPCION}} | {{MECANISMO_AUTH}} |
| **{{ACTOR_2}}** | {{DESCRIPCION}} | {{MECANISMO_AUTH}} |

## 5. Glosario

<!-- instrucción: define todo término del dominio, sigla o nombre de sistema que un lector externo no conocería. Formato: término en negritas + definición de una línea. -->

- **{{TERMINO_1}}:** {{DEFINICION}}
- **{{TERMINO_2}}:** {{DEFINICION}}

## 6. Índice de documentos

<!-- instrucción: tabla con TODOS los documentos de la carpeta y su propósito en una línea. Es el mapa de navegación; mantenlo sincronizado al agregar o quitar documentos. -->

| Documento | Propósito |
|---|---|
| [`01-historias-de-usuario.md`](01-historias-de-usuario.md) | Historias de usuario con reglas de negocio y criterios de aceptación |
| [`02-especificacion-tecnica.md`](02-especificacion-tecnica.md) | Validaciones, modelo de datos, migraciones, flujo de estados |
| [`03-contratos-de-api.md`](03-contratos-de-api.md) | Convenciones y contratos por endpoint |
| [`04-requisitos-no-funcionales.md`](04-requisitos-no-funcionales.md) | Performance, SLA, dispositivos, límites, observabilidad |
| [`05-seguridad.md`](05-seguridad.md) | Controles, riesgos asumidos y mapeo de severidad |
| [`06-integraciones/`](06-integraciones/plantilla-deep-dive.md) | Deep-dives de integraciones difíciles (uno por integración) |
| [`07-plan-de-pruebas.md`](07-plan-de-pruebas.md) | Estrategia y casos de prueba, criterios de salida |
| [`08-plan-de-entrega.md`](08-plan-de-entrega.md) | Fases, ambientes, go-live, rollback, operación |
| [`09-matriz-de-trazabilidad.md`](09-matriz-de-trazabilidad.md) | HU ↔ endpoints ↔ datos ↔ pantallas ↔ pruebas |
| [`10-pendientes-por-detallar.md`](10-pendientes-por-detallar.md) | Registro vivo de decisiones abiertas (P-xx) |
| [`PROMPT-DISENO.md`](PROMPT-DISENO.md) | Prompt de diseño y encargo del handoff visual |

## 7. Estatus y aprobaciones

<!-- instrucción: estado editorial de cada documento de la suite. Valores de estatus: borrador / en revisión / aprobado. Actualiza esta tabla en cada corte; es la fuente de verdad de qué ya se puede construir. -->

| Documento | Estatus | Aprobador | Fecha |
|---|---|---|---|
| `README.md` | borrador | {{APROBADOR}} | — |
| `01-historias-de-usuario.md` | borrador | {{APROBADOR}} | — |
| `02-especificacion-tecnica.md` | borrador | {{APROBADOR}} | — |
| `10-pendientes-por-detallar.md` | borrador | {{APROBADOR}} | — |
<!-- instrucción: agrega una fila por cada documento adicional incluido en el corte. -->

## 8. Historial de cambios de la suite

<!-- instrucción: una fila por cada versión entregada del paquete completo (no por cada edición menor). -->

| Versión | Fecha | Autor | Cambio |
|---|---|---|---|
| 1.0 | {{FECHA}} | {{AUTOR}} | Versión inicial |
