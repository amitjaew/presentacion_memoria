#import "@preview/diatypst:0.9.3": *

#show: slides.with(
  title: [
    Diseño y Desarrollo de
    Plataforma de Apreciación Artistica para
    Personas con Discapacidad Visual
  ],
  subtitle: [
    Memoria de Titulación #linebreak()
    para optar al título de Ingeniero Civil Telemático
  ],
  date: "22-06-2026",
  authors: ("Alexey Nikolay Mitjaew Hupat"),

  // Optional (for more see docs at https://mdwm.org/diatypst/)
  ratio: 16/9,
  layout: "medium",
  title-color: blue.darken(60%),
  toc: true,
)

#set align(horizon)

#include "sections/01_introduccion.typ"
#include "sections/02_marco_teorico.typ"
#include "sections/03_estado_del_arte.typ"
#include "sections/04_desarrollo_plataforma.typ"
#include "sections/05_resultados.typ"
#include "sections/06_conclusion.typ"
#include "sections/07_bibliografia.typ"
