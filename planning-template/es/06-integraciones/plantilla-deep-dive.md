# {{INTEGRACION}} — documentación técnica (deep-dive)

> Deep-dive de la integración con **{{SISTEMA_EXTERNO}}** ({{PROTOCOLO — SOAP / REST /
> cola / archivo}}). Documenta el sistema **tal como es hoy** y qué debe construirse.
> <!-- instrucción: crea un archivo por integración DIFÍCIL (externa, legada, mal documentada o de protocolo no trivial), nombrado NN-nombre.md dentro de 06-integraciones/. Una API REST moderna y bien documentada NO amerita deep-dive: cítala en 03-contratos-de-api.md. -->

---

## 1. Qué hace y cómo está construido

<!-- instrucción: propósito del sistema externo, tecnología, dónde vive (red, VPN, ambientes) y reglas de arquitectura (p. ej. "se consume siempre server-side, nunca desde el navegador"). -->

{{DESCRIPCION_DEL_SISTEMA_Y_SU_ARQUITECTURA}}

> **Regla de arquitectura:** {{REGLA_CLAVE — p. ej. la llamada se hace siempre
> server-side; el endpoint no se expone a Internet}}.

## 2. Flujo / máquina de estados

<!-- instrucción: diagrama ASCII del flujo real de la integración, incluyendo reintentos y caminos de error. -->

```
{{paso_1}} --({{evento}})--> {{paso_2}}
{{paso_2}} --({{exito}})--> {{paso_final}}
{{paso_2}} --({{error}})--> {{paso_error / reintento}}
```

## 3. Contrato actual (entrada / salida)

<!-- instrucción: endpoint/cola/ruta real, método, headers, y un payload REAL de ejemplo (anonimizado o con datos de prueba autorizados; nunca PII de terceros sin consentimiento). -->

- **Endpoint:** `{{URL_O_RECURSO}}`
- **Método / operación:** `{{METODO_U_OPERACION}}`
- **Ambientes:** {{PROD / QA y cómo se accede a cada uno}}

Request de ejemplo:

```{{formato}}
{{PAYLOAD_REAL_DE_EJEMPLO}}
```

Response de ejemplo:

```{{formato}}
{{RESPUESTA_REAL_DE_EJEMPLO}}
```

## 4. Catálogo de códigos de error

<!-- instrucción: TODOS los códigos conocidos, incluso los raros. La "Acción sugerida" es lo que el sistema o el operador debe hacer, no una descripción. -->

| Código | Significado | Acción sugerida |
|---|---|---|
| `{{00}}` | {{EXITO}} | Continuar el flujo |
| `{{XX}}` | {{SIGNIFICADO}} | {{REINTENTAR / CORREGIR_DATOS / ESCALAR_A_[TI]}} |

## 5. "Servicio caído" vs "operación fallida"

<!-- instrucción: distinción crítica para el manejo de errores. Caído = timeout, 5xx, red → reintentar/encolar. Fallida = el servicio respondió con rechazo → NO reintentar igual, seguir la acción del catálogo. -->

| Situación | Cómo se detecta | Comportamiento esperado |
|---|---|---|
| Servicio caído | {{TIMEOUT / 5XX / ERROR_DE_RED}} | {{REINTENTO_CON_BACKOFF / ENCOLAR / AVISAR}} |
| Operación fallida | {{CODIGO_DE_RECHAZO_EN_RESPUESTA}} | {{ACCION_DEL_CATALOGO; no reintentar a ciegas}} |

## 6. Timeouts, reintentos e idempotencia

- **Timeout:** {{S}} s por llamada.
- **Reintentos:** {{N}} con backoff {{ESQUEMA}}; solo ante {{CONDICIONES}}.
- **Idempotencia:** {{COMO_SE_EVITA_DUPLICAR — llave de idempotencia, referencia única
  por transacción, verificación previa}}.

## 7. SLA y límites del proveedor

| Aspecto | Valor |
|---|---|
| SLA / disponibilidad comprometida | {{VALOR}} |
| Rate limit | {{VALOR}} |
| Horario de soporte del proveedor | {{VALOR}} |
| Costo por transacción (si aplica) | {{VALOR}} |

## 8. Datos de prueba / sandbox

<!-- instrucción: cómo probar sin afectar producción: ambiente, credenciales (referencia al gestor de secretos, nunca el valor), casos de prueba conocidos-buenos y conocidos-malos. -->

- Ambiente de pruebas: {{URL_O_RECURSO_QA}}.
- Credenciales: {{DONDE_SE_OBTIENEN}}.
- Casos conocidos: {{CASO_BUENO}} / {{CASO_DE_RECHAZO}}.

## 9. As-is vs to-be

<!-- instrucción: contraste explícito entre cómo funciona hoy y cómo debe quedar. Es la base de la lista de construcción. -->

| Aspecto | As-is (hoy) | To-be (objetivo) |
|---|---|---|
| {{ASPECTO_1}} | {{COMO_ES_HOY}} | {{COMO_DEBE_QUEDAR}} |
| {{ASPECTO_2}} | {{AS_IS}} | {{TO_BE}} |

## 10. Qué se debe construir

<!-- instrucción: lista numerada y accionable; cada punto debe poder convertirse en tarea. Cita las HU-xx que dependen de cada pieza. -->

1. {{PIEZA_A_CONSTRUIR}} (soporta {{HU-xx}}).
2. {{PIEZA_A_CONSTRUIR}}.
3. {{PIEZA_A_CONSTRUIR}}.

## 11. Ejemplo curl

<!-- instrucción: llamada reproducible contra el ambiente de pruebas, con placeholders para secretos. Debe funcionar copiando y pegando tras sustituir variables. -->

```bash
curl -X POST '{{URL_QA}}' \
  -H 'Content-Type: {{CONTENT_TYPE}}' \
  -H 'Authorization: Bearer {{TOKEN}}' \
  -d '{{PAYLOAD_MINIMO}}'
```
