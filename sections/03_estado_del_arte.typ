= Estado del Arte

== Accesibilidad Cultural Tradicional

*Prácticas museográficas convencionales:*
- Audioguías, maquetas táctiles, textos en braille, recorridos guiados adaptados.
- Guías oficiales de accesibilidad para museos.

*Programas institucionales:*
- Experiencias multimediales MAC (Museo de Arte Contemporáneo, U. de Chile): audioguías, cápsulas subtituladas, lengua de señas.
- Museo Emilio Caraffa (Argentina): sala accesible con QR, audiodescripciones y paisajes sonoros.

*Proyectos independientes:*
- *Audioguiarte:* audioguías personalizadas y recorridos accesibles.
- *MiméticasLab:* recreación táctil de obras con impresión 3D.

== Comparación de Alternativas

#figure(
  [
    #table(
      columns: (22%, 26%, 22%, 30%),
      align: left,

      [*Categoría*], [*Ejemplos*], [*Modalidades*], [*Limitaciones*],

      [Accesibilidad museográfica], [Audioguías, braille, signoguías], [Audio, táctil, texto], [Escalabilidad limitada, alta dependencia humana],

      [Programas institucionales], [MAC, Caraffa], [Audio, video, señas], [Alcance restringido a exposiciones específicas],

      [Proyectos inclusivos], [Audioguiarte, MiméticasLab], [Audio narrativo, táctil], [No universalizado ni automatizado],

      [Investigación académica], [MAIDR, arte a música], [Texto, audio], [Prototipos sin despliegue productivo],

      [Plataformas digitales], [Smartify, Google Arts & Culture], [Imagen, texto, audio], [Baja personalización en accesibilidad],
    )
  ],
  caption: "Estado del Arte en Accesibilidad Artística"
)

#v(.4cm)
*Brecha identificada:* las soluciones actuales requieren procesos manuales o semiautomáticos, sin coordinación eficiente entre modalidades. Esto limita la escalabilidad.

== Modelos Multimodales Evaluados

*Criterios de selección:* pesos abiertos, soporte multimodal nativo, inferencia cloud de bajo costo.

*Modelos considerados:*
- *Llama V4 (Meta):* seleccionado. Pesos abiertos, MetaCLIP, acceso vía Groq/Novita/TogetherAI.
- *GPT-4o (OpenAI):* integración nativa texto-imagen-audio. Sin pesos liberados.
- *Gemini 1.5 (Google):* procesamiento multimodal unificado. Sin pesos liberados.
- *DeepSeek-OCR:* código abierto, especializado en OCR y documentos visuales.

Llama V4 combina los tres factores requeridos simultáneamente.

== Modelos de Audio y Voz Evaluados

*Síntesis de voz (TTS):*
- Tacotron 2, VITS, StyleTTS2: arquitecturas de referencia.
- *Kokoro-82M:* seleccionado. 82M parámetros, 3 voces en español, alta calidad.

*Generación de audio ambiental:*
- *AudioLDM:* seleccionado. Difusión latente + CLAP. Pesos abiertos.
- *I Hear Your True Colors:* VQVAE + transformers + CLIP. Sin pesos públicos.

*Estado de la generación de audio ambiental:* aún en fase experimental, sin soluciones comerciales consolidadas.
