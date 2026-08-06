# Pendientes por detallar — {{PROYECTO}}

> Registro vivo de decisiones abiertas antes de poder estimar/construir sin supuestos.
> Convención de IDs: `P-01`, `P-02`… Los demás documentos citan estos IDs.
> Responsables: **[N]** negocio, **[TI]** TI interno, **[PROV]** proveedor.

---

## 1. Registro de pendientes

<!-- instrucción: una fila por decisión abierta. Severidad: crítica (bloquea la construcción) / alta (bloquea una HU) / media / baja. Estatus: abierto / en gestión / decidido. REGLA DE ORO: cuando se decide, NO se borra la fila — se cambia el estatus a "decidido" y se escribe la resolución con fecha en la última columna. El historial de decisiones se conserva siempre. -->

| ID | Título | Área | Responsable | Bloquea a | Severidad | Estatus | Resolución + fecha |
|---|---|---|---|---|---|---|---|
| P-01 | {{TITULO_CORTO — p. ej. Canal del OTP (SMS/WhatsApp) y proveedor}} | {{producto / identidad / datos / técnico / diseño}} | {{[N][TI]}} | {{HU-01}} | {{alta}} | abierto | — |
| P-02 | {{TITULO}} | {{AREA}} | {{RESPONSABLE}} | {{HU-xx / —}} | {{SEVERIDAD}} | {{ESTATUS}} | {{— o "Decidido: RESOLUCION (decidido FECHA)"}} |

## 2. Detalle de pendientes

<!-- instrucción: opcional — para pendientes que necesitan más contexto que una fila. Mismo ID; la resolución se escribe AQUI MISMO con el sello "(decidido FECHA)", debajo de la pregunta original, sin borrarla. -->

### P-01 — {{TITULO}}

{{CONTEXTO_DE_LA_DUDA: qué falta decidir, opciones sobre la mesa, impacto en costo o
alcance.}}

→ **Decidido ({{FECHA}}):** {{RESOLUCION_Y_QUIEN_LA_TOMO}}.

## 3. Resumen de cortes de decisión

<!-- instrucción: cada vez que haya una sesión de decisiones, agrega un blockquote con la fecha y los pendientes resueltos ese día. Es el changelog de decisiones del proyecto. -->

> **Decisiones tomadas el {{FECHA}}:** {{P-xx: resolución corta}}; {{P-xx: resolución
> corta}}.
