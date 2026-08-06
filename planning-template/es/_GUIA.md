# Guía de uso de la plantilla de planeación

> Este documento explica **cómo usar la suite**, no forma parte del entregable final.
> Elimínalo (o consérvalo como referencia interna) cuando la documentación del proyecto
> esté lista para entregarse.

---

## 1. Lógica de orden de los documentos

La suite sigue una progresión deliberada: **QUÉ → CÓMO → RIESGO → PROFUNDIZACIÓN →
CALIDAD → ENTREGA → INCÓGNITAS**.

| Orden | Documento | Pregunta que responde |
|---|---|---|
| QUÉ | [`README.md`](README.md) + [`01-historias-de-usuario.md`](01-historias-de-usuario.md) | ¿Qué se va a construir y para quién? |
| CÓMO | [`02-especificacion-tecnica.md`](02-especificacion-tecnica.md) + [`03-contratos-de-api.md`](03-contratos-de-api.md) + [`04-requisitos-no-funcionales.md`](04-requisitos-no-funcionales.md) | ¿Cómo se construye y con qué restricciones? |
| RIESGO | [`05-seguridad.md`](05-seguridad.md) | ¿Qué puede salir mal y qué trade-offs se aceptan? |
| PROFUNDIZACIÓN | [`06-integraciones/`](06-integraciones/plantilla-deep-dive.md) | ¿Qué integraciones difíciles requieren detalle extra? |
| CALIDAD | [`07-plan-de-pruebas.md`](07-plan-de-pruebas.md) | ¿Cómo se valida que funciona? |
| ENTREGA | [`08-plan-de-entrega.md`](08-plan-de-entrega.md) + [`09-matriz-de-trazabilidad.md`](09-matriz-de-trazabilidad.md) | ¿Cómo llega a producción y cómo se verifica que nada quedó suelto? |
| INCÓGNITAS | [`10-pendientes-por-detallar.md`](10-pendientes-por-detallar.md) | ¿Qué decisiones siguen abiertas? |

[`PROMPT-DISENO.md`](PROMPT-DISENO.md) es un meta-documento transversal: se usa cuando
el proyecto requiere prototipo/diseño visual y reserva `11-handoff-diseno.md`.

## 2. Convenciones de identificadores

Usa **siempre** el mismo formato con guion en todos los documentos:

| Prefijo | Significado | Ejemplo | Definido en |
|---|---|---|---|
| `HU-xx` | Historia de usuario | `HU-01` | `01-historias-de-usuario.md` |
| `P-xx` | Pendiente por detallar | `P-03` | `10-pendientes-por-detallar.md` |
| `CP-xx` | Caso de prueba | `CP-12` | `07-plan-de-pruebas.md` |

Reglas:

- Numeración con dos dígitos (`HU-01`, no `HU1` ni `HU01`).
- Los demás documentos **citan** estos IDs, nunca duplican su contenido.
- Las reglas de negocio dentro de una HU se numeran `1, 2, 3…`; las excepciones o
  sub-reglas usan sub-numeración (`5.1`, `5.2`).

## 3. Etiquetas de responsable

Toda decisión o pendiente lleva responsable con estas etiquetas:

- **[N]** — negocio / área usuaria.
- **[TI]** — equipo de TI interno.
- **[PROV]** — proveedor / equipo de desarrollo externo.

## 4. Sello de decisión con fecha

Cuando una decisión se toma, se documenta **en el lugar donde estaba la duda**, con el
sello `(decidido {{FECHA}})`. Nunca se borra la pregunta original: se conserva el
historial de cómo se llegó a la decisión.

## 5. Recorte mínimo para proyectos pequeños

No todo proyecto necesita la suite completa. El **corte mínimo** es:

| Documento | ¿Por qué es irrenunciable? |
|---|---|
| `README.md` | Hub: objetivo, alcance, actores, índice. |
| `01-historias-de-usuario.md` | El QUÉ con criterios de aceptación. |
| `02-especificacion-tecnica.md` | El CÓMO: validaciones y modelo de datos. |
| `10-pendientes-por-detallar.md` | Las incógnitas nunca se dejan implícitas. |

Los documentos 03, 04, 05, 07, 08 y 09 se agregan cuando el proyecto crece en
superficie de API, requisitos operativos, riesgo o equipo. `PROMPT-DISENO.md` solo si
hay entregable visual.

## 6. Regla de los deep-dives

**Deep-dives solo para integraciones difíciles.** Un documento en `06-integraciones/`
se justifica únicamente cuando la integración es externa, legada, mal documentada o con
protocolo no trivial (SOAP, colas, hardware, un core bancario, etc.). Una API REST
moderna y bien documentada NO necesita deep-dive: basta citarla en
`03-contratos-de-api.md`.

## 7. Cómo llenar las plantillas

1. Sustituye todo marcador `{{ASI}}` por el valor real.
2. Los comentarios `<!-- instrucción: ... -->` te dicen qué va en cada sección;
   **elimínalos** en el documento final.
3. Si una sección no aplica, elimínala **deliberadamente** (no la dejes vacía) y, si la
   omisión es relevante, regístrala en `10-pendientes-por-detallar.md`.
4. Mantén sincronizados el índice/estatus del `README.md` y la
   `09-matriz-de-trazabilidad.md` cada vez que un documento cambie.
