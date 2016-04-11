\name{Arbuthnot}
\Rdversion{1.1}
\alias{Arbuthnot}
\docType{data}
\title{
Arbuthnot's data on male and female birth ratios in London from 1629-1710.
}
\description{
John Arbuthnot (1710) used these time series data on the ratios of
male to female births in London from 1629-1710 to carry out the first known
significance test, comparing observed data to a null hypothesis.
The data for these 81 years showed that in every year there were
more male than female christenings.

On the assumption that male and female births were equally likely,
he showed that the probability of observing 82 years with more
males than females was vanishingly small (\eqn{~ 4.14 x 10^{-25}}).
He used this to argue that a nearly constant birth ratio > 1
could be interpreted to show the guiding hand of a devine being.
The data set adds variables of deaths from the plague and total
mortality obtained by Campbell and from Creighton (1965).

}
\usage{data(Arbuthnot)}
\format{
  A data frame with 82 observations on the following 7 variables.
  \describe{
    \item{\code{Year}}{a numeric vector, 1629-1710}
    \item{\code{Males}}{a numeric vector, number of male christenings}
    \item{\code{Females}}{a numeric vector, number of female christenings}
    \item{\code{Plague}}{a numeric vector, number of deaths from plague}
    \item{\code{Mortality}}{a numeric vector, total mortality}
    \item{\code{Ratio}}{a numeric vector, ratio of Males/Females}
    \item{\code{Total}}{a numeric vector, total christenings in London (000s)}
  }
}
\details{
Sandy Zabell (1976) pointed out several errors and inconsistencies in the
Arbuthnot data.  In particular, the values for 1674 and 1704 are identical,
suggesting that the latter were copied erroneously from the former.
}
\source{
Arbuthnot, John (1710). "An argument for Devine Providence, taken from the constant Regularity
    observ'd in the Births of both Sexes," \emph{Philosophical transactions}, 27, 186-190.
	Published in 1711.
}
\references{
Campbell, R. B., Arbuthnot and the Human Sex Ratio (2001).
\emph{Human Biology}, 73:4, 605-610.
%\url{http://www.math.uni.edu/~campbell/arbuth.html}

Creighton, C. (1965). A History of Epidemics in Britain, 2nd edition, vol. 1 and 2. 
    NY: Barnes and Noble.

S. Zabell (1976). Arbuthnot, Heberden, and the \emph{Bills of Mortality}.
Technical Report No. 40, Department of Statistics, University of Chicago.
}
\examples{
data(Arbuthnot)
# plot the sex ratios
with(Arbuthnot, plot(Year,Ratio, type='b', ylim=c(1, 1.20), ylab="Sex Ratio (M/F)"))
abline(h=1, col="red")
#  add loess smooth
Arb.smooth <- with(Arbuthnot, loess.smooth(Year,Ratio))
lines(Arb.smooth$x, Arb.smooth$y, col="blue", lwd=2)

# plot the total christenings to observe the anomalie in 1704
with(Arbuthnot, plot(Year,Total, type='b', ylab="Total Christenings"))
}
\keyword{datasets}
