#import "../config.typ": *
#import "../utils.typ": font_size
#import "@preview/cuti:0.4.0": show-fakebold
#show: show-fakebold
#set document(
  author: author,
  date: date,
  title: title,
)
#set align(center)
#set page(margin: (top: 2.54cm, bottom: 2.54cm, left: 3.18cm, right: 3.18cm))
#set par(spacing: 0.2em)
#set text(top-edge: "ascender", bottom-edge: "descender")
#let 宋体 = ("SimSun-ExtG", "SimSun")
#let 黑体 = ("SimHei",)
#let 仿宋 = ("FangSong_GB2312", "FangSong")

#v(35pt)
#image(
  "signage.jpg",
  width: 45%,
)
#text(
  "本科毕业论文（设计）",
  font: 黑体,
  size: 35pt,
)
#image("badge.jpg")

#set par(spacing: 1em)
#v(88pt)
#align(center)[
  #block(width: 400pt)[
    #set text(font: 黑体, size: font_size.小三)
    #set par(first-line-indent: 0.75em)

    #grid(
      columns: (1.25fr, 1fr),
      row-gutter: 1.05em,
      align: left,

      grid.cell(colspan: 2)[论文题目：#text(title, size: font_size.小三, weight: "bold")],
      grid.cell(colspan: 2)[],
      grid.cell(colspan: 2)[],

      [姓　　名：#author], [学　　号：#student_id],
      grid.cell(colspan: 2)[院　　系：#school],
      grid.cell(colspan: 2)[专　　业：#major],
      [指导教师：#instructor], [职　　称：#instructor_type],
      grid.cell(colspan: 2)[单　　位：#orginazition],
      grid.cell(
        colspan: 2,
      )[完成日期：　　　　#date.display("[year] 年 [month padding:none] 月 [day padding:none] 日")],
    )
  ]
]

#page(
  background: image("AI.pdf", page: 1),
)[
  #set text(font: 仿宋, size: font_size.三号)
  #if ai_statement.used {
    place("✔", dx: 50%, dy: 38.3%)
    place(
      box(
        width: 50%,
        height: 1em,
        align(center + horizon)[#ai_statement.tools.join(", ")],
      ),
      dx: 48%,
      dy: 46.7%,
    )
    place(
      box(
        // stroke: 1pt,
        width: 68%,
        height: 1em,
        align(center + horizon)[#ai_statement.platform.join(", ")],
      ),
      dx: 29.5%,
      dy: 51.3%,
    )
    for (i, (k, v)) in ai_statement.functions.pairs().enumerate() {
      if k != "其他" and v {
        place("✔", dx: 0.7%, dy: 60.6% + i * 4.5%)
      }
      if k == "其他" and v != "" {
        place("✔", dx: 0.7%, dy: 60.6% + i * 4.5%)
        place(
          box(
            // stroke: 1pt,
            width: 41%,
            height: 1em,
            align(center + horizon, v),
          ),
          dx: 18%,
          dy: 82.7%,
        )
      }
    }
  } else {
    place("✔", dx: 71%, dy: 38.3%)
  }
]

#page(
  background: image("AI.pdf", page: 2),
)[
  #set text(font: 仿宋, size: font_size.三号)
  #place(date.display("[year]"), dx: 66.6%, dy: 85.4%)
  #place(date.display("[month padding:none]"), dx: 82.7%, dy: 85.4%)
  #place(date.display("[day padding:none]"), dx: 91.5%, dy: 85.4%)
]

#align(center)[
  #block(width: 16.31cm)[
    #table(
      columns: (1fr, 1fr, 1fr, 1fr),
      rows: (6.51cm, 12.68cm, 1.22cm, 1.93cm),
      inset: (x: 5pt, y: 10pt),
      stroke: 0.5pt,
      align: left + top,
      table.cell(colspan: 4)[
        #text("指导教师对论文学术规范的审查意见：", font: 黑体, size: font_size.小三)

        #v(12pt)

        　 　#text("☐ 本人经过尽职审查，未发现毕业论文有学术不端行为。", font: 宋体, size: font_size.五号)

        #v(9pt)

        　 　#text("☐ 本人经过尽职审查，发现毕业论文有如下学术不端行为：", font: 宋体, size: font_size.五号)

        #v(20pt)

        #text(
          "指导教师签名：　　　　 　　　　日期：　20　 年　月　日",
          font: 黑体,
          size: font_size.小四,
          weight: "bold",
        )
      ],
      table.cell(colspan: 2)[
        #set text(font: 黑体)

        #text("指导教师评语：", size: font_size.小三)

        #v(290pt)

        #text("签名：", size: font_size.小四, weight: "bold")

        #v(-10pt)

        #text("20 　年　月　日", size: font_size.小四, weight: "bold")
      ],
      table.cell(colspan: 2)[
        #set text(font: 黑体)
        #text("答辩委员会（小组）评语：", size: font_size.小三)

        #v(290pt)

        #text("签名：", size: font_size.小四, weight: "bold")

        #v(-10pt)

        #text("20 　年　月　日", size: font_size.小四, weight: "bold")
      ],
      align(center + horizon)[#text("学分", font: 宋体, weight: "bold")],
      "",
      align(center + horizon)[#text("成绩", font: 宋体, weight: "bold")],
      "",
      table.cell(colspan: 4)[
        #v(-8pt)
        #text("备注：", font: 宋体, weight: "bold", size: font_size.小四)
      ],
    )

    #v(-2.75pt)

    #grid(
      columns: (1fr, 1fr, 1fr, 1fr),
      align: left,
      grid.cell(colspan: 3)[],
      [
        #text(" 教务处制", font: 黑体, size: font_size.小三)
      ],
    )
  ]
]
