\name{Wheat}
\Rdversion{1.1}
\alias{Wheat}
\docType{data}
\title{
Playfair's data on wages and the price of wheat
}
\description{
Playfair (1821) used a graph, showing parallel time-series of the price of wheat
and the typical weekly wage for a "good mechanic" from 1570 to 1820 to argue
that working men had never been as well-off in terms of purchasing power as
they had become toward the end of this period.

His graph is a classic in the history of data visualization, but commits the
sin of showing two non-commensurable Y variables on different axes.
Scatterplots of wages vs. price or plots of ratios (e.g., wages/price) 
are in some ways better, but both of these ideas were unknown in 1821.
}
\usage{data(Wheat)}
\format{
  A data frame with 26 observations on the following 4 variables.
  \describe{
    \item{\code{Year}}{Year, in intervals of 10 from 1570 to 1820: a numeric vector}
    \item{\code{Wheat}}{Price of Wheat (Shillings/Quarter bushel): a numeric vector}
    \item{\code{Wages}}{Weekly wage (Shillings): a numeric vector}
    \item{\code{Monarch}}{Reigning monarch: a factor with levels \code{Anne} \code{Charles} \code{Cromwell} \code{Elizabet} \code{George I} \code{James I} \code{James II} \code{William}}
  }
}
%\details{
%%  ~~ If necessary, more details than the __description__ above ~~
%}
\source{
Playfair, W. (1821). \emph{Letter on our Agricultural Distresses, Their Causes and Remedies}. London: W. Sams, 1821

Data values:
digitized from \url{http://www.math.yorku.ca/SCS/Gallery/images/playfair-wheat1.gif}
}
\references{
Friendly, M. & Denis, D. (2005). The early origins and development of the scatterplot 
\emph{Journal of the History of the Behavioral Sciences}, 
41, 103-130.
}
\examples{
data(Wheat)

# trivial time series plot
Play.ts <- ts(Wheat[,2:3], start=1570, end=1820, deltat=10)
plot(Play.ts, plot.type="single", col=1:2)
}
\keyword{datasets}
