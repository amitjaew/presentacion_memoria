= Resultados

== API Gateway

- Autodocumentación Swagger/OpenAPI.#v(.1cm)
- Operaciones CRUD completas para todos los módulos #v(.1cm)
- Endpoints habilitan lectura/escritura de elementos preprocesados.#v(.1cm)
- Permite consulta general y gestión individual de obras, autores, períodos y técnicas.


#v(.5cm)
*Compatibilidad con APIs externas:*
- Datos no estructurados (imágenes, audio) transmitidos en base64.
- Facilita integración con SDKs compatibles con API de OpenAI (Groq, Novita, TogetherAI).

== Frontend

#figure(
  image("../figs/frontend_main.png", height: 90%),
  caption: "Pantalla Principal de la Plataforma"
)

#pagebreak()
- *Búsquedas:* por obra, autor, período y técnica. #v(.2cm)
  - *Limitación:* coincidencia exacta de strings (incluyendo acentuación).
#v(.2cm)
- *Placeholders* en todos los inputs facilitan la integración con utilidades de accesibilidad.
#v(.2cm)
- *Vista de obra:* metadatos generales + contenido de módulos de narración y descripción con audios TTS.

#figure(
  image("../figs/frontend_obra.png", height: 90%),
  caption: "Vista de Obra con Metadatos y Audios"
)
- *Ambientes sonoros:* acceso mediante click/selección de 9 cuadrantes.
  - Carencia de etiquetado adecuado que indique la funcionalidad.
  - Mejora pendiente: etiquetado explícito de contenidos e interacción.

== Caso de Estudio: "El Aquelarre" (Goya)

#grid(
  columns: (1fr, 1fr),
  gutter: 12pt,
  [
    Obra representativa seleccionada para ilustrar el funcionamiento de los módulos generativos.

    #v(.3cm)
    *Se evaluaron:* #v(.2cm)
    - Calidad del texto en
      - Audio Descriptivo
      - Narraciones de Contexto. #v(.2cm)
    - Fidelidad y realismo del audio ambiental. #v(.2cm)
    - Naturalidad y claridad de la voz sintetizada (TTS).
  ],
  [
    #figure(
      image("../figs/el_aquelarre_goya.jpeg", height: 90%),
      caption: [
        Obra "El Aquelarre"
        #linebreak()
        de Francisco de Goya (1797–1798)
      ]
    )
  ]
)

== Resultados: Audio Descriptivo

#grid(
  columns: (1fr, 1fr),
  gutter: 0.5cm,
  [
    #figure(
      image("../figs/el_aquelarre_goya.jpeg", height: 90%),
      caption: [
        "El Aquelarre"
        #linebreak()
        Francisco de Goya (1797–1798)
      ]
    )
  ],
  [
    #figure(
      [
        ```
        En la imagen se puede observar una representación de un ritual o acto de adoración hacia un macho cabrío. La figura del macho cabrío viste una corona de hojas y se encuentra en el centro de la composición, rodeado de personas participando en una ceremonia.

        Al fondo se ve una luna creciente en el cielo nocturno. Detrás del macho cabrío hay un grupo de personas vestidas con túnicas, algunas con la cara cubierta.
        ```
      ],
      caption: "Descripción generada por Llama V4"
    )
  ],
)

== Resultados: Narraciones de Contexto

#figure(
  [
    ```
    En el palacio de recreo de los duques de Osuna, a las afueras
    de Madrid, Francisco de Goya pintó seis pequeños cuadros entre
    1797 y 1798. "El aquelarre" representa un ritual de brujería
    presidido por un gran macho cabrío, forma del demonio, rodeado
    de brujas que entregan niños según la superstición de la época.

    La serie forma parte de la estética del "sublime terrible", una
    corriente del prerromanticismo que buscaba generar desasosiego
    en el espectador. La brujería era un tema de actualidad entre
    los ilustrados españoles amigos de Goya.
    ```
  ],
  caption: [
    Narración generada para obra
    #linebreak()
    "El Aquellarre" de Francisco de Goya
  ]
)

== Resultados: Sonidos Ambientales y TTS

#figure(
  table(
    columns: (100pt, auto),
    align: center + horizon,
    rows: (auto, 3.3cm),
    [*Segmento*], [*Sonidos Generados*],
    [
      #image("../figs/el_aquelarre_tile_1_1.jpg")
    ],
    [
      #{
        show table.cell.where(y: 0): set text(weight: "regular")
        table(
          columns: (auto, 80%),
          align: left,
          [*Objeto*], [goat bleating],
          [*Fondo*], [tree branch creaking, people whispering],
          table.hline(stroke: 0.4pt),
          [*Audio*], [https://youtu.be/dqOECGiEiBI]
        )
      }
    ],
    [
      #image("../figs/el_aquelarre_tile_2_0.jpg")
    ],
    [
      #{
        show table.cell.where(y: 0): set text(weight: "regular")
        table(
          columns: (auto, 80%),
          align: left,
          [*Fondo*], [sand],
          [*Objeto*], [puppy sleeping],
          table.hline(stroke: 0.4pt),
          [*Audio*], [https://youtu.be/mT7UBvVd9m8]
        )
      }
    ],
  ),
  caption: "Elementos Detectados en \"El Aquelarre\""
)
