test_that("test n_available_packages() with valid input", {
  skip_on_cran()
  skip_on_ci()
  expect_equal(n_available_packages("2020-01-01"), 15368)
})

test_that("test available_r_version() with valid input", {
  skip_on_cran()
  skip_on_ci()
  expect_equal(available_r_version("2020-01-01"), "3.6.2")
})

test_that("tests with invalid input", {
  expect_error(available_r_version(10), "is not a valid date")
  expect_error(n_available_packages("abc"), "is not a valid date")
  expect_error(n_available_packages("2013-07-02"),
               "MRAN has no data for dates before 2014-09-17")
  expect_error(available_r_version(Sys.Date() + 10),
               "MRAN has no data for dates in the future.")
  # setting these options causes file() to fail on URLs
  opts <- options(url.method = "none", encoding = "none")
  expect_error(n_available_packages(Sys.Date()),
               "Obtaining data from MRAN failed")
  expect_error(available_r_version(Sys.Date()),
               "Obtaining data from MRAN failed")
  options(opts)
  expect_error(get_mran_page(Sys.Date(), ""), "invalid value for type")
})
