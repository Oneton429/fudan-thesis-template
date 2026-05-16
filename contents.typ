#import "utils.typ": font_size, font_type

#pagebreak(weak: true)

#show outline: it => {
  show heading: set text(size: font_size.二号)
  it
}

#show outline.entry: it => {
  let is-chapter = it.level == 1
  set text(
    font: if is-chapter { font_type.黑体 } else { font_type.宋体 },
    weight: if is-chapter { "bold" } else { "regular" },
    size: font_size.小四,
  )
  link(
    it.element.location(),
    it.indented(
      it.prefix(),
      [#it.body() #box(width: 1fr, if not is-chapter { it.fill }) #it.page()],
    ),
  )
  v(12pt)
}

#outline(
  title: "目录",
  depth: 3,
)

#pagebreak(weak: true)
