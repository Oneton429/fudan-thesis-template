#import "@preview/ctheorems:1.1.3": thmbox, thmproof, proof-bodyfmt
#import "utils.typ": font_size, font_type

>>>>>>> a6b6344 (feat: 定理与证明环境)
// 定义一系列 thmbox，共用一套计数器
// 例如：第一章内：定义 1.1、引理 1.2、定理 1.3、推论 1.4、注 1.5……
#let makeThmbox(kind, title) = thmbox(
  kind,
  title,
  base_level: 1,           // 统一层级
  inset: (top: 0em),       // 统一顶部间距
  separator: [.#h(0.2em)], // 分隔符
  namefmt: (name) => {     // 统一名称格式（加粗括号）
    if name != none {
      set text(font: font_type.宋体, weight: "bold", size: font_size.小四)
      "(" + name + ")"
    }
  },
  bodyfmt: (body) => {    // 统一内容 = 楷体
    set text(font: font_type.楷体, weight: "regular", size: font_size.小四)
    body
  }
)

//解决 thmbox 的缩进问题
#let makeTheorem(kind, title) = {
  let raw = makeThmbox(kind, title)

  (..args, body) => {
    set par(first-line-indent: (amount: 2em, all: false))
    raw(..args)[#body]
  }
}

// 使用示例：
// #theorem("定理名（可选）")[定理内容]
// 渲染效果：
// 定理 1.1(定理名)：定理内容
#let definition  = makeTheorem("theorem", "定义")
#let lemma       = makeTheorem("theorem", "引理")
#let theorem     = makeTheorem("theorem", "定理")
#let corollary   = makeTheorem("theorem", "推论")
#let proposition = makeTheorem("theorem", "命题")
#let remark      = makeTheorem("theorem", "注")


// 定义 thmproof，用于生成证明块
#let raw-proof = thmproof(
  "proof", text(style: "normal", weight: "bold")[证明], 
  inset: (top: 0em),       // 统一顶部间距
  separator: [.#h(0.2em)], // 分隔符
  bodyfmt: (body) => {    // 统一内容 = 楷体
    set text(font: font_type.宋体, weight: "regular", size: font_size.小四)
    proof-bodyfmt(body)
  }
)

// 解决 proof 的缩进问题
// 使用示例：
// #proof[证明过程]xi
#let proof(..args, body) = {
  set par(first-line-indent: (amount: 2em, all: false))
  raw-proof(..args)[#body]
}

