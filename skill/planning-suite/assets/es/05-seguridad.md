# Consideraciones de seguridad — {{PROYECTO}}

> {{CONTEXTO_DE_RIESGO — p. ej. "Esta aplicación maneja PII sensible (nombre, domicilio,
> datos bancarios). Aplica la LFPDPPP: se requiere aviso de privacidad y consentimiento
> explícito antes de capturar datos."}}
> <!-- instrucción: abre declarando qué datos sensibles maneja el sistema y qué marco legal o normativo aplica. Eso justifica el resto del documento. -->

## 1. Autenticación y sesión (OWASP A07)

<!-- instrucción: por cada actor, mecanismo de autenticación y reglas concretas (expiración, hash, intentos, rate limit). Valores específicos, no "seguro". -->

- **{{ACTOR_1}} ({{MECANISMO}}):**
  - {{REGLA — p. ej. OTP de 6 dígitos, expira en 5 min, un solo uso, almacenado hasheado}}.
  - {{REGLA — máximo de intentos y rate limit por identificador e IP}}.
- **{{ACTOR_2}} ({{MECANISMO}}):**
  - Hash de contraseña con **argon2id o bcrypt** (nunca MD5/SHA plano).
  - {{POLITICA — bloqueo por intentos, 2FA si hay acceso a PII}}.
- **Sesiones** con expiración e invalidación en logout. Cookies `HttpOnly`, `Secure`,
  `SameSite`.

## 2. Autorización (IDOR / control de acceso) (OWASP A01)

- **El identificador del usuario SIEMPRE se toma del token de sesión, nunca del
  body/query.** Un endpoint que confía en un `usuario_id` del cliente es un IDOR.
- **RBAC:** {{ROLES_Y_PERMISOS_POR_ACCION}}.

> Precedente interno: {{CASO_PREVIO — hallazgo o incidente propio que justifica la regla;
> p. ej. "en el sistema X hubo IDOR por confiar en el user_id del body en vez del JWT.
> No repetir ese patrón aquí."}}
> <!-- instrucción: el bloque "Precedente interno" ancla la regla en experiencia real de la organización; si no hay precedente, elimina el blockquote. -->

## 3. Carga de archivos (OWASP A03 / A05)

<!-- instrucción: elimina esta sección si el sistema no recibe archivos. -->

- Validar tipo por **contenido (magic bytes)**, no por extensión ni `Content-Type` del
  cliente.
- Límite de peso ({{MB}} MB) forzado en **backend**.
- Almacenamiento **privado**, cifrado en reposo; acceso solo por **URL prefirmada** de
  corta duración tras validar sesión y propiedad.
- Llave/ruta de almacenamiento generada **server-side** (nunca el nombre original del
  archivo → evita path traversal).
- Servir descargas con `Content-Disposition: attachment`; nunca renderizar HTML subido.

## 4. Datos, retención y cumplimiento

- **Aviso de privacidad** visible antes de capturar datos.
- **Cifrado en reposo:** {{ESTRATEGIA — almacenamiento y columnas sensibles}}.
- **Retención y borrado:** {{POLITICA}} (decidido {{FECHA}}) / pendiente {{P-xx}}.
- **Bitácora de auditoría** para toda acción sobre PII.

## 5. Transporte y cabeceras (OWASP A02 / A05)

- **TLS obligatorio** en todo el tráfico.
- Cabeceras: `Content-Security-Policy`, `X-Content-Type-Options: nosniff`,
  `X-Frame-Options` / `frame-ancestors`.
- **Validación de entrada server-side** para todos los campos.
- Protección **CSRF** en formularios con sesión; **XSS** con escape/CSP; **SSRF**:
  validar todo identificador que arme una URL.

## 6. Secretos y dependencias (OWASP A02 / A06)

- **Secretos** (llaves, credenciales, tokens) fuera del repositorio: variables de
  entorno o gestor de secretos. Nunca en el front ni en el control de versiones.
- Dependencias con {{ESTRATEGIA — auditoría periódica, lockfiles, renovación}}.

## 7. Riesgo asumido

<!-- instrucción: trade-offs de seguridad ACEPTADOS conscientemente por negocio. Documentarlos aquí evita que reaparezcan como "hallazgo" en cada auditoría. Cada uno con su mitigación parcial y quién lo aceptó. -->

| Riesgo | Por qué se acepta | Mitigación parcial | Aceptado por / fecha |
|---|---|---|---|
| {{RIESGO — p. ej. mensaje de "ya existe registro" permite enumeración}} | {{RAZON — UX del negocio}} | {{MITIGACION — rate limit + CAPTCHA}} | {{RESPONSABLE}} / {{FECHA}} |

## 8. Mapeo de controles

<!-- instrucción: cierra ligando cada control a lo que protege y quién lo implementa. Severidad: crítica / alta / media / baja. Responsable con etiquetas [N] / [TI] / [PROV]. -->

| Control | Severidad | HU / Endpoint relacionado | Responsable |
|---|---|---|---|
| {{CONTROL — p. ej. OTP hasheado + rate limit}} | {{SEVERIDAD}} | {{HU-xx / METODO /ruta}} | {{[TI]/[PROV]}} |
| {{CONTROL}} | {{SEVERIDAD}} | {{HU-xx}} | {{RESPONSABLE}} |

## 9. Mapeo OWASP Top 10 (2021)

<!-- instrucción: checklist de cobertura contra el OWASP Top 10. Por cada categoría: ¿Aplica? = sí / no (con razón breve si no); "Controles en este proyecto" cita las secciones de este documento u otros controles; Estatus: cubierto / parcial / pendiente (P-xx). Ninguna fila se borra: una categoría que no aplica se marca "no" con su razón. -->

| Categoría | ¿Aplica? | Controles en este proyecto | HU/Endpoint relacionado | Estatus |
|---|---|---|---|---|
| A01 — Broken Access Control <!-- instrucción: IDOR, RBAC, propiedad del recurso, endpoints sin autorización (ver §2) --> | {{sí/no}} | {{CONTROLES}} | {{HU-xx}} | {{ESTATUS}} |
| A02 — Cryptographic Failures <!-- instrucción: TLS, cifrado en reposo, hashes de contraseña/OTP, secretos expuestos (ver §5, §6) --> | {{sí/no}} | {{CONTROLES}} | {{HU-xx}} | {{ESTATUS}} |
| A03 — Injection <!-- instrucción: SQLi, XSS, inyección de comandos; queries parametrizadas, escape de salida, validación de entrada --> | {{sí/no}} | {{CONTROLES}} | {{HU-xx}} | {{ESTATUS}} |
| A04 — Insecure Design <!-- instrucción: flujos abusables por diseño (enumeración, reintentos sin límite, lógica de negocio explotable); revisar contra §7 Riesgo asumido --> | {{sí/no}} | {{CONTROLES}} | {{HU-xx}} | {{ESTATUS}} |
| A05 — Security Misconfiguration <!-- instrucción: cabeceras, CORS, buckets/ACLs, mensajes de error verbosos, defaults inseguros --> | {{sí/no}} | {{CONTROLES}} | {{HU-xx}} | {{ESTATUS}} |
| A06 — Vulnerable and Outdated Components <!-- instrucción: dependencias con CVEs, lockfiles, política de actualización (ver §6) --> | {{sí/no}} | {{CONTROLES}} | {{HU-xx}} | {{ESTATUS}} |
| A07 — Identification and Authentication Failures <!-- instrucción: fuerza bruta, sesiones, expiración de tokens, credenciales débiles (ver §1) --> | {{sí/no}} | {{CONTROLES}} | {{HU-xx}} | {{ESTATUS}} |
| A08 — Software and Data Integrity Failures <!-- instrucción: CI/CD sin verificación, deserialización insegura, actualizaciones sin firma --> | {{sí/no}} | {{CONTROLES}} | {{HU-xx}} | {{ESTATUS}} |
| A09 — Security Logging and Monitoring Failures <!-- instrucción: bitácora de acciones sensibles, alertas ante abuso, logs sin PII (ver 04 §7) --> | {{sí/no}} | {{CONTROLES}} | {{HU-xx}} | {{ESTATUS}} |
| A10 — Server-Side Request Forgery (SSRF) <!-- instrucción: URLs armadas con datos del cliente, fetch de recursos remotos, webhooks configurables --> | {{sí/no}} | {{CONTROLES}} | {{HU-xx}} | {{ESTATUS}} |

**APIs:** si el proyecto es intensivo en API, revisar además el **OWASP API Security
Top 10** (autorización a nivel de objeto y de propiedad, consumo sin límites) sobre
[`03-contratos-de-api.md`](03-contratos-de-api.md).

**Verificación a profundidad:** para auditorías formales, el estándar de referencia es
**OWASP ASVS**; el nivel objetivo ({{L1/L2}}) se registra como {{P-xx}} si aún no se
decide.
