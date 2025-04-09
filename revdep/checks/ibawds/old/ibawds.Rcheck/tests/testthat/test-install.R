library(withr)
library(dplyr, warn.conflicts = FALSE)
library(readr, warn.conflicts = FALSE)

# CRAN URL must be set for the tests to work
options(repos = c(CRAN = "https://cloud.r-project.org"))

test_that("check get_required_packages()", {
  req_pkgs <- get_required_packages()
  expect_type(req_pkgs, "character")
  pkgs <- c("dslabs", "stats", "grDevices", "tools", "rlang", "tidyr", "readr",
            "ggplot2", "scales", "dplyr", "stringr", "magrittr", "deldir",
            "kableExtra", "tidyverse", "rmarkdown", "caret", "reshape2",
            "lubridate", "ggrepel", "writexl", "cowplot", "DT",
            "tidytext", "rvest", "Lahman", "HistData", "titanic",
            "BiocManager", "waldo", "clValid", "ggfortify", "purrr",
            "knitr", "hexbin", "patchwork", "GGally", "party", "RANN", "ranger",
            "rstudioapi", "remotes", "cli", "gutenbergr", "styler")
  expect_setequal(pkgs, req_pkgs)
  not_req_pkgs <- c("R", "testthat", "usethis", "vdiffr", "covr", "spelling",
                    "httr2")
  expect_false(
    any(not_req_pkgs %in% req_pkgs)
  )
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
    expect_false(downgrade_packages("notoncran!")),
    "\"notoncran!\" is not installed and cannot be downgraded."
  )
})


test_that("test get_version_after_to_install()", {
  expect_equal(
    get_version_after_to_install(as.numeric_version("1.4.3"), "any"),
    as.numeric_version("1.4.3")
  )
  expect_equal(
    get_version_after_to_install(as.numeric_version("1.4.3.2"), "any"),
    as.numeric_version("1.4.3.2")
  )
  expect_equal(
    get_version_after_to_install(as.numeric_version("1.4.3"), "patch"),
    as.numeric_version("1.4.3")
  )
  expect_equal(
    get_version_after_to_install(as.numeric_version("1.4.3.2"), "patch"),
    as.numeric_version("1.4.3.0")
  )
  expect_equal(
    get_version_after_to_install(as.numeric_version("1.4.3"), "minor"),
    as.numeric_version("1.4.0")
  )
  expect_equal(
    get_version_after_to_install(as.numeric_version("1.4.3.2"), "minor"),
    as.numeric_version("1.4.0.0")
  )
  expect_equal(
    get_version_after_to_install(as.numeric_version("1.4.3"), "major"),
    as.numeric_version("1.0.0")
  )
  expect_equal(
    get_version_after_to_install(as.numeric_version("1.4.3.2"), "major"),
    as.numeric_version("1.0.0.0")
  )
})


test_that("test get_software_versions()", {
  sw <- get_software_versions()
  expect_named(sw, c("os", "R", "RStudio", "pkg_installed", "ibawds"))
  expect_named(sw$R, c("version", "date"))
  expect_named(sw$RStudio, c("version", "date"))
  expect_named(sw$ibawds, c("installed", "current"))
  expect_type(sw$os, "character")
  expect_s3_class(sw$R$version, "numeric_version")
  expect_s3_class(sw$R$date, "Date")
  # NA as version number is not supported for R < 4.4.0, so the check needs
  # to be different depending on the R version
  if (getRversion() >= "4.4.0") {
    expect_s3_class(sw$RStudio$version, "numeric_version")
  } else {
    expect_type(sw$RStudio$version, "character")
  }
  expect_s3_class(sw$RStudio$date, "Date")
  expect_true(sw$pkg_installed)
  expect_s3_class(sw$ibawds$installed, "numeric_version")
  expect_s3_class(sw$ibawds$current, "numeric_version")
})


test_that("Test find_lectures_root()", {
  withr::with_tempdir({
    curr_dir <- getwd()
    expect_error(find_lectures_root(curr_dir),
                 "Directory.*not inside a lectures directory")
    expect_error(find_lectures_root(file.path(curr_dir, "does_not_exist")),
                 "Directory.*does not exist")
    subdirs <- "01_R_Basics/slides/pics"
    dir.create(subdirs, recursive = TRUE)
    expect_equal(find_lectures_root(curr_dir), normalizePath(curr_dir))
    expect_equal(find_lectures_root(file.path(curr_dir, subdirs)),
                 normalizePath(curr_dir))
    subdirs <- "02_Visualisation/exercises/"
    dir.create(subdirs, recursive = TRUE)
    expect_equal(find_lectures_root(file.path(curr_dir, subdirs)),
                 normalizePath(curr_dir))
  })
})


test_that("Test get_used_packages()", {
  with_tempfile("rfile", {
    # write file that loads packages in various ways.
    write_lines(
      c("library(p1)", "library(\"p2\")", "library('p3')",
        "library(p4, warn.conflicts = FALSE)",
        "require(p5)", "require(\"p6\")", "require('p7')",
        "require(p8, quietly = TRUE)",
        "    library(p9)", "    require('p10')", "library(p11, lib.loc = '/')",
        # duplicates should be removed
        "library(p12)", "require(p12)", "library('p12')", "require(\"p12\")",
        # comments should be ignored
        "# library(p13)"),
      rfile
    )
    expect_equal(get_used_packages(basename(rfile), dirname(rfile)),
                 tibble(file = basename(rfile), package = paste0("p", 1:12)))
  })
})
