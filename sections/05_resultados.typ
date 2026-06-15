= Resultados

== API Gateway

- El sistema opera correctamente con autodocumentación Swagger/OpenAPI.
- Operaciones CRUD completas para todos los módulos.
- Debido a limitaciones computacionales, los endpoints solo habilitan lectura/escritura de elementos preprocesados.
- Permite consulta general y gestión individual de obras, autores, períodos y técnicas.

*Compatibilidad con APIs externas:*
- Datos no estructurados (imágenes, audio) transmitidos en base64.
- Facilita integración con SDKs compatibles con API de OpenAI (Groq, Novita, TogetherAI).
- Mejora futura propuesta: migrar a multipart-form-data para optimizar rendimiento.

== Frontend

- Navegación evaluada mediante herramientas de accesibilidad para discapacidad visual.
- *Búsquedas:* por obra, autor, período y técnica. Limitación: coincidencia exacta de strings (incluyendo acentuación).
- *Placeholders* en todos los inputs facilitan la integración con utilidades de accesibilidad.
- *Vista de obra:* metadatos generales + contenido de módulos de narración y descripción con audios TTS.
- *Ambientes sonoros:* acceso mediante click/selección de 9 cuadrantes.
  - Carencia de etiquetado adecuado que indique la funcionalidad.
  - Mejora pendiente: etiquetado explícito de contenidos e interacción.

== Caso de Estudio: "El Aquelarre" (Goya)

#v(.2cm)
Obra representativa seleccionada para ilustrar el funcionamiento de los módulos generativos.

*Se evaluaron:*
- Calidad del texto en Audio Descriptivo y Narraciones de Contexto.
- Fidelidad y realismo del audio ambiental.
- Naturalidad y claridad de la voz sintetizada (TTS).

== Resultados: Audio Descriptivo

*Calidad del texto generado:*
- Notable correspondencia entre las imágenes de entrada y las descripciones.
- Estructura sintáctica y cadencia adecuadas para procesamiento TTS.

*Hallazgo clave:* una estrategia de prompting directo resulta suficiente para que un modelo multimodal genere descripciones precisas, sin requerir fuentes externas de referencia.

*Resultado con "El Aquelarre":* descripción objetiva del ritual, el macho cabrío en el centro, las figuras circundantes, la luna creciente y la atmósfera nocturna.

== Resultados: Narraciones de Contexto

- Las narraciones se generan a partir de artículos de Wikipedia para evitar alucinaciones.
- Comparación cruzada con la fuente original demuestra adecuada correspondencia.
- El pipeline transforma contenido enciclopédico en narración fluida y de carácter natural.

*Limitaciones identificadas:*
- Casos borde con anglicismos y siglas.
- El TTS interpreta términos extranjeros con reglas fonéticas del español.
- Requiere preprocesamiento adicional o diccionario de excepciones.

== Resultados: Sonidos Ambientales y TTS

*Sonidos Ambientales:*
- Detección de elementos generalmente coherente con la temática de la obra.
- Alucinaciones ocasionales en la identificación de componentes específicos.
- Calidad de audio: resultados verosímiles en la mayoría de los cuadrantes.
- Ruido y artefactos variables; outliers donde los ambientes degeneran en ruido.
- *Conclusión:* limitaciones en la generalización ante elementos visuales ambiguos.

*Text-to-Speech (Kokoro 82M):*
- Naturalidad adecuada para español, entonación fluida y pronunciación clara.
- Tono neutral apropiado para accesibilidad cultural.
- Problemas con anglicismos y siglas (interpretados con fonética española).

*Audios de referencia en YouTube (descripción y narración de "El Aquelarre").*
