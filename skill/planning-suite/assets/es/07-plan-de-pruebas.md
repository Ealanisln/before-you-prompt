# Plan de pruebas — {{PROYECTO}}

> Estrategia y casos de prueba del proyecto. Todo caso de prueba se liga a una historia
> (`HU-xx`) y aparece en la [`09-matriz-de-trazabilidad.md`](09-matriz-de-trazabilidad.md).
> Convención de IDs: `CP-01`, `CP-02`…

---

## 1. Estrategia por nivel

<!-- instrucción: qué se prueba en cada nivel, con qué herramienta y quién es responsable. Elimina niveles que no apliquen, deliberadamente. -->

| Nivel | Alcance | Herramienta | Responsable |
|---|---|---|---|
| Unitarias | {{LOGICA_DE_NEGOCIO_Y_VALIDACIONES}} | {{HERRAMIENTA}} | {{[PROV]/[TI]}} |
| Integración | {{API + BD + SERVICIOS_EXTERNOS_MOCKEADOS}} | {{HERRAMIENTA}} | {{RESPONSABLE}} |
| E2E | {{FLUJOS_CRITICOS_COMPLETOS}} | {{HERRAMIENTA}} | {{RESPONSABLE}} |
| UAT | {{VALIDACION_DE_NEGOCIO_EN_QA}} | Manual, guiada por casos CP-xx | {{[N]}} |

## 2. Casos de prueba

<!-- instrucción: deriva los casos de los criterios de aceptación de cada HU: cada criterio genera al menos un caso, y los negativos/de borde son obligatorios. Tipo: positivo / negativo. -->

| ID | HU relacionada | Escenario | Datos | Resultado esperado | Tipo |
|---|---|---|---|---|---|
| CP-01 | HU-01 | {{ESCENARIO_FELIZ}} | {{DATOS}} | {{RESULTADO}} | positivo |
| CP-02 | HU-01 | {{ESCENARIO_DE_RECHAZO_O_BORDE}} | {{DATOS}} | {{RECHAZO_ESPERADO}} | negativo |
| CP-{{NN}} | HU-{{NN}} | {{ESCENARIO}} | {{DATOS}} | {{RESULTADO}} | {{TIPO}} |

## 3. Matriz de dispositivos

<!-- instrucción: en qué combinaciones se ejecutan las pruebas manuales/E2E; alinea con la matriz de soporte de 04-requisitos-no-funcionales.md. -->

| Dispositivo / navegador | Versión | Casos que se ejecutan |
|---|---|---|
| {{Android gama media / Chrome}} | {{VERSION}} | {{TODOS / CP-xx…}} |
| {{iPhone / Safari}} | {{VERSION}} | {{CASOS}} |
| {{Desktop / Chrome}} | {{VERSION}} | {{CASOS}} |

## 4. Datos de prueba y ambientes

<!-- instrucción: dónde se prueba y con qué datos. Nunca PII real de terceros; usa datos sintéticos o casos de prueba autorizados. Cita los sandbox de los deep-dives (06-integraciones/). -->

- Ambiente de pruebas: {{URL_QA}} (ver [`08-plan-de-entrega.md`](08-plan-de-entrega.md)).
- Datos sintéticos: {{COMO_SE_GENERAN_O_DONDE_VIVEN}}.
- Servicios externos: {{SANDBOX_O_MOCK_POR_INTEGRACION}}.

## 5. Criterios de salida / UAT sign-off

<!-- instrucción: condiciones objetivas para dar por probado el proyecto; el sign-off es el acta de aceptación de negocio. -->

- 100 % de los casos `Must` ejecutados y en verde; sin defectos {{CRITICOS/ALTOS}} abiertos.
- {{UMBRAL — p. ej. cobertura mínima de unitarias, defectos medios con plan}}.
- UAT firmado por **{{APROBADOR_DE_NEGOCIO}}** el {{FECHA}}.

| Ciclo UAT | Fecha | Resultado | Observaciones |
|---|---|---|---|
| 1 | {{FECHA}} | {{aprobado / rechazado}} | {{NOTAS}} |
