test_that("check get_required_packages()", {
  req_pkgs <- get_required_packages()
  expect_type(req_pkgs, "character")
  pkgs <- c("dslabs", "stats", "grDevices", "methods", "rlang",
            "ggplot2", "scales", "dplyr", "stringr", "magrittr", "deldir",
            "kableExtra", "tidyverse", "rmarkdown", "caret", "reshape2",
            "lubridate", "ggrepel", "writexl", "cowplot", "DT", "gutenbergr",
            "tidytext", "rvest", "Lahman", "pdftools", "HistData", "titanic",
            "BiocManager", "waldo", "cluster", "ggfortify",
            "knitr", "hexbin", "patchwork", "GGally")
  expect_true(all(pkgs %in% req_pkgs))
  expect_false(any(c("R", "testthat", "usethis", "vdiffr", "covr") %in% req_pkgs))
})

# this test only succeeds on systems, where all the required
# packages are installed.
test_that("test install_ibawds()", {
  req_pkgs <- get_required_packages()
  skip_if_not(suppressMessages(rlang::is_installed(req_pkgs)),
              "not all the required packages are installed.")
  expect_message(install_ibawds(), "All the required packages are installed.")
})

# downgrade_packages() is only tested for a package that does not exist.
test_that("test downgrade_packages()", {
  expect_warning(
    expect_equal(downgrade_packages("thispackagedoesnotexistoncran"),
                 character(0)),
    "thispackagedoesnotexistoncran is not installed and cannot be downgraded."
  )
})
