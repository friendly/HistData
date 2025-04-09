library(rvest)
library(dplyr, warn.conflicts = FALSE)
library(magrittr, warn.conflicts = FALSE)

# reference tables
mrt1_ref <- tibble(
  Anforderung = c("Reproduzierbarkeit", "$\\geq 1$ Tabellen",
                  "$\\geq 2$ Arten Plots", "$\\geq 5$ Bilder/Tabellen",
                  "$\\geq 2$ stat. Auswertungen"),
  Beurteilung = c("OK", "3 Tabellen", "2 Arten Plots", "8 Bilder/Tabellen",
                  "2 stat. Auswertungen"),
  "Erf\u00fcllt" = "Ja"
)
mrt2_ref <- mrt1_ref %>%
  mutate(
    Beurteilung = c("NOK", "2 Tabellen", "3 Arten Plots", "3 Bilder/Tabellen",
                    "0 stat. Auswertungen"),
    "Erf\u00fcllt" = c("Nein", "Ja", "Ja", "Nein", "Nein")
)

grt1_ref <- tibble(
  Titel = c("Text", "Tabellen", "Plots", "Code", "Stat. Auswertungen", "Total"),
  Punkte = c(2.5, 2, 3, 1, 2, 10.5),
  Von = c(3L, 3L, 5L, 5L, 5L, 21L),
  Prozent = c("83%", "67%", "60%", "20%", "40%", "50%")
)

# helper function to parse the tables
parse_tab <- . %>%
    as.character() %>%
    read_html() %>%
    html_table() %>%
    extract2(1)

test_that("test create_minreq_table", {
  mrt1 <- create_minreq_table(TRUE, 3, 2, 5, 2)
  expect_s3_class(mrt1, "kableExtra")
  expect_equal(parse_tab(mrt1), mrt1_ref)

  mrt2 <- create_minreq_table(FALSE, 2, 3, 1, 0)
  expect_s3_class(mrt2, "kableExtra")
  expect_equal(parse_tab(mrt2), mrt2_ref)
})


test_that("test create_grading_table", {
  grt1 <- create_grading_table(2.5, 2, 3, 1, 2)
  expect_s3_class(grt1, "kableExtra")
  expect_equal(parse_tab(grt1), grt1_ref)
})


test_that("test invalid inputs", {
  expect_error(create_grading_table(1, 1, 1, 1, -1),
               "invalid points")
  expect_error(create_grading_table(1, 1, 6, 1, 1),
               "invalid points")
  expect_error(create_minreq_table(TRUE, 1, 1, 1, -1),
               "invalid input")
  expect_error(create_minreq_table(TRUE, 1, -1, 1, 1),
               "invalid input")
})
