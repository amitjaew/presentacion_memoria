= Desarrollo de la Plataforma

== Requisitos Funcionales

- *Catálogo de obras:* construir, procesar y exponer un catálogo digital curado de obras de dominio público, con imágenes y metadatos.
- *Audio descriptivo:* generar descripciones textuales objetivas mediante modelos multimodales y convertirlas a audio con TTS.
- *Narración contextual:* extraer y sintetizar información histórica de fuentes autoritativas, producir narraciones auditivas.
- *Ambiente sonoro:* integrar modelos generativos de imagen a audio para producir paisajes sonoros.
- *Interfaz accesible:* cliente web conforme a WCAG, compatible con lectores de pantalla y navegación por teclado.

== Requisitos No Funcionales

- *Accesibilidad:* interfaz intuitiva y compatible con herramientas asistivas.
- *Modularidad:* módulos de generación de contenido independientes y reemplazables.
- *Escalabilidad:* incorporar nuevas obras sin cambios estructurales.
- *Interoperabilidad:* servicios expuestos mediante API REST con endpoints documentados.

#v(.3cm)
*Modelo arquitectónico: cliente-servidor.* Desacopla la interfaz de usuario del procesamiento computacionalmente intensivo (inferencia de modelos y procesamiento multimedia).

== Arquitectura General

*API Gateway como componente central:*
- Centraliza el acceso a funcionalidades heterogéneas bajo una interfaz uniforme.
- Aísla los servicios internos, permitiendo evolución independiente.
- Concentra tareas de alto costo computacional en entorno controlado.

*Tecnología:* Django + Django REST Framework.
- ORM, arquitectura MVT, ecosistema de paquetes.
- Autenticación, manejo de rutas y middleware integrados.

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

Cada entrada contiene: autor, título, fecha, técnica, período, elementos visuales, contexto histórico, enlace a Wikipedia e imagen.

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

*Narraciones de Contexto:*
- Entrada: artículo de Wikipedia de la obra.
- Procesamiento: scraping + extracción de hechos clave + resumen narrativo.
- Salida: Kokoro TTS genera audio narrativo contextual.
- *Ventaja:* evita alucinaciones usando fuentes autoritativas en lugar de consultas directas al modelo.

== Sonidos Ambientales: Heurística

*Pipeline de 3 pasos:*

1. *Segmentación:* la obra se divide en 9 cuadrantes (3×3).

2. *Extracción semántica:* por cada cuadrante, Llama V4 detecta elementos con potencial sonoro (objetos, seres vivos). Salida en JSON con clasificación fondo/primer plano. Máximo 3 elementos por cuadrante.

3. *Síntesis de audio:* AudioLDM genera sonido para cada elemento. Mezcla multicanal con volúmenes diferenciados:
   - Fondo: −20 dB
   - Primer plano: −5 dB

== Frontend y Limitaciones

*Frontend:*
- Implementado en NextJS.
- Textos alternativos y etiquetas HTML descriptivas.
- Navegación mediante atajos de teclado.
- Placeholders en todos los inputs para lectores de pantalla.

*Limitaciones del desarrollo:*
- Por restricciones computacionales, los módulos generativos no se integraron directamente en la API Gateway.
- Se implementó un prototipo funcional en Jupyter para validar el flujo de procesamiento.
- Los datos fueron preprocesados y luego incorporados a la base de datos.
