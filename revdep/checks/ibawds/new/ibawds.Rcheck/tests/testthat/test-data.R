library(dplyr, warn.conflicts = FALSE)

test_that("test get_reading_exercise_files()", {
  tmpdir <- tempfile("reading_exercise_files")
  expect_error(get_reading_exercise_files(tmpdir),
               "Directory .* does not exist")
  dir.create(tmpdir)
  expect_true(get_reading_exercise_files(tmpdir))
  expect_equal(
    list.files(tmpdir, "\\.(csv|xlsx)$"),
    paste0("file", 1:8, ".",
           c("xlsx", "csv", "csv", "csv", "csv", "xlsx", "xlsx", "csv"))
  )
  expect_true(get_reading_exercise_files(tmpdir, unzip = FALSE))
  expect_equal(list.files(tmpdir, "\\.zip$"), "files.zip")
  unlink(tmpdir, recursive = TRUE)
})


test_that("test that cran_history is sorted by date and R version", {
  expect_equal(arrange(cran_history, date), cran_history)
  expect_equal(arrange(cran_history, as.numeric_version(version), date),
               cran_history)
})
