#let template(body) = {
  set heading(numbering: (..n) => {
    let pos = n.pos()
    if pos.len() == 1 {
      "第" + numbering("一", pos.at(0)) + "章"
    } else {
      pos.map(str).join(".")
    }
  })

  body
}
