pkgname <- "statsr"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('statsr')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("BF_app")
### * BF_app

flush(stderr()); flush(stdout())

### Name: BF_app
### Title: Run the interactive Bayes Factor shiny app
### Aliases: BF_app

### ** Examples

if (interactive()) { 
BF.app()
}



cleanEx()
nameEx("ames_sampling_dist")
### * ames_sampling_dist

flush(stderr()); flush(stdout())

### Name: ames_sampling_dist
### Title: Simulate Sampling Distribution
### Aliases: ames_sampling_dist

### ** Examples

if (interactive()) { 
  ames_sampling_dist()
}



cleanEx()
nameEx("bandit_posterior")
### * bandit_posterior

flush(stderr()); flush(stdout())

### Name: bandit_posterior
### Title: bandit posterior
### Aliases: bandit_posterior

### ** Examples

data = data.frame(machine = c(1L, 1L, 1L, 1L, 1L, 2L, 2L, 2L, 2L, 2L), 
                  outcome = c("W", "L", "W", "L", "L", "W", "L", "L", "L", "W"))
bandit_posterior(data)
plot_bandit_posterior(data)




cleanEx()
nameEx("bandit_sim")
### * bandit_sim

flush(stderr()); flush(stdout())

### Name: bandit_sim
### Title: Run the Bandit Simulation shiny app
### Aliases: bandit_sim

### ** Examples

if (interactive()) {
# run interactive shiny app to generate wins and losses
bandit_sim()
}
# paste data from the shiny app into varible
data = data.frame(
 machine = c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L,
   1L, 1L, 1L, 1L, 1L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 
   2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 1L, 1L, 1L, 1L, 1L,
   2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 1L, 1L, 1L, 1L, 1L,
   2L, 2L, 2L, 2L, 2L, 1L, 1L, 1L, 1L, 1L, 2L, 2L, 2L, 2L, 2L, 
   1L, 1L, 1L, 1L, 1L, 2L, 2L, 2L, 2L, 2L, 1L, 1L, 1L, 1L, 1L,
   2L, 2L, 2L, 2L, 2L, 1L, 1L, 1L, 1L, 1L, 2L, 2L, 2L, 2L, 2L, 
   1L, 1L, 1L, 1L, 1L, 2L, 2L, 2L, 2L, 2L, 1L, 1L, 1L, 1L, 1L), 
 outcome = c("W", "W", "W", "L", "W", "W", "W", "L", "W", "L", "W", "L",
  "L", "L", "W", "L", "W", "L", "L", "L", "W", "W", "W", "L", "L", "L", 
  "L", "L", "W", "W", "L", "L", "W", "L", "L", "W", "L", "L", "W", "L",
  "L", "L", "L", "L", "W", "L", "L", "W", "W", "W", "W", "L", "L", "L",
  "L", "L", "L", "W", "L", "W", "L", "W", "L", "L", "L", "L", "L", "L", "L",
  "L", "L", "L", "W", "W", "W", "L", "W", "L", "L", "L", "L", "L", "L", "L",
  "L", "L", "L", "W", "W", "W", "W", "W", "L", "W", "W", "L", "W", "L", "L",
  "L", "L", "L", "W", "L", "W", "L", "L", "L", "W", "W", "W", "W", "L", "L",
  "W", "L", "W", "L", "L", "W"))
  bandit_posterior(data)
  plot_bandit_posterior(data)




cleanEx()
nameEx("bayes_inference")
### * bayes_inference

flush(stderr()); flush(stdout())

### Name: bayes_inference
### Title: Bayesian hypothesis tests and credible intervals
### Aliases: bayes_inference

### ** Examples


# inference for the mean from a single normal population using
# Jeffreys Reference prior, p(mu, sigma^2) = 1/sigma^2

library(BayesFactor)
data(tapwater)

# Calculate 95% CI using quantiles from Student t derived from ref prior
bayes_inference(tthm, data=tapwater,
                statistic="mean", 
                type="ci", prior_family="ref",
                method="theoretical")



cleanEx()
nameEx("calc_streak")
### * calc_streak

flush(stderr()); flush(stdout())

### Name: calc_streak
### Title: Calculate hitting streaks
### Aliases: calc_streak

### ** Examples

data(kobe_basket)
calc_streak(kobe_basket$shot)




cleanEx()
nameEx("credible_interval_app")
### * credible_interval_app

flush(stderr()); flush(stdout())

### Name: credible_interval_app
### Title: Credible Interval shiny app
### Aliases: credible_interval_app

### ** Examples

if (interactive()) {
   credible_interval_app()
}



cleanEx()
nameEx("inference")
### * inference

flush(stderr()); flush(stdout())

### Name: inference
### Title: Hypothesis tests and confidence intervals
### Aliases: inference

### ** Examples

data(tapwater)

# Calculate 95% CI using quantiles using a Student t distribution
inference(tthm, data=tapwater,
                statistic="mean", 
                type="ci",
                method="theoretical")
                
inference(tthm, data=tapwater,
                statistic="mean", 
                type="ci",
                boot_method = "perc",
                method="simulation")
                
# Inference for a proportion
# Calculate 95% confidence intervals for the proportion of atheists

data("atheism")
library("dplyr")
us12 <- atheism %>%
        filter(nationality == "United States" , atheism$year == "2012")
inference(y = response, data = us12, statistic = "proportion",
          type = "ci",
          method = "theoretical", 
          success = "atheist")
                



cleanEx()
nameEx("plot_bandit_posterior")
### * plot_bandit_posterior

flush(stderr()); flush(stdout())

### Name: plot_bandit_posterior
### Title: plot_bandit_posterior
### Aliases: plot_bandit_posterior

### ** Examples

# capture data from the `shiny` app `bandit_sim`.
data = data.frame(machine = c(1L, 1L, 1L, 1L, 1L, 2L, 2L, 2L, 2L, 2L), 
                  outcome = c("W", "L", "W", "L", "L", "W", "L", "L", "L", "W"))
plot_bandit_posterior(data)




cleanEx()
nameEx("plot_ss")
### * plot_ss

flush(stderr()); flush(stdout())

### Name: plot_ss
### Title: plot_ss
### Aliases: plot_ss

### ** Examples

## Not run: plot_ss



cleanEx()
nameEx("rep_sample_n")
### * rep_sample_n

flush(stderr()); flush(stdout())

### Name: rep_sample_n
### Title: Repeating Sampling from a Tibble
### Aliases: rep_sample_n

### ** Examples

data(nc)
rep_sample_n(nc, size=10, replace=FALSE, reps=1)



cleanEx()
nameEx("zinc")
### * zinc

flush(stderr()); flush(stdout())

### Name: zinc
### Title: Zinc Concentration in Water
### Aliases: zinc
### Keywords: datasets

### ** Examples

 data(zinc)
 str(zinc)
 plot(bottom ~ surface, data=zinc)
 # use paired t-test to test if difference in means is zero




### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
