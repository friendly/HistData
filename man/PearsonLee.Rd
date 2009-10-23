\name{PearsonLee}
\Rdversion{1.1}
\alias{PearsonLee}
\docType{data}
\title{
Pearson and Lee's 1896 data on the heights of parents and children classified by gender
}
\description{
Wachsmuth et. al (2003) noticed that a loess smooth through Galton's data
on heights of mid-parents and their offspring exhibited a slightly non-linear
trend, and asked whether this might be due to Galton having pooled the heights of
fathers and mothers and sons and daughters in constructing his tables and graphs.

To answer this question, they used analogous data from English families at about the
same time, tabulated by Karl Pearson and Alice Lee (1896), but where the heights
of parents and children were each classified by gender of the parent.
}
\usage{data(PearsonLee)}
\format{
  A frequency data frame with 746 observations on the following 6 variables.
  \describe{
    \item{\code{child}}{child height in inches, a numeric vector}
    \item{\code{parent}}{parent height in inches, a numeric vector}
    \item{\code{frequency}}{a numeric vector}
    \item{\code{gp}}{a factor with levels \code{fd} \code{fs} \code{md} \code{ms}}
    \item{\code{par}}{a factor with levels \code{Father} \code{Mother}}
    \item{\code{chl}}{a factor with levels \code{Daughter} \code{Son}}
  }
}
\details{
The variables \code{gp}, \code{par} and \code{chl} are provided to allow stratifying
the data according to the gender of the father/mother and son/daughter.
}
\source{
Pearson, K. and Lee, A. (1896). Mathematical contributions to the theory
of evolution. On telegony in man, etc. \emph{Proceedings of the Royal Society of
London}, 60 , 273-283.
}
\references{
Wachsmuth, A.W., Wilkinson L., Dallal G.E. (2003). 
Galton's bend: A previously undiscovered nonlinearity in Galton's family stature regression data. 
\emph{The American Statistician}, 57, 190-192. 
\url{http://www.cs.uic.edu/~wilkinson/Publications/galton.pdf}
}
\seealso{
	\code{\link{Galton}}
	}


\examples{
data(PearsonLee)
## maybe str(PearsonLee) ; plot(PearsonLee) ...
}
\keyword{datasets}
