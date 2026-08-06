# Especificación técnica — {{PROYECTO}}

> Persistencia: {{MOTOR_BD}} para datos, {{ALMACENAMIENTO_ARCHIVOS}} para archivos.
> Los nombres de tablas y campos son una **propuesta**; ajústense a las convenciones
> del equipo que construye. Prefijo sugerido: `{{PREFIJO}}_`.

---

## 1. Validación de campos de entrada

<!-- instrucción: todo campo se valida en cliente (UX) y en servidor (autoridad). Indica normalización previa (trim, minúsculas, colapso de espacios). Una tabla por formulario si hay varios. -->

| Campo | Obligatorio | Tipo | Longitud / formato | Reglas |
|---|---|---|---|---|
| `{{campo_1}}` | Sí | {{texto/número/catálogo}} | {{RANGO_O_FORMATO}} | {{REGLAS_DE_VALIDACION}} |
| `{{campo_2}}` | No | {{tipo}} | {{RANGO}} | {{REGLAS}} |

---

## 2. Modelo de datos — propuesta

<!-- instrucción: una tabla por bloque de pseudo-DDL en fence, con comentarios "--" por columna cuando el nombre no sea autoexplicativo. snake_case, prefijo {{PREFIJO}}_, motor y charset declarados. Solo columnas relevantes: esto es contrato, no DDL final. -->

Motor {{MOTOR}}, charset {{CHARSET}}.

**Convención obligatoria de auditoría y retención (decidido {{FECHA}}):**

<!-- instrucción: adapta esta convención al proyecto y séllala con fecha cuando se acuerde; si sigue abierta, regístrala como P-xx. -->

- **Todas** las tablas llevan `created_at DATETIME` y `updated_at DATETIME`.
- Las tablas con PII o expediente llevan además `deleted_at DATETIME NULL` para
  **soft-delete**: los registros no se borran físicamente; las consultas de la app
  filtran `WHERE deleted_at IS NULL`.
- Periodo de retención: {{POLITICA_DE_RETENCION}}.

### `{{PREFIJO}}_{{tabla_1}}` — {{PROPOSITO_DE_LA_TABLA}}

```
id           BIGINT PK AUTO_INCREMENT
{{campo}}    {{TIPO}}          -- {{comentario}}
{{campo}}    {{TIPO}} NULL     -- {{comentario}}
estatus      ENUM('{{a}}','{{b}}') DEFAULT '{{a}}'
created_at   DATETIME
updated_at   DATETIME
```

### `{{PREFIJO}}_{{tabla_2}}` — {{PROPOSITO}}

```
id             BIGINT PK
{{tabla_1}}_id BIGINT FK -> {{PREFIJO}}_{{tabla_1}}.id
{{campo}}      {{TIPO}}
created_at     DATETIME
updated_at     DATETIME
```

### 2.1 Índices y llaves foráneas

<!-- instrucción: índices que respaldan las consultas reales (búsquedas, listados paginados, unicidad) y todas las FKs con su política ON DELETE/ON UPDATE. -->

| Tabla | Índice / FK | Columnas | Tipo | Justificación |
|---|---|---|---|---|
| `{{PREFIJO}}_{{tabla_1}}` | `uq_{{campo}}` | `{{campo}}` | UNIQUE | {{POR_QUE}} |
| `{{PREFIJO}}_{{tabla_2}}` | `fk_{{tabla_2}}_{{tabla_1}}` | `{{tabla_1}}_id` | FK (ON DELETE RESTRICT) | {{POR_QUE}} |

### 2.2 Plan de migraciones

<!-- instrucción: herramienta de migraciones, orden de creación, estrategia para datos existentes y regla de reversibilidad (toda migración con down o plan de reversa documentado). -->

- Herramienta: {{HERRAMIENTA_MIGRACIONES}}.
- Orden: {{ORDEN_DE_CREACION_DE_TABLAS}}.
- Datos existentes: {{ESTRATEGIA_DE_CARGA_O_MIGRACION}}.
- Reversibilidad: {{REGLA_DE_ROLLBACK_DE_ESQUEMA}}.

---

## 3. Flujo de estados

<!-- instrucción: diagrama ASCII del ciclo de vida de la entidad principal. Cada estado debe existir en el ENUM del modelo de datos y cada transición debe tener un actor que la dispara. -->

```
{{estado_inicial}} --({{accion / actor}})--> {{estado_2}}
{{estado_2}}       --({{accion / actor}})--> {{estado_3}}
{{estado_2}}       --({{rechazo / actor}})--> {{estado_rechazado}}
```

| Transición | Actor que la dispara | Efectos secundarios |
|---|---|---|
| `{{estado_inicial}} → {{estado_2}}` | {{ACTOR}} | {{NOTIFICACION_BITACORA_ETC}} |

---

## 4. Convención de auditoría y retención

<!-- instrucción: qué acciones quedan en bitácora (quién y cuándo), qué datos se conservan, cuánto tiempo y bajo qué fundamento (aviso de privacidad, regulación). Cita el pendiente P-xx si la política sigue abierta. -->

- **Bitácora:** toda acción de {{ACTORES_AUDITADOS}} sobre {{RECURSOS}} queda registrada
  con usuario, acción, recurso y fecha-hora.
- **Retención:** {{POLITICA}} (decidido {{FECHA}}) / pendiente {{P-xx}}.
- **Borrado:** {{SOFT_DELETE_O_PURGA}}.
