# Contratos de API — {{PROYECTO}}

> Contrato entre frontend y backend (o entre {{CLIENTE_O_VENDOR}} y sistemas internos).
> Todo endpoint nuevo se documenta aquí **antes** de construirse y se liga a su HU.

---

## 1. Convenciones globales

<!-- instrucción: define una sola vez lo transversal; los endpoints solo documentan lo que se desvía de estas convenciones. -->

### 1.1 Autenticación

| Mecanismo | Header | Aplica a |
|---|---|---|
| {{Bearer JWT / API key / sesión}} | `Authorization: Bearer {{token}}` | {{QUE_ENDPOINTS}} |

### 1.2 Envelope estándar de error

Toda respuesta de error usa este JSON:

```json
{
  "error": {
    "codigo": "{{CODIGO_INTERNO}}",
    "mensaje": "{{Mensaje legible para el usuario}}",
    "detalle": "{{Opcional: contexto técnico, nunca stack traces ni PII}}"
  }
}
```

### 1.3 Códigos de estado

| Código | Uso |
|---|---|
| 200 / 201 | Éxito / recurso creado |
| 400 | Validación de entrada fallida |
| 401 | Sin autenticación o token inválido |
| 403 | Autenticado pero sin permiso sobre el recurso |
| 404 | Recurso inexistente (o oculto por autorización) |
| 409 | Conflicto (duplicado, estado inválido para la operación) |
| 422 | Regla de negocio incumplida |
| 429 | Rate limit excedido |
| 500 | Error interno (mensaje genérico, detalle solo en logs) |

### 1.4 Versionado, paginación y límites

- **Versionado:** {{ESQUEMA — p. ej. prefijo /v1/}}.
- **Paginación:** {{ESQUEMA — p. ej. ?page=&per_page=, default 50, máx 100}}; la
  respuesta incluye `total`, `page`, `per_page`.
- **Rate limits:** {{LIMITES_POR_IP_Y_POR_USUARIO}}.

---

## 2. Endpoints

### 2.1 `POST /v1/auth/otp/verificar` — Verificar código OTP (EJEMPLO RESUELTO)

<!-- instrucción: endpoint de ejemplo completamente resuelto (par de HU-01); úsalo como referencia de nivel de detalle y sustitúyelo por endpoints reales. -->

| Método y ruta | Auth requerida | HU relacionadas |
|---|---|---|
| `POST /v1/auth/otp/verificar` | No (es el login) | HU-01 |

**Descripción.** Valida el código OTP enviado al celular y, si es correcto, emite el
token de sesión.

**Request**

```json
{
  "celular": "5512345678",
  "codigo": "482913"
}
```

**Responses**

`200 OK` — código válido:

```json
{
  "token": "eyJhbGciOi...",
  "expira_en": 3600
}
```

`422` — código inválido o expirado:

```json
{
  "error": {
    "codigo": "OTP_INVALIDO",
    "mensaje": "El código no es válido o ya expiró. Solicita uno nuevo."
  }
}
```

`429` — intentos agotados:

```json
{
  "error": {
    "codigo": "OTP_BLOQUEADO",
    "mensaje": "Demasiados intentos. Espera 15 minutos e intenta de nuevo."
  }
}
```

**Errores posibles**

| Código HTTP | `error.codigo` | Causa |
|---|---|---|
| 422 | `OTP_INVALIDO` | Código erróneo, expirado o ya usado |
| 429 | `OTP_BLOQUEADO` | Máximo de intentos o reenvíos agotado |

---

### 2.{{N}} `{{METODO}} {{/ruta}}` — {{NOMBRE_DEL_ENDPOINT}}

<!-- instrucción: bloque plantilla; duplícalo por endpoint. Documenta solo las desviaciones de las convenciones globales. -->

| Método y ruta | Auth requerida | HU relacionadas |
|---|---|---|
| `{{METODO}} {{/ruta}}` | {{Sí (mecanismo) / No}} | {{HU-xx}} |

**Descripción.** {{QUE_HACE_EN_UNA_O_DOS_LINEAS}}

**Request**

```json
{{SCHEMA_DE_ENTRADA_CON_VALORES_DE_EJEMPLO}}
```

**Responses**

`{{200/201}}`:

```json
{{SCHEMA_DE_EXITO}}
```

`{{4xx}}`:

```json
{{ENVELOPE_DE_ERROR_CON_CODIGO_ESPECIFICO}}
```

**Errores posibles**

| Código HTTP | `error.codigo` | Causa |
|---|---|---|
| {{4xx}} | `{{CODIGO}}` | {{CAUSA}} |
