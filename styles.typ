#import "config.typ": *
#import "utils.typ": font_size, font_type
#import "@preview/hydra:0.6.2": hydra

#let template(body) = {
  set page(
    header: context {
      if counter(page).get().first() >= 1 {
        grid(
          columns: (1fr, 1fr),
          align(left, title), align(right, hydra(1, skip-starting: false)),
        )
        line(length: 100%, stroke: 0.5pt)
      }
    },
    footer: context {
      let page-num = counter(page).display(here().page-numbering())
      if counter(page).get().first() >= 1 {
        align(center, page-num)
      }
    },
  )
  set page(numbering: "I")

  set heading(numbering: (..n) => {
    let pos = n.pos()
    if pos.len() == 1 {
      "第" + numbering("一", pos.at(0)) + "章"
    } else {
      pos.map(str).join(".")
    }
  })
  show heading.where(level: 1): it => {
    align(center, text(it, font: font_type.黑体, size: font_size.小二))
  }
  set text(font: font_type.宋体, size: font_size.小四)
  set par(first-line-indent: 2em, leading: (20pt - font_size.小四) * 1.265, spacing: (20pt - font_size.小四) * 1.265)

  body
}
