#import "@preview/glossy:0.8.0": theme-compact
#import "@preview/glossy:0.8.0": *

#set heading(numbering: "1.")

#let conf(doc, cols) = {
  set page(
    paper: "a4",
    margin: (
      x: 2cm,
      top: 2cm,
      bottom: 2cm,
    ),
    columns: cols
  )
  set par(justify: true, leading: 0.5em, spacing: 2em, first-line-indent: 1em)
   set text(
    font: "Times New Roman",
    size: 10pt,
  )
  set text(
    size: 10pt,
  )
  doc
}

#show heading: set block(below: 2em, above: 2em)

#set par(first-line-indent: 1em)

#show: doc => conf(
  doc,
  1
)

#set text(size: 15pt)


#align(center + horizon)[
  #image("assets/fs-logo.jpeg", width: auto, height: 7%)
  Frankfurt School of Finance & Management \
  ---
  
  *Suppression as a Service* \
  Suppressive Reputation Management in Germany's Point of Interest Economy\ \
  // How is the implementation of the Digital Services Act impacting the integrity and availability of online reviews on Google in Germany, and what are the potential implications for consumer information search and trust in the digital marketplace?
  // How does the geographic concentration of Digital Services Act enforcement create differential information environments for consumers across EU markets, and what are the implications for consumer trust and decision-making in digital review platforms? \

    Student \
    *Bade Obari*\ 8470888
    


  
  *Bachelor's Thesis* \ \
  *B.Sc. Business Administration * \ \
  Supervised by Prof. Georgia Liadeli, Assistant Professor for Marketing\
  

  #set text(size: 14pt)
  

  November $15^"th"$, 2025
  
]

#pagebreak()


#outline()



#set text(size: 12pt)

// #outline()

#show: doc => conf(
  doc,
  1
)

#set text(size: 12pt)

#import "@preview/codly:1.3.0": *
#show: codly-init.with()

#codly(zebra-fill: none)



#counter(page).update(n => n - 2)

#set par(leading: 2em)
#show heading: set text(navy)

#set page(footer: context [
    #h(1fr)
    #counter(page).display(
      "1 of 1",
      both: true,
  )
])

#include "sections/1_introduction.typ" 
#pagebreak()
#include "sections/2_literature_review.typ"
#pagebreak()
#include "sections/3_methodology.typ"
#pagebreak()
#include "sections/4_results.typ"
#pagebreak()
#include "sections/5_discussion.typ"

#pagebreak()
#bibliography(("bibliography/introduction.bib", "bibliography/other.bib", "bibliography/methodology.bib", "bibliography/academic-papers/a-journals.bib"), style: "american-psychological-association")
/* 
#pagebreak()
#set par(first-line-indent: 0em)

#set page(flipped: true)
#include "sections/appendix/1_tdb_cols.typ"

// #include "sections/appendix/lumen.typ"