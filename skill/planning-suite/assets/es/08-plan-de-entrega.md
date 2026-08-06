# Plan de entrega — {{PROYECTO}}

> Cómo llega el proyecto a producción: fases, ambientes, go-live, rollback y operación.
> Las fases citadas aquí son las mismas que usa el índice de
> [`01-historias-de-usuario.md`](01-historias-de-usuario.md).

---

## 1. Fases y corte de MVP

<!-- instrucción: qué HUs entran en cada fase. La Fase 1 es el MVP: lo mínimo que ya genera valor en producción. Justifica qué queda fuera del MVP y por qué. -->

| Fase | Alcance (HUs) | Milestone | Fecha objetivo |
|---|---|---|---|
| 1 (MVP) | {{HU-01, HU-02…}} | {{QUE_SE_PUEDE_HACER_AL_CIERRE}} | {{FECHA}} |
| 2 | {{HU-xx…}} | {{MILESTONE}} | {{FECHA}} |

## 2. Ambientes

| Ambiente | URL | Datos | Acceso |
|---|---|---|---|
| dev | {{URL}} | Sintéticos | {{QUIEN_Y_COMO}} |
| QA | {{URL}} | Sintéticos + casos de prueba autorizados | {{QUIEN_Y_COMO}} |
| prod | {{URL}} | Reales | {{QUIEN_Y_COMO}} |

## 3. CI/CD y estrategia de ramas

<!-- instrucción: flujo de ramas, qué dispara cada despliegue y qué gates existen (pruebas, revisión, aprobación manual a prod). -->

- Ramas: {{ESQUEMA — p. ej. trunk-based / main + feature branches con PR}}.
- CI: {{QUE_CORRE_EN_CADA_PR — lint, unitarias, integración}}.
- CD: {{QUE_DESPLIEGA_A_DONDE — merge a main → QA; tag/aprobación → prod}}.

## 4. Plan de go-live

<!-- instrucción: checklist ordenado del día de salida, con responsable por paso y criterio de "go". -->

| # | Paso | Responsable | Criterio de listo |
|---|---|---|---|
| 1 | {{MIGRACIONES_DE_BD_EJECUTADAS}} | {{[TI]/[PROV]}} | {{CRITERIO}} |
| 2 | {{SECRETOS_Y_CONFIG_DE_PROD_CARGADOS}} | {{RESPONSABLE}} | {{CRITERIO}} |
| 3 | {{DESPLIEGUE_Y_SMOKE_TESTS}} | {{RESPONSABLE}} | CP-{{xx}} en verde en prod |
| 4 | {{COMUNICACION_A_USUARIOS / APERTURA}} | {{[N]}} | {{CRITERIO}} |

## 5. Plan de rollback

<!-- instrucción: cómo se revierte si el go-live falla: umbral de decisión, quién decide, pasos técnicos (incluye reversa o compatibilidad de migraciones) y comunicación. -->

- **Umbral de decisión:** {{CONDICION — p. ej. error crítico sin workaround en la
  primera hora}}. Decide: {{RESPONSABLE}}.
- **Pasos:** {{REVERTIR_DESPLIEGUE → REVERSA_DE_MIGRACIONES_O_COMPATIBILIDAD → VERIFICAR}}.
- **Datos:** {{QUE_PASA_CON_LOS_DATOS_CAPTURADOS_DURANTE_LA_VENTANA}}.

## 6. Operación post-lanzamiento

<!-- instrucción: quién vigila qué durante las primeras semanas y a quién se escala. El runbook mínimo cubre los 3–5 incidentes más probables. -->

- **Monitoreo:** {{METRICAS_Y_ALERTAS_ACTIVAS (ver 04-requisitos-no-funcionales.md §7)}}.
- **Runbook mínimo:**

| Incidente probable | Diagnóstico rápido | Acción |
|---|---|---|
| {{SERVICIO_EXTERNO_CAIDO}} | {{COMO_CONFIRMARLO}} | {{ACCION_Y_A_QUIEN_AVISAR}} |
| {{ERRORES_DE_VALIDACION_MASIVOS}} | {{DIAGNOSTICO}} | {{ACCION}} |

- **Escalación:** {{NIVEL_1 → NIVEL_2 → PROVEEDOR, con horarios y canal}}.
- **Periodo de estabilización:** {{DIAS/SEMANAS}} con {{FRECUENCIA_DE_REVISION}}.
