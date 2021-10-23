\name{Breslau}
\alias{Breslau}
\docType{data}
\title{
Halley's Breslau Life Table
}
\description{
Edmond Halley published his Breslau life table in 1693, which was arguably the first
in the world based on population data. David Bellhouse (2011) resurected the original
sources of these data, collected by Caspar Neumann in the city of Breslau (now called Wrocław),
and then reconstructed in the 1880s by Jonas Graetzer, the medical officer
in Breslau at that time.  

The dataset here follows Graetzer, and gives the number of deaths
at ages \code{1:100} recorded in each of the years \code{1687:1691}. Halley's analysis was based on the total
over those years.
}
\usage{data("Breslau")}
\format{
  A data frame with 100 observations on the following 8 variables. The yearXXXX variables give the number of deaths for persons of a given \code{age} recorded in that year.
  \describe{
    \item{\code{age}}{a numeric vector}
    \item{\code{year1687}}{a numeric vector}
    \item{\code{year1688}}{a numeric vector}
    \item{\code{year1689}}{a numeric vector}
    \item{\code{year1690}}{a numeric vector}
    \item{\code{year1691}}{a numeric vector}
    \item{\code{total}}{a numeric vector}
    \item{\code{average}}{a numeric vector}
  }
}
\details{
This dataset was kindly provided by David Bellhouse.
}
\source{
Bellhouse, D.R. (2011), A new look at Halley's life table. 
\emph{Journal of the Royal Statistical Society}: Series A, \bold{174}, 823-832. 
\doi{10.1111/j.1467-985X.2010.00684.x}

\references{
Halley, E. (1693). An estimate of the degrees of mortality of mankind, drawn from the curious tables of births and
funerals in the City of Breslaw; with an attempt to ascertain the price of annuities upon lives. 
\emph{Phil. Trans.}, \bold{17}, 596–610.
}
\examples{
data(Breslau)
## maybe str(Breslau) ; plot(Breslau) ...
}
\keyword{datasets}
