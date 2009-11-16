\name{Fingerprints}
\Rdversion{1.1}
\alias{Fingerprints}
\docType{data}
\title{
Waite's data on Patterns in Fingerprints
}
\description{
Waite (1915) was interested in analyzing the association of patterns in fingerprints,
and produced a table of counts for 2000 right hands, classified by the number of fingers
describable as a "whorl", a "small loop" (or neither).
Because each hand contributes five fingers, the number of \code{Whorls + Loops} cannot exceed 5,
so the contingency table is necessarily triangular.

Karl Pearson (1904) introduced the test for independence in contingency tables, and by 1913
had developed methods for "restricted contingency tables," such as the triangular table
analyzed by Waite.  The general formulation of such tests for association in restricted
tables is now referred to as models for quasi-independence.
}
\usage{data(Fingerprints)}
\format{
  A frequency data frame with 36 observations on the following 3 variables, 
  representing a 6 x 6 table giving
  the cross-classification of the fingers on 2000 right hands as a whorl, small loop
  or neither.
  \describe{
    \item{\code{Whorls}}{Number of whorls, an ordered factor with levels \code{0} < \code{1} < \code{2} < \code{3} < \code{4} < \code{5}}
    \item{\code{Loops}}{Number of small loops, an ordered factor with levels \code{0} < \code{1} < \code{2} < \code{3} < \code{4} < \code{5}}
    \item{\code{count}}{Number of hands}
  }
}
\details{
Cells for which \code{Whorls + Loops>5} have \code{NA} for \code{count}
}
\source{
Stigler, S. M. (1999).
\emph{Statistics on the Table}.
Cambridge, MA: Harvard University Press, table 19.4.
}
\references{
Pearson, K. (1904).
Mathematical contributions to the theory of evolution. XIII.
On the theory of contingency and its relation to association and normal correlation.
Reprinted in \emph{Karl Pearson's Early Statistical Papers}, Cambridge:
Cambridge University Press, 1948, 443-475.

Waite, H. (1915).
The analysis of fingerprints, \emph{Biometrika}, 10, 421-478.
}
\examples{
data(Fingerprints)
xtabs(count ~ Whorls + Loops, data=Fingerprints)
}
\keyword{datasets}
