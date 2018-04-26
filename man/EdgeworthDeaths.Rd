\name{EdgeworthDeaths}
\alias{EdgeworthDeaths}
\docType{data}
\title{
Edgeworth's Data on Death Rates in British Counties
}
\description{
In 1885, Francis Edgeworth published a paper, \emph{On methods of ascertaining variations in the rate of births, deaths and marriages}.
It contained among the first examples of two-way tables, analyzed to show variation among row and column factors,
in a way that Fisher would later formulate as the Analysis of Variance. 

Although the data are rates per 1000, they provide a good example of a two-way ANOVA with n=1 per cell,
where an additive model fits reasonably well. 

Treated as frequencies, the data is also a good example of a case where the independence model fits
reasonably well.
}
\usage{data("EdgeworthDeaths")}
\format{
  A data frame with 42 observations on the following 3 variables.
  \describe{
    \item{\code{County}}{a factor with levels \code{Berks} \code{Herts} \code{Bucks} \code{Oxford} \code{Bedford} \code{Cambridge}}
    \item{\code{year}}{an ordered factor with levels \code{1876} < \code{1877} < \code{1878} < \code{1879} < \code{1880} < \code{1881} < \code{1882}}
    \item{\code{Freq}}{a numeric vector, death rate per 1000 population}
  }
}
\details{
Edgeworth's data came from the Registrar General's report for the final year, 1883.
The \code{Freq} variable represents death rates per 1000 population in the six counties listed.
}
\source{
The data were scanned from Table 5.2 in 
Stigler, S. M. (1999) \emph{Statistics on the Table: The History of Statistical Concepts and Methods},
Harvard University Press.

}
\references{
Edgeworth, F. Y. (1885). On Methods of Ascertaining Variations in the Rate of Births, Deaths, and Marriages. 
\emph{Journal of the Statistical Society of London}, 48(4), 628-649. doi:10.2307/2979201
}
\examples{
data(EdgeworthDeaths)

# fit the additive ANOVA model
library(car)  # for Anova()
EDmod <- lm(Freq ~ County + year, data=EdgeworthDeaths)
Anova(EDmod)

# now, consider as a two-way table of frequencies

library(vcd)
library(MASS)
structable( ~ County + year, data=EdgeworthDeaths)
loglm( Freq ~ County + year, data=EdgeworthDeaths)

mosaic( ~ County + year, data=EdgeworthDeaths, 
	shade=TRUE, legend=FALSE, labeling=labeling_values, 
	gp=shading_Friendly)


}
\keyword{datasets}
