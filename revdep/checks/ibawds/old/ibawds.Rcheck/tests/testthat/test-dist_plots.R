library(vdiffr)

test_that("test is_discrete_distribution() with densities", {
  expect_false(is_discrete_distribution(dnorm))
  expect_false(is_discrete_distribution(dcauchy))
  expect_false(is_discrete_distribution(dchisq, df = 10))
  expect_true(is_discrete_distribution(dhyper, m = 5, n = 6, k = 4))
  expect_true(is_discrete_distribution(dnbinom, size = 10, prob = 0.3, at = 4))
  expect_true(is_discrete_distribution(dpois, lambda = 1.5))
  expect_true(is_discrete_distribution(dbinom, size = 20, prob = 0.2, at = 12.3))
})

test_that("test is_discrete_distribution() with distribution functions", {
  expect_false(is_discrete_distribution(pnorm))
  expect_false(is_discrete_distribution(pnorm, mean = 1000, sd = 3, at = 999.5))
  expect_false(is_discrete_distribution(pcauchy))
  expect_false(is_discrete_distribution(pchisq, df = 10))
  expect_true(is_discrete_distribution(phyper, m = 5, n = 6, k = 4))
  expect_true(is_discrete_distribution(pnbinom, size = 10, prob = 0.3, at = 4))
  expect_true(is_discrete_distribution(ppois, lambda = 1.5))
  expect_true(is_discrete_distribution(pbinom, size = 20, prob = 0.2, at = 12.3))
})

test_that("test density_plot() for continuous distributions", {
  expect_doppelganger("density_plot normal",
    density_plot(dnorm, c(-5, 7), mean = 1, sd = 2, to = 3)
  )
  expect_doppelganger("density_plot chi2",
    density_plot(dchisq, c(-1, 10), df = 3, from = 2, points = c(1, 6))
  )
  expect_doppelganger("density_plot weibull",
    density_plot(dweibull, c(-2, 7), shape = 1, from = 1, to = 3.2,
                 var = "k", title = "Weibull")
  )
})


test_that("test distribution_plot() for continuous distributions", {
  expect_doppelganger("distribution_plot normal",
    distribution_plot(pnorm, c(-5, 7), mean = 1, sd = 2, points = c(-1, 4))
  )
  expect_doppelganger("distribution_plot uniform",
    distribution_plot(punif, c(-2, 7), min = 1, max = 5, points = c(2, 4),
                      var = "t", title = "Uniform")
  )
  # force discrete distribution to be plotted as a line
  expect_doppelganger("distribution_plot poisson continuous",
    distribution_plot(ppois, c(-2, 7), lambda = 2,points = c(2, 4),
                      is_discrete = FALSE)
  )
})


test_that("test density_plot() for discrete distributions", {
  expect_doppelganger("density_plot binomial",
    density_plot(dbinom, c(0, 12), size = 12, prob = 0.4, to = 7)
  )
  expect_doppelganger("density_plot poisson",
    density_plot(dpois, c(-1, 10), lambda = 3, from = 7, points = 2,
                 title = "Poisson", var = "g")
  )
  # this should give the same image as the one above
  expect_doppelganger("density_plot poisson",
    density_plot(dpois, c(-1.2, 10.3), lambda = 3, points = c(1.8, 7:10),
                 title = "Poisson", var = "g")
  )
})


test_that("test distribution_plot() for discrete distributions", {
  expect_doppelganger("distribution_plot binomial",
    distribution_plot(pbinom, c(-1, 10.2), size = 9, prob = 0.2,
                      points = c(2.3, 5.1))
  )
})
