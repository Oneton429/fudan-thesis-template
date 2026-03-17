= 图表

#figure(caption: "测试表格")[
  #table(
    columns: (auto, auto, auto),
    inset: 5pt,
    align: center + horizon,
    table.header([], [*Area*], [*Parameters*]),
    "圆柱",
    $ pi h (D^2 - d^2) / 4 $,
    [
      $h$: height \
      $D$: outer radius \
      $d$: inner radius
    ],
  )
]

以上为单页测试表格，下面是单张图片。

#figure(caption: "测试图片")[
  #image("../cover/badge.jpg")
]

如遇表格标题与表格内容完全分开的情况，请手动插入

```typst
#pagebreak(weak: true)
```

来将标题换页至下一页。

#figure(caption: "测试表格")[
  #table(
    columns: (auto, auto, auto),
    inset: 5pt,
    align: center + horizon,
    table.header([], [*Area*], [*Parameters*]),
    "圆柱",
    $ pi h (D^2 - d^2) / 4 $,
    [
      $h$: height \
      $D$: outer radius \
      $d$: inner radius
    ],

    "正四面体", $ sqrt(2) / 12 a^3 $, [$a$: edge length],
  )
]

@fig:test1 是组图：

#figure(
  caption: [组图测试],
  kind: image,
)[
  #grid(
    columns: (auto, auto),
    gutter: 5em,

    figure(caption: "(a) 子图1")[
      #image("../cover/badge.jpg", height: 10%)
    ],
    figure(caption: "(b) 子图2")[
      #image("../cover/signage.jpg", height: 10%)
    ],
  )
] <fig:test1>
