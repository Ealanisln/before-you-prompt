# Historias de usuario — {{PROYECTO}}

> Cada historia se documenta con **ID / Rol / Nombre / Prioridad / Fase / Dependencias / Anexos**,
> **Descripción** ("Yo como… requiero…, para…"), **Reglas de Negocio** (numeradas),
> **Criterios de aceptación** (Dado / Cuando / Entonces),
> **Comentarios de refinamiento** y **Control de cambios**.
> Convención de IDs: `HU-01`, `HU-02`… — con guion y dos dígitos, citada igual en todos los documentos.

## Índice de historias

<!-- instrucción: una fila por historia. Prioridad con MoSCoW: Must / Should / Could / Won't. Fase = fase de entrega según 08-plan-de-entrega.md. -->

| HU | Rol | Funcionalidad | Prioridad | Fase |
|---|---|---|---|---|
| HU-01 | {{ROL}} | {{FUNCIONALIDAD}} | Must | 1 |
| HU-02 | {{ROL}} | {{FUNCIONALIDAD}} | {{PRIORIDAD}} | {{FASE}} |

---

## HU-01 — Inicio de sesión por celular + OTP (EJEMPLO RESUELTO)

<!-- instrucción: esta historia es un EJEMPLO genérico completamente resuelto; úsala como referencia de nivel de detalle y bórrala o sustitúyela por una historia real del proyecto. -->

| ID | Rol | Nombre | Prioridad (MoSCoW) | Fase | Dependencias | Anexos |
|---|---|---|---|---|---|---|
| HU-01 | Usuario final | Inicio de sesión por celular y código OTP | Must | 1 | — | [`03-contratos-de-api.md`](03-contratos-de-api.md), [`05-seguridad.md`](05-seguridad.md) |

**Descripción de la funcionalidad**

Yo como **usuario final** requiero iniciar sesión con mi número de celular y un código
de un solo uso, para acceder de forma segura y sin contraseña a la aplicación.

**Reglas de Negocio**

| # | Regla |
|---|---|
| 1 | El acceso es únicamente por **celular + OTP**; no existe contraseña para este actor. |
| 2 | El OTP es numérico de **6 dígitos**, **expira** en 5 minutos y es de **un solo uso**. |
| 3 | El OTP se almacena **hasheado**; nunca viaja de regreso al cliente ni se registra en logs. |
| 4 | Hay un máximo de **5 intentos** por código y **rate limit** por celular e IP. |
| 5 | El reenvío del código es controlado: máximo 3 reenvíos por sesión de login. |
| 5.1 | Al agotar los reenvíos, se bloquea el flujo 15 minutos y se muestra un mensaje claro con el tiempo de espera. |
| 6 | Un OTP válido inicia sesión con token de expiración; uno inválido o expirado muestra mensaje claro con opción de reenvío. |

**Criterios de aceptación**

<!-- instrucción: formato Dado/Cuando/Entonces. TODA regla de negocio debe estar cubierta por al menos un criterio, y los casos negativos y de borde (expirado, agotado, duplicado, límite exacto) son OBLIGATORIOS, no opcionales. La columna "Regla(s)" cierra el mapeo. -->

| # | Dado | Cuando | Entonces | Regla(s) |
|---|---|---|---|---|
| 1 | Un usuario registrado con celular válido | Solicita el código y captura el OTP vigente | Inicia sesión y recibe token de sesión con expiración | 1, 2, 6 |
| 2 | Un OTP emitido hace más de 5 minutos | El usuario lo captura | El acceso se rechaza con mensaje de expiración y opción de reenvío | 2, 6 |
| 3 | Un OTP ya utilizado | El usuario lo captura de nuevo | El acceso se rechaza; el código no es reutilizable | 2 |
| 4 | Un usuario que falló 5 veces el mismo código | Intenta una sexta vez | El código queda invalidado y debe solicitar uno nuevo | 4 |
| 5 | Un usuario que agotó los 3 reenvíos | Solicita otro reenvío | El flujo se bloquea 15 minutos con mensaje del tiempo de espera | 5, 5.1 |
| 6 | La base de datos de códigos | Se inspecciona tras emitir un OTP | El código está hasheado y no aparece en logs de la aplicación | 3 |

**Comentarios de refinamiento**

_Pendiente: definir canal del OTP (SMS / WhatsApp / email) y proveedor. Ver P-01 en
[`10-pendientes-por-detallar.md`](10-pendientes-por-detallar.md)._

**Control de cambios**

| Versión | Fecha | Autor | Cambio |
|---|---|---|---|
| 1.0 | {{FECHA}} | {{AUTOR}} | Versión inicial |

---

## HU-{{NN}} — {{NOMBRE_DE_LA_FUNCIONALIDAD}}

<!-- instrucción: bloque plantilla vacío; duplícalo por cada historia del proyecto. -->

| ID | Rol | Nombre | Prioridad (MoSCoW) | Fase | Dependencias | Anexos |
|---|---|---|---|---|---|---|
| HU-{{NN}} | {{ROL}} | {{NOMBRE}} | {{Must/Should/Could/Won't}} | {{FASE}} | {{HU-xx o —}} | {{LINKS_O_—}} |

**Descripción de la funcionalidad**

Yo como **{{ROL}}** requiero {{ACCION}}, para {{BENEFICIO}}.

**Reglas de Negocio**

<!-- instrucción: numeradas 1, 2, 3…; usa sub-numeración (5.1, 5.2) para excepciones o variantes de una regla. Textos de UI entre *cursivas y comillas*. -->

| # | Regla |
|---|---|
| 1 | {{REGLA}} |
| 2 | {{REGLA}} |

**Criterios de aceptación**

<!-- instrucción: cada regla de negocio debe aparecer en la columna "Regla(s)" de al menos un criterio. Incluye siempre casos negativos y de borde. -->

| # | Dado | Cuando | Entonces | Regla(s) |
|---|---|---|---|---|
| 1 | {{CONTEXTO}} | {{ACCION}} | {{RESULTADO_ESPERADO}} | {{N}} |
| 2 | {{CONTEXTO_NEGATIVO}} | {{ACCION}} | {{RECHAZO_O_ERROR_ESPERADO}} | {{N}} |

**Comentarios de refinamiento**

_{{DUDAS_ABIERTAS_O_ACUERDOS_DE_REFINAMIENTO; cita pendientes como P-xx.}}_

**Control de cambios**

| Versión | Fecha | Autor | Cambio |
|---|---|---|---|
| 1.0 | {{FECHA}} | {{AUTOR}} | Versión inicial |
