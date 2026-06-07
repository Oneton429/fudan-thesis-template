#import "../config.typ": *
#import "../utils.typ": font_size
#set document(
  author: author,
  date: date,
  title: title,
)
#set page(margin: (top: 2.54cm, bottom: 2.54cm, left: 3.18cm, right: 3.18cm))
#set text(top-edge: "ascender", bottom-edge: "descender")
#let 仿宋 = ("FangSong_GB2312", "FangSong")

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
