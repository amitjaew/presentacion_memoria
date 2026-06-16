= Marco Teórico

== Modelos de Lenguaje Multimodales

- Sistemas de aprendizaje profundo que procesan, comprenden y generan texto en lenguaje natural.
- Extensión multimodal: integran contenido visual (imágenes) y auditivo.
- Capacidades clave para este proyecto:
  - Generar descripciones detalladas de escenas y composiciones artísticas.
  - Traducir elementos visuales en narrativas estructuradas.
  - Procesar entradas de voz en flujos conversacionales.

*Modelos representativos del estado del arte:*
- *Llama V4* (Meta): código abierto. Arquitectura con fusión temprana multimodal:
  - *Vision Encoder* (MetaCLIP) genera tokens visuales.
  - *Early Fusion Layer* unifica tokens visuales y textuales antes del procesamiento profundo.
  - Capas *Transformer* con *iRoPE* aplican atención cruzada bidireccional (texto ↔ imagen).
  - Disponible vía proveedores cloud: Groq, Novita, TogetherAI.
- *GPT-4o* (OpenAI): integración nativa texto-imagen-audio.
- *Gemini 1.5* (Google): procesamiento multimodal unificado.

== Modelos Generativos de Audio

- Sistemas que crean sonidos y música a partir de prompts de texto.
- Basados en arquitecturas de aprendizaje profundo (difusión, transformers).
- Sintetizan desde sonidos ambientales hasta composiciones musicales.

*Modelo de referencia:*
- *AudioLDM:* genera audio ambiental mediante difusión latente condicionada por descripciones textuales.
- Utiliza embeddings CLAP para mejorar la alineación semántica texto-sonido.
- Pesos abiertos y preentrenados disponibles.

== Arquitectura AudioLDM

#figure(
  image("../figs/audioldm.png"),
  caption: "Arquitectura de AudioLDM — Difusión Latente + CLAP"
)

== Modelos de Texto a Voz (TTS)

- Transforman texto escrito en habla sintética mediante NLP y síntesis de voz.
- Arquitecturas de referencia:
  - *Tacotron 2:* encoder-decoder con atención, genera espectrogramas mel autoregresivamente.
  - *VITS:* síntesis end-to-end con flujos normalizadores y aprendizaje adversarial.
  - *StyleTTS2:* modela variaciones de prosodia y timbre.

*Implementación seleccionada:*
- *Kokoro-82M:* voz de alta calidad con solo 82 millones de parámetros.
- Soporte nativo para español. Basado en StyleTTS2.

== Estándares de Accesibilidad

- Marco normativo que guía el diseño de interfaces inclusivas.

*WCAG (Pautas de Accesibilidad para el Contenido Web):*
- Perceptibilidad, operabilidad, comprensibilidad y robustez.

*Contexto chileno:*
- Ley N.º 20.422: igualdad de oportunidades e inclusión social.
- Exigencias específicas para tecnologías asistivas.

*Adopción en la plataforma:*
- Compatibilidad con lectores de pantalla.
- Navegación por teclado.
- Descripciones alternativas y controles auditivos accesibles.

== Convergencia Tecnológica

La plataforma integra estas tres tecnologías en un flujo coherente:

#v(.3cm)
*Imagen de obra* → *LLM Multimodal* → *Texto descriptivo / narrativo* → *TTS* → *Audio*

#v(.2cm)
*Prompt textual* → *Modelo generativo de audio* → *Paisaje sonoro*

#v(.2cm)
*Cliente web WCAG* → *API Gateway* → *Experiencia auditiva accesible*
