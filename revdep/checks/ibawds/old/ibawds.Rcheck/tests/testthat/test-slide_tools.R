library(ggplot2)
library(knitr)
library(stringr)
library(rmarkdown)


test_that("check that define_latex_stats() creates output", {
  expect_output(expect_invisible(out <-define_latex_stats()))
  expect_null(out)
})

# test knitting with define_latex_stats()
commands <- paste0("\\",
                   c("E", "P", "Var", "Cov", "Cor", "SD", "SE", "Xb", "Yb"))
txt <- paste("---
output:
  pdf_document: default
---

```{r results = \"asis\", echo = FALSE}
  ibawds::define_latex_stats()
```
$$", paste(commands, collapse = " "), "$$")
res <- knitr::knit(text = txt, quiet = TRUE)


test_that("check that define_latex_stats() defines all the expected commands", {
  # check output when knitting
  expect_type(res, "character")
  expect_equal(
    str_detect(res, paste0("\\\\(re)?newcommand\\{\\", commands, "\\}\\{.*\\}")),
    rep(TRUE, length(commands))
  )

  # check rendering  a document
  skip_on_ci()
  skip_on_cran()
  rmd_file <- tempfile(fileext = ".Rmd")
  pdf_file <- str_replace(rmd_file, "Rmd", "pdf")
  on.exit(unlink(c(rmd_file, pdf_file)))
  writeLines(txt, rmd_file)
  expect_silent(render(rmd_file, quiet = TRUE))
  expect_true(file.exists(pdf_file))
})


# store current options as reference
ref_opts <- list(ggplot = theme_get(),
                 base = options("pillar.print_max", "pillar.print_min"))

test_that("test set_slide_options() with default values", {
  on.exit({
    theme_set(ref_opts$ggplot)
    options(ref_opts$base)
  })
  expect_invisible(set_slide_options()) %>%
    expect_equal(ref_opts)
  expect_equal(theme_get()$text$size, 22)
  expect_equal(as.numeric(theme_get()$plot.margin), rep(10, 4))
  expect_equal(options("pillar.print_max", "pillar.print_min"),
               list(pillar.print_max = 12, pillar.print_min = 8))
})

test_that("test set_slide_options() with other values", {
  on.exit({
    theme_set(ref_opts$ggplot)
    options(ref_opts$base)
  })
  expect_equal(set_slide_options(ggplot_text_size = 18,
                                 ggplot_margin_pt = c(4, 6, 9, 2),
                                 tibble_print_max = 33,
                                 tibble_print_min = 2),
               ref_opts)
  expect_equal(theme_get()$text$size, 18)
  expect_equal(as.numeric(theme_get()$plot.margin), c(4, 6, 9, 2))
  expect_equal(options("pillar.print_max", "pillar.print_min"),
               list(pillar.print_max = 33, pillar.print_min = 2))
})
