# Prompt para generar prototipo/diseño + handoff — {{PROYECTO}}

> Meta-documento: prompt listo para pedirle a un skill/herramienta de diseño un
> **prototipo navegable** del proyecto, y el encargo del **handoff** que se adjunta a
> esta documentación como `11-handoff-diseno.md`.

## 1. Cómo usarlo

<!-- instrucción: ajusta el flujo a las herramientas disponibles (design-shotgun / design-consultation / design-html u otras). El paso final SIEMPRE es guardar el handoff junto al resto de la suite. -->

1. **Explorar variantes visuales:** pega el prompt de abajo en la herramienta de
   exploración de diseño ({{HERRAMIENTA}}).
2. **Aterrizar el diseño elegido** a HTML navegable con {{HERRAMIENTA_DE_HTML}}.
3. **Generar el handoff** (ver sección 3) y guárdalo como `11-handoff-diseno.md` en
   esta misma carpeta, para que quede adjunto al requerimiento.

---

## 2. PROMPT (pegar tal cual)

<!-- instrucción: llena los placeholders del bloque. En "PANTALLAS A DISEÑAR" REFERENCIA las HU-xx (título + ID); NO copies sus reglas de negocio aquí — si el prompt duplica el contenido de las historias, se desincroniza en cuanto una HU cambie. La fuente de verdad es 01-historias-de-usuario.md. -->

```
Eres diseñador de producto. Diseña {{TIPO_DE_APLICACION — p. ej. una webapp responsiva
y mobile-first}} para {{PROYECTO}} de {{ORGANIZACION}}.

IMAGEN INSTITUCIONAL (usar como norte, no como candado rígido):
- Quién es {{ORGANIZACION}}: {{DESCRIPCION_BREVE_Y_PERSONALIDAD_DE_MARCA}}.
- Valores que toda pantalla debe transmitir: {{VALORES — p. ej. cercanía, confianza,
  rapidez}}.
- Tono de voz: {{TONO — p. ej. conversacional, cálido, trato de tú, sin jerga técnica}}.
- Color de referencia: {{PALETA_HEX_Y_USO — acción / texto / acento / superficies}}.
- Tipografía de referencia: {{FAMILIA_Y_PESOS}}.
- Accesibilidad: contraste AA, targets táctiles ≥ 44px, estados de foco visibles.

PÚBLICO Y TONO:
- {{ACTOR_1}}: {{PERFIL_Y_NECESIDADES_DE_UX — p. ej. gama media de Android, lenguaje
  simple, pasos cortos}}.
- {{ACTOR_2}}: {{PERFIL — p. ej. panel denso y eficiente para operar rápido}}.

PANTALLAS A DISEÑAR (el detalle funcional vive en 01-historias-de-usuario.md;
diseñar conforme a esas historias, citadas por ID):

A) {{FLUJO_1 — p. ej. flujo del usuario final (móvil)}}:
  1. {{PANTALLA}} — cubre HU-{{xx}}.
  2. {{PANTALLA}} — cubre HU-{{xx}}.

B) {{FLUJO_2 — p. ej. panel de administración (desktop-first, responsivo)}}:
  1. {{PANTALLA}} — cubre HU-{{xx}}.
  2. {{PANTALLA}} — cubre HU-{{xx}}.

REQUISITOS DE DISEÑO:
- {{MOBILE_FIRST_U_OTRO — p. ej. maquetar 375px primero}}.
- Estados vacíos, de carga, de error y de éxito para cada pantalla.
- Microcopy en español, {{TONO}}, breve.
- Indicadores de estado consistentes y componentes reutilizables.

ENTREGABLES:
- Set de pantallas como HTML/CSS autocontenido y navegable, coherente con la marca.
- Inventario de componentes reutilizables con sus estados.
- Notas de accesibilidad y responsividad (breakpoints).
```

---

## 3. Handoff a generar (para adjuntar al requerimiento)

Después de que la herramienta produzca el diseño, pídele explícitamente el **handoff**
con este encargo:

```
Genera un documento de handoff de diseño para desarrollo que incluya:
1) Índice de pantallas con captura/miniatura de cada una y su propósito.
2) Inventario de componentes reutilizables (nombre, variantes, estados) y en qué
   pantallas aparecen.
3) Tokens usados: colores (hex), tipografía, espaciado, radios, sombras — como tabla,
   para traducirlos a variables CSS.
4) Especificación de interacción por pantalla: validaciones, mensajes, transiciones y
   estados (vacío, carga, error, éxito).
5) Mapa pantalla → historia de usuario (obligatorio: cada pantalla cita su HU-xx,
   referenciando 01-historias-de-usuario.md).
6) Breakpoints y comportamiento responsivo.
7) Notas de accesibilidad (contraste, foco, targets táctiles, lectores de pantalla).
Formato: Markdown, listo para guardarse como 11-handoff-diseno.md junto al resto de la
documentación del requerimiento.
```

<!-- instrucción: al recibir el handoff, guárdalo como 11-handoff-diseno.md, agrégalo al índice y a la tabla de estatus del README.md, y vacía el mapa pantalla→HU hacia la columna "Pantalla(s)" de 09-matriz-de-trazabilidad.md. -->

Con eso el paquete queda cerrado: requerimiento + historias + técnico + seguridad +
integraciones + pruebas + entrega + diseño.
