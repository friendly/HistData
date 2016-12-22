\name{SnowMap}
\alias{SnowMap}
\alias{Splot}
\alias{Sdeaths}
\alias{Spumps}
\alias{Sstreets}
\alias{Sscale}
\alias{Spolygons}
\alias{Sdensity}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Draw John Snow's Map of Cholera in London
}
\description{
The main function \code{SnowMap} draws versions of John Snow's map of cholera deaths in 
the South London area surrounding the Borad Street pump.
during the 1854 outbreak.

It is a wrapper for the various subfunctions also listed here:
\code{Splot} sets up the basic plot\cr
\code{Sstreets} draws the streets\cr
\code{Sdeaths} plots the deaths\cr
\code{Sdeaths} plots the pump locations\cr
\code{Sscale} draws the scale\cr
\code{Spolygons} draws the boundaries of the Voronoi polygons separating the pumps\cr
\code{Sdensity} draws and fills contours of the 2D density of deaths

}
\usage{

SnowMap(xlim = c(3, 20), ylim = c(3, 20), 
        axis.labels = FALSE, main = "Snow's Cholera Map of London", 
        scale = TRUE, polygons = FALSE, density=FALSE,
        streets.args = list(col = "grey", lwd = 1), 
        deaths.args = list(col = "red", pch = 15, cex = 0.6), 
        pumps.args = list(col = "blue", pch = 17, cex = 1.5, cex.lab = 0.9), 
        scale.args = list(xs = 3.5, ys = 19.7), 
        polygons.args = list(col = "brown", lwd = 2, lty = 1),
  			density.args=list(bandwidth=c(0.5,0.5), 
                  col1=rgb(0,1,0,0),
                  col2=rgb(1,0,0,.8))
)

Splot(xlim = c(3, 20), ylim = c(3, 20), 
      xlab = "", ylab = "", 
      axis.labels = FALSE, 
      main = "Snow's Cholera Map of London")

Sdeaths(col = "red", pch = 15, cex = 0.6)

Spumps(col = "blue", pch = 17, cex = 1.5, cex.lab = 0.9)

Sstreets(col = "gray", lwd = 1)

Sscale(xs = 3.5, ys = 19.7)

Spolygons(col = "brown", lwd = 2, lty = 1)

Sdensity(bandwidth = c(0.5, 0.5), col1 = rgb(0, 1, 0, 0), col2 = rgb(1, 0, 0, 0.8))
}
%- maybe also 'usage' for other objects documented here.
\arguments{

  \item{xlim}{
Limit for the horizontal axis.  Specify ranges smaller than the defaults
to zoom the plot.
}
  \item{ylim}{
Limit for the vertical axis.
}
  \item{axis.labels}{
Logical. Show axis tick mark labels?
}
  \item{main}{
Plot title
}
  \item{scale}{
Logical; draw a scale (in meters) on the plot
}
  \item{polygons}{
Logical; Use \code{Spolygons} to draw the \code{Snow.polygons} on the plot?
}
  \item{density}{
Logical; Use \code{Sdensity} to draw the 2D bivariate density of deaths on the plot?
}
  \item{streets.args}{
List of arguments passed to \code{Sstreets}
}
  \item{deaths.args}{
List of arguments passed to \code{Sdeaths}

}
  \item{pumps.args}{
List of arguments passed to \code{Spumps}

}
  \item{scale.args}{
List of arguments passed to \code{Sscale}
}
  \item{polygons.args}{
List of arguments passed to \code{Spolygons}
}

  \item{density.args}{
List of arguments passed to \code{Sdensity}
}

  \item{xlab}{
Label for horizontal axis
}
  \item{ylab}{
Label for vertical axis
}

  \item{col}{
Color of points and lines used by various functions
}
  \item{pch}{
Point character used by by various functions
}
  \item{cex}{
Character size used by by various functions
}

  \item{cex.lab}{
Character size for labels used by \code{Spumps}
}

  \item{lwd}{
Line width used by by various functions
}

  \item{xs}{
x location of the scale used by \code{Sscale}
}
  \item{ys}{
y location of the scale used by \code{Sscale}
}

  \item{lty}{
Line type used by by various functions
}

  \item{bandwidth}{
Bandwidth used by \code{\link[KernSmooth]{bkde2D}} in \code{Sdensity}
}
  \item{col1}{
Lower level of color range used by \code{\link[grDevices]{colorRampPalette}} in \code{Sdensity}
}
  \item{col2}{
Upper level of color range used by \code{\link[grDevices]{colorRampPalette}} in \code{Sdensity}
}
}
%\details{
%%%  ~~ If necessary, more details than the description above ~~
%}
\value{
None
}
\references{
Snow, J. (1885). \emph{On the Mode of Communication of Cholera}. London: John Churchill
}
\author{
Michael Friendly
}
%\note{
%%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{Snow}} for description of the data sets

\code{\link[KernSmooth]{bkde2D}},
\code{\link[grDevices]{colorRampPalette}}
}
\examples{
SnowMap()
SnowMap(axis.labels=TRUE)
SnowMap(deaths.args=list(col="darkgreen"))

SnowMap(polygons=TRUE, main="Snow's Cholera Map with Pump Polygons")

SnowMap(density=TRUE)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{hplot}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
