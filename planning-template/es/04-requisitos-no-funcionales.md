# Requisitos no funcionales — {{PROYECTO}}

> Restricciones operativas y de calidad que aplican a **todo** el sistema,
> independientemente de las historias de usuario. Todo objetivo debe ser **medible**;
> lo que no se pueda medir, se registra como pendiente `P-xx`.

---

## 1. Performance

<!-- instrucción: objetivos medibles bajo carga esperada, no ideales de laboratorio. Usa percentiles (p95), no promedios. -->

| Métrica | Objetivo |
|---|---|
| Tiempo de respuesta API (p95) | ≤ {{MS}} ms |
| Carga inicial de la página principal (móvil, 4G) | ≤ {{S}} s |
| {{OPERACION_CRITICA}} | ≤ {{OBJETIVO}} |

## 2. Disponibilidad / SLA

<!-- instrucción: horario de operación real del negocio, objetivo de disponibilidad y ventanas de mantenimiento acordadas. Si hay proveedor, alinea con su SLA contractual. -->

- Horario crítico de operación: {{HORARIO}}.
- Objetivo de disponibilidad: {{PORCENTAJE}} % mensual.
- Ventanas de mantenimiento: {{VENTANAS}}.

## 3. Navegadores y dispositivos soportados

| Plataforma | Mínimo soportado | Notas |
|---|---|---|
| Android (Chrome) | {{VERSION}} | {{p. ej. gama media, pantallas 360–412 px}} |
| iOS (Safari) | {{VERSION}} | {{NOTAS}} |
| Desktop (Chrome/Edge/Firefox) | {{VERSIONES}} | {{p. ej. solo panel admin}} |

## 4. Accesibilidad

<!-- instrucción: nivel objetivo y reglas concretas verificables; evita "debe ser accesible" sin criterio. -->

- Nivel objetivo: WCAG {{2.1/2.2}} nivel {{AA}}.
- Contraste mínimo {{4.5:1}}; targets táctiles ≥ {{44}} px; foco visible; formularios
  con etiquetas y mensajes de error asociados.

## 5. Idiomas / i18n

- Idioma(s): {{IDIOMAS}}.
- {{ESTRATEGIA — p. ej. es-MX único, textos centralizados para traducción futura}}.

## 6. Límites

<!-- instrucción: límites duros que el backend debe imponer (no solo el cliente). -->

| Límite | Valor |
|---|---|
| Tamaño máximo de archivo | {{MB}} MB |
| Formatos de archivo permitidos | {{FORMATOS}} |
| Timeout de peticiones a servicios externos | {{S}} s |
| Timeout de sesión | {{MIN}} min |
| {{OTRO_LIMITE}} | {{VALOR}} |

## 7. Observabilidad

<!-- instrucción: qué se registra, qué se mide y qué despierta a alguien. Los logs nunca contienen PII sensible ni secretos. -->

- **Logs:** {{QUE_SE_LOGUEA_Y_DONDE}}; sin PII sensible ni credenciales.
- **Métricas:** {{METRICAS_CLAVE — p. ej. latencia, tasa de error, uso por endpoint}}.
- **Alertas:** {{CONDICION → CANAL → RESPONSABLE}}.

## 8. Capacidad esperada

<!-- instrucción: números de negocio que dimensionan la infraestructura; si no existen, estímalos y márcalos como estimado. -->

| Dimensión | Valor esperado |
|---|---|
| Usuarios concurrentes pico | {{N}} |
| Registros nuevos por {{DIA/MES}} | {{N}} |
| Almacenamiento de archivos por {{MES/AÑO}} | {{GB}} |
| Crecimiento anual estimado | {{PORCENTAJE}} % |
