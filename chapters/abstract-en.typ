#import "../utils.typ": font_size, font_type

#let keywords = ("Typst", "Bachelor's Degree", "Graduation Thesis", "Template", "Open-source Projects")

#pagebreak(weak: true)

#heading("ABSTRACT", numbering: none)

This is the English abstract section.

#linebreak()

#grid(
  columns: (6.04em, 1fr),
  text("Keywords: ", font: font_type.黑体, size: font_size.小三), keywords.join(", "),
)
