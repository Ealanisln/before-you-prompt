# Matriz de trazabilidad — {{PROYECTO}}

> Mapa completo HU ↔ endpoints ↔ datos ↔ pantallas ↔ pruebas ↔ pendientes.
> Es el **checklist de cierre** del proyecto: se actualiza cada vez que cambia
> cualquier documento de la suite, y una fila con huecos es trabajo sin terminar.

---

## 1. Matriz

<!-- instrucción: una fila por HU. Endpoints según 03-contratos-de-api.md; tablas según 02-especificacion-tecnica.md; pantallas según el handoff de diseño (11-handoff-diseno.md); casos según 07-plan-de-pruebas.md; pendientes como P-xx. Usa "—" cuando algo no aplique de verdad, nunca lo dejes vacío. -->

| HU | Endpoint(s) | Tabla(s) de datos | Pantalla(s) | Caso(s) de prueba | Pendiente(s) |
|---|---|---|---|---|---|
| HU-01 | {{METODO /ruta}} | `{{PREFIJO}}_{{tabla}}` | {{PANTALLA}} | CP-01, CP-02 | {{P-xx / —}} |
| HU-{{NN}} | {{ENDPOINTS}} | {{TABLAS}} | {{PANTALLAS}} | {{CP-xx}} | {{P-xx / —}} |

## 2. Reglas de mantenimiento

- **La trazabilidad es de ida y vuelta:** toda HU debe tener endpoints, datos y pruebas;
  y todo endpoint, tabla o caso de prueba debe pertenecer a alguna HU. Un artefacto sin
  HU es alcance no autorizado; una HU sin pruebas es alcance sin verificar.
- Antes de dar por cerrada una fase, revisa que **ninguna fila de sus HUs tenga huecos**
  ni pendientes `P-xx` en estatus `abierto`.
- Si un elemento no aplica (p. ej. una HU sin pantalla), escribe `—` de forma
  deliberada; el hueco vacío significa "falta trabajo", el guion significa "no aplica".
