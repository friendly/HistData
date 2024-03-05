\name{Baseball}
\alias{Baseball}
\docType{data}
\title{
18 major-league players batting statistics recorded in the 1970 season.
}
\description{
The \code{Baseball} data consists of batting averages (published weekly in the
New York Times) by April 26, 1970.

According to Efron and Morris (1975, p. 312):

"This sample was chosen because we wanted between 30 and 50 at bats to assure a
satisfactory approximation of the binomial by the normal distribution while
leaving the bulk of at bats to be estimated. We also wanted to include an
unusually good hitter (Clemente) to test the method with at least one extreme
parameter, a situation expected to be less favorable to Stein's estimator."

At page 313, Efron and Morris (1975) observe:

"The results are striking. The sample mean \eqn{X} has total squared prediction
error \eqn{E(X_i - \theta)^2} of 17.56, but [...] (the Stein's estimator) has
total squared prediction error of only 5.01. The efficiency of Stein's rule
relative to the MLE for these data is defined as [...] the ratio of squared
error losses. The efficiency of Stein's rule is 3.50 (=17.56/5.01) in this
example".

And, then, finally conclude (p. 318):

"In the baseball, toxoplasmosis, and computer simulation examples, Stein's
estimator and its generalizations increased efficiencies relative to the MLE by
about 350 percent, 200 percent, and 100 percent. These examples were chosen
because we expected empirical Bayes methods to work well for them and because
their efficiencies could be determined. But we are aware of other successful
applications to real data8 and have suppressed no negative results. Although
blind application of these methods would gain little in most instances, the
statistician who uses them sensibly and selectively can expect major improvements."

}

\usage{data(Baseball)}

\format{
  \code{Baseball}: A  data frame  with observations on  18 major-league
  players during the 1970 season who happened to have batted exactly 45 times
  the day the data were tabulated.
  \describe{
    \item{\code{FirstName}}{player's first name}
    \item{\code{LastName}}{player's last name}
    \item{\code{At.Bats}}{number of times each player had batted when data was
    first collected}
    \item{\code{Hits}}{number of hits in the first 45 bats}
    \item{\code{BattingAverage}}{simple, arithmetic average, i.e. the number of
    hits divided by the number of times at bat}
    \item{RemaingingAt.Bats}{number of bats in the remaining season for each
    player}
    \item{\code{RemainingAverage}}{simple average for the remaining successful
    bats}
    \item{\code{SeasonAt.Bats}}{total number of bats in the whole season}
    \item{\code{SeasonHits}}{total number of hits in the whole season}
    \item{\code{SeasonAverage}}{arithmetic average in the whole season}
  }

}
\details{
This data was used by Efron and Morris in a Scientic American paper to describe
the Stein Paradox to the broader scientific community.
}
\source{
Data files were obtained from \code{http://www.swarthmore.edu/NatSci/peverso1/Sports\%20Data/JamesSteinData/Efron-Morris\%20Baseball/EfronMorrisBB.txt}.
}
\references{
Efron, B. and Morris, C. (1977).
Stein's Paradox in Statistics.
\emph{Scientific American}, 236 (5), 119-127.
\url{http://www.jstor.org/stable/24954030}.

Efron, B. and Morris, C. (1975). Data Analysis Using Stein's Estimator and its
Generalizations. \emph{Journal of the American Statistical Association}, 70(350),
311-319.
\url{https://www.jstor.org/stable/2285814}

Stigler, S. M. (1990).
The 1988 Neyman Memorial Lecture: A Galtonian Perspective on Shrinkage
Estimators. \emph{Statistical Science}, 5(1) 147-155.
\url{http://projecteuclid.org/euclid.ss/1177012274}

}

\examples{
library(dplyr)
library(tidyr)
library(ggplot2)

data(Baseball)

# Calculation of shrink factor to be applied to the simple averages

# Simplified version
grandAverage <- mean(Baseball$BattingAverage)
s2 <- grandAverage*(1 - grandAverage)/45
shrinkFactor <- 1 - 15*s2/(17*var(Baseball$BattingAverage))

# Dotplot adapted from Efron and Morris (1977), p. 121

Baseball <- mutate(Baseball,
  ShrunkAverage = mean(BattingAverage) +
                    shrinkFactor*(BattingAverage - mean(BattingAverage)),
  paired = as.numeric(LastName))

BaseballMelt <- pivot_longer(Baseball[, c("LastName", "BattingAverage",
                                  "ShrunkAverage", "SeasonAverage", "paired")],
                             cols = c(BattingAverage, ShrunkAverage),
                             names_to = "variable", values_to = "value")

ggplot(BaseballMelt, aes(x = value, y = factor(variable), color = LastName))+
  geom_point() +
  geom_line(aes(group=paired)) +
  geom_vline(xintercept = grandAverage, lty = 2) +
  scale_y_discrete(labels = c("Maximum \n Likelihood", "James-Stein"),
                   expand = c(0,0)) +
  labs(y = "Estimate") +
  theme(legend.position="bottom")

# Regression to the mean (adapted from Stigler (1990, p. 148))

ggplot(BaseballMelt, aes(x = value, y = SeasonAverage, color = variable)) +
  geom_point() +
  stat_smooth(method = "lm", se = FALSE) +
  geom_abline(slope = 1, intercept = 0, lty = 3) +
  coord_fixed(xlim = c(.15, .40), ylim = c(.15, .40)) +
  theme(legend.position = "bottom") +
  geom_hline(yintercept = mean(Baseball$SeasonAverage), lty = 2) +
  geom_vline(xintercept = mean(Baseball$BattingAverage), lty = 2)

# Version from Efron and Morris (1975)
# Thanks to Wolfgang (https://stats.stackexchange.com/a/5738)

yi  <- Baseball$BattingAverage
k   <- length(yi)
yi  <- sqrt(45) * asin(2*yi-1)
shrinkFactor <- 1 - (k-3)*1 / sum((yi - mean(yi))^2)
shrinkFactor
zi  <- mean(yi) + shrinkFactor * (yi - mean(yi))
Baseball$ShrunkAverage <- round((sin(zi/sqrt(45)) + 1)/2,3) ### back-transformation

# Table Adapted from Efron and Morris (1975, 313)

table <- select(Baseball, RemainingAverage, BattingAverage, ShrunkAverage)

knitr::kable(table,
  col.names= c("Batting Average for season remainder",
               "Maximum likelihood estimate",
               "Retransform of Stein's estimator"))



}
\keyword{datasets}
\keyword{shrinkage}

