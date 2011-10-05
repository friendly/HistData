\name{Cavendish}
\alias{Cavendish}
\docType{data}
\title{
Cavendish's Determinations of the Density of the Earth
}
\description{
Henry Cavendish carried out a series of experiments in 1798 to determine the
mean density of the earth, as an indirect means to calculate the
gravitational constant, G, in Newton's formula for the force (f) of
gravitational attraction,
\eqn{f = G m M / r^2}{f = G m M / r^2}
between two bodies of mass m and M.

Stigler (1977) used these data to illustrate properties of robust estimators
with real, historical data.
}
\usage{data(Cavendish)}
\format{
  A data frame with 29 observations on the following 3 variables.
  \describe{
    \item{\code{density}}{Cavendish's 29 determinations of the mean density of the earth}
    \item{\code{density2}}{same as \code{density}, with the third value (4.88) replaced by 5.88}
    \item{\code{density3}}{same as \code{density}, omitting the the first 6 observations}
  }
}
\details{
\code{density} contains Cavendish's measurements as analyzed, where he treated the
value 4.88 as if it were 5.88.   \code{density2} corrects this.
Cavendish also changed his experimental apparatus after the sixth determination,
using a stiffer wire in the torsion balance. \code{density3} replaces the first
6 values with \code{NA}.

The modern "true" value is taken as 5.517.

}
\source{
Kyle Siegrist, "Virtual Laboratories in Probability and Statistics", \url{http://www.math.uah.edu/stat/data/Cavendish.xhtml}

Stephen M. Stigler (1977), "Do robust estimators work with \emph{real} data?", \emph{Annals of Statistics},  5, 1055-1098
}
\references{
Cavendish, H. (1798). Experiments to determine the density of the earth.
\emph{Philosophical Transactions of the Royal Society of London}, 88 (Part II),
469-527.
Reprinted in A. S. Mackenzie (ed.), \emph{The Laws of Gravitation}, 1900, 
New York: American.
}
\examples{
data(Cavendish)
summary(Cavendish)
boxplot(Cavendish)
abline(h=5.517, col="red", lwd=2)
}
\keyword{datasets}
