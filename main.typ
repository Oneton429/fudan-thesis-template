#import "styles.typ": template
#show: template

#include "cover/cover.typ"
#include "contents.typ"
#include "chapters/abstract-zh.typ"
#include "chapters/abstract-en.typ"
#set page(numbering: "1")
#counter(page).update(1)

#for chapter_id in range(1, 5) {
  include "chapters/" + numbering("01", chapter_id) + ".typ"
}

#include "bibliography.typ"
#include "chapters/acknowledgments.typ"
