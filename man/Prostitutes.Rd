\name{Prostitutes}
\Rdversion{1.1}
\alias{Prostitutes}
\docType{data}
\title{
Parent-Duchatelet's time-series data on the number of prostitutes in Paris
}
\description{
A table indicating month by month, for the years 1812-1854, the number of prostitutes on the 
registers of the administration of the city of Paris.


}
\usage{data(Prostitutes)}
\format{
  A data frame with 516 observations on the following 5 variables.
  \describe{
    \item{\code{Year}}{a numeric vector}
    \item{\code{month}}{a factor with levels \code{Apr} \code{Aug} \code{Dec} \code{Feb} \code{Jan} \code{Jul} \code{Jun} \code{Mar} \code{May} \code{Nov} \code{Oct} \code{Sep}}
    \item{\code{count}}{a numeric vector: number of prostitutes}
    \item{\code{mon}}{a numeric vector: numeric month}
    \item{\code{date}}{a Date}
  }
}
\details{
The data table was digitally scanned with OCR, and errors were corrected by comparing the
yearly totals recorded in the table to the row sums of the scanned data.
}
\source{
Parent-Duchatelet, A. (1857), \emph{De la prostitution dans la ville de Paris}, 3rd ed,  p. 32, 36

}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\examples{
data(Prostitutes)
## maybe str(Prostitutes) ; plot(Prostitutes) ...
}
\keyword{datasets}
