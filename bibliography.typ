#import "utils.typ": font_size, font_type

#pagebreak(weak: true)

#show heading: it => {
  it
  if it.body == [参考文献] {
    v(22pt)
  }
}

#bibliography(
  "reference.bib",
  title: "参考文献",
  style: "gb-7714-2005-numeric",
)
