#import "config.typ": *
#import "utils.typ": font_size, font_type
#import "@preview/hydra:0.6.2": hydra
#import "@preview/zh-format:0.1.0": zh-format

#let template(body) = {
  // 页眉与页码
  set page(
    header: context {
      if counter(page).get().first() >= 1 {
        grid(
          columns: (1fr, auto),
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

  // 按章编号
  set figure(numbering: n => context {
    let chapter = counter(heading.where(level: 1)).get().first()
    if chapter > 0 {
      str(chapter) + "-" + str(n)
    } else {
      str(n)
    }
  })
  set math.equation(numbering: n => context {
    let chapter = counter(heading.where(level: 1)).get().first()
    if chapter > 0 {
      "(" + str(chapter) + "-" + str(n) + ")"
    } else {
      "(" + str(n) + ")"
    }
  })

  // 标题
  set heading(numbering: (..n) => {
    let pos = n.pos()
    if pos.len() == 1 {
      "第" + numbering("一", pos.at(0)) + "章"
    } else {
      pos.map(str).join(".")
    }
  })
  show heading.where(level: 1): set text(font: font_type.黑体, size: font_size.小二, weight: "regular")
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    counter(figure.where(kind: raw)).update(0)
    counter(math.equation).update(0)
    align(center, it)
  }
  show heading.where(numbering: none): it => {
    it
    v(22pt)
  }

  // 图表
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: table): set block(breakable: true)
  set figure.caption(separator: "　")
  show table: set math.equation(numbering: none)
  let table-starts = state("table-starts", (:))
  let sys-table-counter = counter("sys-table-counter")
  show table: it => {
    if it.children.len() > 0 and it.children.last().func() == table.hline {
      return it
    }

    let original-args = (:)
    for (k, v) in it.fields() {
      if k not in ("children", "stroke") {
        original-args.insert(k, v)
      }
    }
    let has-header = it.children.any(c => c.func() == table.header)
    if not has-header {
      return table(
        ..original-args,
        stroke: none,
        table.hline(stroke: 1pt), ..it.children, table.hline(stroke: 1pt)
      )
    }

    let col-count = if type(it.columns) == array { it.columns.len() } else if type(it.columns) == int {
      it.columns
    } else { 1 }
    let ghost-row = table.cell(
      colspan: col-count,
      fill: none,
      inset: 0pt,
      stroke: none,
      context {
        let idx = sys-table-counter.get().first()
        let starts = table-starts.get()
        let start-page = starts.at(str(idx), default: none)
        let current-page = here().page()

        if start-page == none {
          table-starts.update(s => {
            s.insert(str(idx), current-page)
            s
          })
        } else if current-page != start-page {
          pad(bottom: 0.5em)[
            #set text(font: font_type.宋体, size: font_size.五号)
            #align(right)[续表 #counter(figure.where(kind: table)).display()]
          ]
        }
      },
    )

    let new-children = ()
    for child in it.children {
      if child.func() == table.header {
        new-children.push(table.header(
          repeat: true,
          ghost-row,
          table.hline(stroke: 1pt),
          ..child.children,
          table.hline(stroke: 0.5pt),
        ))
      } else {
        new-children.push(child)
      }
    }
    (
      sys-table-counter.step()
        + table(
          ..original-args,
          stroke: none,
          ..new-children,
          table.hline(stroke: 1pt)
        )
    )
  }
  show grid: set figure(numbering: none)

  // 正文字体
  set text(font: font_type.宋体, size: font_size.小四, lang: "zh", region: "cn", costs: (orphan: 0%))
  set par(
    first-line-indent: (amount: 2em, all: true),
    leading: (20pt - font_size.小四) * 1.265,
    spacing: (20pt - font_size.小四) * 1.265,
  )

  show: zh-format
  body
}
