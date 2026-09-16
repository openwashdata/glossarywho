definitions_path <- "inst/extdata/definitions.csv"
definitions <- readr::read_csv(definitions_path)
output_dir <- "vignettes/"

for (i in 1:nrow(definitions)) {
  term <- definitions$Term[i]
  desc <- definitions$Description[i]

  content <- glue::glue(
    "---
title: \"{term}\"
output: rmarkdown::html_document
---

# {term}

{desc}
"
  )

  writeLines(content, file.path(output_dir, paste0(term, ".Rmd")))
}
