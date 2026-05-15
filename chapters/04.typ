= 图表

== 图表

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
    "圆柱",
    $ pi h (D^2 - d^2) / 4 $,
    [
      $h$: height \
      $D$: outer radius \
      $d$: inner radius
    ],

    "圆柱",
    $ pi h (D^2 - d^2) / 4 $,
    [
      $h$: height \
      $D$: outer radius \
      $d$: inner radius
    ],

    "正四面体", $ sqrt(2) / 12 a^3 $, [$a$: edge length],
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

== 表格样式禁用

当需要临时禁用表格样式（如伪代码`algo`）时，使用如下代码，如#link(<algo_1>, "伪代码")所示：

```typst
#state("_no-table-style").update(true)
... // 有关内容
#state("_no-table-style").update(false)
```

#state("_no-table-style").update(true)
#figure(caption: "非三线表测试表格")[
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
#import "@preview/algo:0.3.6": algo, d, i

#algo(
  stroke: none,
  fill: none,
  block-align: left,
  title: [#h(-2em) #smallcaps("Function 1")],
  parameters: ($p_0$,),
)[
  let a $<- [p_0]$ \
  for i in range(10):#i\
  a += 1#d\
]<algo_1>

#state("_no-table-style").update(false)
