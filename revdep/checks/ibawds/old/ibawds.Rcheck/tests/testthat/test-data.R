test_that("test get_reading_exercise_files()", {
  tmpdir <- tempfile("reading_exercise_files")
  expect_error(get_reading_exercise_files(tmpdir), "does not exist")
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
