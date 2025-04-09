library(stringr)

# CRAN URL must be set for the tests to work
options(repos = c(CRAN = "https://cloud.r-project.org"))


test_that("get_cran_page() works", {
  skip_on_cran()
  expect_true(
    any(str_detect(get_cran_page("packages"), "Contributed Packages"))
  )
  expect_true(
    any(str_detect(get_cran_page("main"), "Comprehensive R Archive Network"))
  )
  expect_error(get_cran_page("nonsense"), "invalid value for type")
})


test_that("n_available_packages() works", {
  skip_on_cran()
  expect_type(n_available_packages(), "integer")
  expect_gt(n_available_packages(), 15000)
})


test_that("available_r_version() works", {
  skip_on_cran()
  expect_match(available_r_version(), "\\d\\.\\d\\.\\d")
})


test_that("failing internet connection is handled", {
  # setting these options causes file() to fail on URLs
  opts <- options(url.method = "none", encoding = "none")
  expect_error(get_cran_page("packages"),
               "Obtaining data from CRAN failed")
  expect_error(n_available_packages(),
               "Obtaining data from CRAN failed")
  expect_error(available_r_version(),
               "Obtaining data from CRAN failed")
  options(opts)
})
