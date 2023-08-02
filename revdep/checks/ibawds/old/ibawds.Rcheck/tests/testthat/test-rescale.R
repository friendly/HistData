test_that("test rescaling of vectors", {
  set.seed(1234)
  x <- runif(100)
  expect_equal(rescale(x), x)
  expect_equal(mean(rescale(x, mu = 12)), 12)
  expect_equal(sd(rescale(x, mu = 12)), sd(x))
  expect_equal(sd(rescale(x, sigma = 7)), 7)
  expect_equal(mean(rescale(x, sigma = 7)), mean(x))
  expect_equal(mean(rescale(x, mu = 3, sigma = 7)), 3)
  expect_equal(sd(rescale(x, mu = 3, sigma = 7)), 7)
})

test_that("test rand_with_cor()", {
  set.seed(1234)
  y <- runif(100)
  expect_equal(cor(rand_with_cor(y, 0.7), y), 0.7)
  expect_equal(cor(rand_with_cor(y, -0.2), y), -0.2)
  expect_equal(mean(rand_with_cor(y, -0.2, mu = 3, sigma = 1.5)), 3)
  expect_equal(sd(rand_with_cor(y, 0.7, mu = 3, sigma = 1.5)), 1.5)
})

test_that("test rescale() and rand_with_cor() with bad inputs", {
  expect_warning(rescale(1:10, mu = 1:2), "must be single numbers")
  expect_warning(rescale(1:10, sigma = 1:2), "must be single numbers")
  expect_error(rescale(1:10, sigma = -5), "sigma must be positive")
  expect_error(rand_with_cor(1:10, 3), "rho must lie between -1 and 1")
})
