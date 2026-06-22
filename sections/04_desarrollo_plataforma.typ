= Desarrollo de la Plataforma

== Requisitos Funcionales

- *Catálogo de obras:* construir, procesar y exponer un catálogo digital curado de obras de dominio público, con imágenes y metadatos.
#v(.2cm)
- *Audio descriptivo:* generar descripciones textuales objetivas mediante modelos multimodales y convertirlas a audio con TTS.
#v(.2cm)
- *Narración contextual:* extraer y sintetizar información histórica de fuentes autoritativas, producir narraciones auditivas.
#v(.2cm)
- *Ambiente sonoro:* integrar modelos generativos de imagen a audio para producir paisajes sonoros.
#v(.2cm)
- *Interfaz accesible:* cliente web conforme a WCAG, compatible con lectores de pantalla y navegación por teclado.

== Requisitos No Funcionales

- *Accesibilidad:* interfaz intuitiva y compatible con herramientas asistivas.
#v(.4cm)
- *Modularidad:* módulos de generación de contenido independientes y reemplazables.
#v(.4cm)
- *Escalabilidad:* incorporar nuevas obras sin cambios estructurales.
#v(.4cm)
- *Interoperabilidad:* servicios expuestos mediante API REST con endpoints documentados.


== Arquitectura General
*Modelo arquitectónico: cliente-servidor.* Desacopla la interfaz de usuario del procesamiento computacionalmente intensivo.

#v(.3cm)
*API Gateway como componente central:*
- Centraliza el acceso a funcionalidades heterogéneas bajo una interfaz uniforme.
- Aísla los servicios internos, permitiendo evolución independiente.
- Concentra tareas de alto costo computacional en entorno controlado.

#v(.2cm)
*Tecnología:* Django + Django REST Framework.
- ORM, arquitectura MVT, ecosistema de paquetes.
- Autenticación, manejo de rutas y middleware integrados.

#pagebreak()
#figure(
  image("../figs/diagrama_arquitectura.png", height: 90%),
  caption: "Arquitectura General del Sistema"
)

== Módulos del Sistema

La API Gateway orquesta 4 módulos funcionales:

#v(.2cm)
1. *Catálogo:* gestiona los recursos del sistema y su persistencia.

2. *Generador de Audio Descriptivo:* transforma representaciones visuales en audios descriptivos. Utiliza Llama V4 para análisis de imágenes.

3. *Narrador de Contexto:* crea narraciones sobre el contexto histórico de cada obra a partir de fuentes autoritativas.

4. *Generador de Sonidos Ambientales:* sintetiza audio contextual con modelos autoalojados (AudioLDM) para representar las obras en formato interactivo.

#v(.2cm)
Esta separación permite integrar servicios externos y soluciones autoalojadas en una arquitectura desacoplada y escalable.

== Catálogo y Modelo de Datos

*Dataset:* 30 obras artísticas de dominio público en formato JSON.

#{
  show table.cell.where(y: 0): set text(weight: "regular")
  align(center, block(width: 70%, table(
    columns: (1fr, 1fr, 1fr),
    [autor], [título], [fecha],
    [técnica], [período], [elementos visuales],
    table.hline(stroke: 0.4pt),
    [contexto histórico], [enlace a Wikipedia], [enlace a imagen],
  )))
}

#v(.5cm)
*Entidades del modelo de datos:*
- *Artwork:* entidad central (título, fecha, contexto histórico).
- *Author, Technique, Style:* metadatos referenciales (relación 1–N con Artwork).
- *ArtworkDescription:* descripciones textuales del contenido visual.
- *ArtworkNarration:* fragmentos narrativos y contextuales.
- *ArtworkAmbience:* elementos de ambientación con coordenadas (x, y).

== Módulos de Generación

*Audio Descriptivo:*
- Entrada: imagen de la obra + prompt estructurado.
- Procesamiento: Llama V4 Scout 17B genera descripción textual.
- Salida: Kokoro TTS convierte el texto en audio narrativo.

#v(.5cm)
*Narraciones de Contexto:*
- Entrada: artículo de Wikipedia de la obra.
- Procesamiento: scraping + extracción de hechos clave + resumen narrativo.
- Salida: Kokoro TTS genera audio narrativo contextual.
- *Ventaja:* evita alucinaciones usando fuentes autoritativas en lugar de consultas directas al modelo.

#pagebreak()
#figure(
  [
    ```python
    DESCRIPTION_PROMPT = \
    """Describe los elementos retratados en la imagen.
    - Debe estar en un formato adecuado para narración.
    - Debe ser conciso y corto en duración.
    - NO seas redundante.
    - NO utilices títulos ni subtitulos.

    Elementos retratados: """
    ```
  ],
  caption: "Prompt para Generación de Audio Descriptivo"
)

#pagebreak()
#figure(
  [
    ```python
    SOURCE_SUMMARY_PROMPT = \
    """Eres un experto en redacción narrativa.
    Lee el texto y escribe un resumen breve
    (máx. dos párrafos) en estilo natural y fluido.
    - Mantén un tono narrativo, claro y atractivo.
    - Sé conciso: evita repeticiones o rodeos.
    - Enfócate en los hechos principales y
      el contexto histórico de la obra.
    Texto: {TEXT}
    Tu respuesta: """
    ```
  ],
  caption: "Prompt para Narraciones de Contexto"
)

== Sonidos Ambientales: Heurística

#grid(
  columns: (1fr, 1fr),
  gutter: 0.5cm,
  [
    *Pipeline de 3 pasos:*

    #v(.3cm)
    + *Segmentación* #v(.2cm)
    + *Extracción semántica* #v(.2cm)
    + *Síntesis de audio*
  ],
  [
    #figure(
      image("../figs/cropped_image_demo.png", height: 90%),
      caption: [
        Segmentación por Cuadrantes
        #linebreak()
        Obra "El Aquelarre"]
    )
  ],
)

== Prompt para Extracción Semántica

#figure(
  [
    ```python
    EXTRACTOR_PROMPT = \
    """Extract audio ambience keys from the image.
    - Output JSON: {"is_background": bool, "object": string}
    - Only objects with sound relevance, 3 max.
    - Alive → describe sound (goat bleating, barking).
    - Output just the required JSON.
    JSON RESULT:"""
    ```
  ],
  caption: "Prompt para Extracción de Elementos Sonoros"
)

== Frontend

- Implementado en *NextJS*.
#v(.3cm)
- Textos alternativos y etiquetas HTML descriptivas.
#v(.3cm)
- Navegación mediante atajos de teclado.
#v(.3cm)
- Placeholders en todos los inputs para lectores de pantalla.

== Limitaciones

- Módulos generativos no se integraron directamente en la API Gateway.
#v(.5cm)
- Se implementó un prototipo funcional en Jupyter para validar el flujo de procesamiento.
#v(.5cm)
- Los datos fueron preprocesados y luego incorporados a la base de datos.
