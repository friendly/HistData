\name{Snow}
\Rdversion{1.1}
\alias{Snow}
\alias{Snow.deaths}
\alias{Snow.pumps}
\alias{Snow.streets}
\alias{Snow.polygons}
\docType{data}
\title{
John Snow's map and data on the 1854 London Cholera outbreak
}
\description{
The \code{Snow} data consists of the relevant 1854 London streets, the location of 578 
deaths from cholera, and the position of 13 water pumps (wells)
that can be used to re-create John Snow's map showing deaths from
cholera in the area surrounding Broad Street, London in the 1854 outbreak.
Another data frame provides boundaries of a tesselation of the map into 
Thiessen (Voronoi) regions which include all cholera deaths nearer to
a given pump than to any other.

The apochrophal story of the significance of Snow's map is that, by closing  the
Broad Street pump (by removing its  handle), Dr. Snow  stopped the epidemic,  and
demonstrated that  cholera is  a water  borne disease.  The method of contagion of cholera
was  not previously
understood. Snow's map is the most famous and classical example in the field  of
medical cartography, even if  it didn't happen exactly  this way.  At any  rate,
the map, together with  various statistical annotations,  is  compelling because
it points to the Broad Street pump as the source of the outbreak.

}
\usage{
	data(Snow.deaths)
	data(Snow.pumps)
	data(Snow.streets)
	data(Snow.polygons)
}
\format{
  \code{Snow.deaths}: A  data frame  with 578  observations on  the following  3
  variables, giving the  address of a  person who died  from cholera. When  many
  points are associated with  a single street address,  they are "stacked" in  a
  line away from the street so that they are more easily visualized. This is how
  they are displayed on  John Snow's original map.  The dates of the  deaths are
  not recorded.
  \describe{
    \item{\code{case}}{Sequential case number, in some arbitrary, randomized order}
    \item{\code{x}}{x coordinate}
    \item{\code{y}}{y coordinate}
  }

  \code{Snow.pumps}: A data frame with 13 observations on the following 4 variables,
  giving the locations of water pumps within the boundaries of the map.
  \describe{
    \item{\code{pump}}{pump number}
    \item{\code{label}}{pump label:  \code{Briddle St} \code{Broad St} ... \code{Warwick}}
    \item{\code{x}}{x coordinate}
    \item{\code{y}}{y coordinate}
  }

  \code{Snow.streets}: A data frame with 1241 observations on the following 4 variables,
  giving coordinates used to draw the 528 street segment lines within the boundaries of the map.
  The map is created by drawing lines connecting the \code{n} points in each street segment.
  \describe{
    \item{\code{street}}{street segment number: \code{1:528}}
    \item{\code{n}}{number of points in this street line segment}
    \item{\code{x}}{x coordinate}
    \item{\code{y}}{y coordinate}
  }

  \code{Snow.polygons}: A  data frame  with 54  observations on  the following 3
  variables,  giving Thiessen  (Voronoi) polygons  containing each  pump. Their
  boundaries define the area that is closest to each pump relative to all  other
  pumps. They are mathematically defined  by the perpendicular bisectors of  the
  lines  between all  pumps. The  outlines of  these polygons  can be  drawn by
  connecting all points sequentially starting at each value of \code{start==0}.
  Here, each line segment consists of two sequential points.
  \describe{
    \item{\code{start}}{line start indicator. The value \code{start==0} indicates the
    	start of a new line, including all following points having \code{start==1}}
    \item{\code{x}}{x coordinate}
    \item{\code{y}}{y coordinate}
  }

}
\details{
The scale of the source map is approx. 1:2000.  The \code{(x, y)} coordinate units are 100 meters,
with an arbitrary origin. 

One limitation of these data sets is the lack of exact street addresses. Another
is the lack of any data that would serve as a population denominator to
allow for  a comparison  of mortality  rates in  the Broad  Street pump  area as
opposed to  others.  A  third is  the lack  of dates  of death  that could allow
analysis of the time course of the outbreak. See Koch (2000), Koch (2004),  Koch
\& Denike (2009) and Tufte (1999), p. 27-37,  for further discussion. 
}
\source{
Tobler, W. (1994). Snow's Cholera Map
\url{http://www.ncgia.ucsb.edu/pubs/snow/snow.html}; data files were obtained from
\url{http://ncgia.ucsb.edu/Publications/Software/cholera/}

The data in  these files were first digitized in 1992  by Rusty Dodson  of the NCGIA,
Santa  Barbara,  from the  map  included in  the  book by  John  Snow: "Snow  on
Cholera...", London, Oxford University Press, 1936.  
}
\references{
Koch, T. (2000). \emph{Cartographies of Disease: Maps, Mapping, and Medicine}.
ESRI Press. 
ISBN: 9781589481206.

Koch, T. (2004).
The Map as Intent: Variations on the Theme of John Snow
\emph{Cartographica}, 39 (4), 1-14.

Koch, T. and Denike, K. (2009).
Crediting his critics' concerns: Remaking John Snow's map of Broad Street
cholera, 1854.
\emph{Social Science \& Medicine} 69, 1246-1251.

Tufte, E. (1997). \emph{Visual Explanations}. Cheshire, CT: Graphics Press.
}
\examples{
data(Snow.deaths); data(Snow.pumps); data(Snow.streets); data(Snow.polygons)

## draw a rough approximation to Snow's map and data

# define some funtions to make the pieces re-usable
Sdeaths <- function() {
		# make sure that the plot limits include all the other stuff
   plot(Snow.deaths[,2:3], col="red", pch=15, cex=0.6, 
   	xlab="", ylab="", xlim=c(3,20), ylim=c(3,20),
   	main="Snow's Cholera Map of London")
	}
Spumps <- function()  {
# function to plot and label the pump locations
   points(Snow.pumps[,3:4], col="blue", pch=17, cex=1.5)
   text(Snow.pumps[,3:4], labels=Snow.pumps$label, pos=1, cex=0.8)
}

Sstreets <- function() {
# function to draw the streets
   for(i in 1:max(Snow.streets$street)) {
   		this <- Snow.streets$street == i
   		lines(Snow.streets[this,3:4], col="gray")
   	}
}

# draw a scale showing distance in meters in upper left
mapscale <- function(xs=3.5, ys=19.7) {
   scale <- matrix(c(0,0, 4,0, NA, NA), nrow=3, ncol=2, byrow=TRUE)
   colnames(scale)<- c("x","y")
	# tick marks
   scale <- rbind(scale, expand.grid(y=c(-.1, .1, NA), x=0:4)[,2:1])
   lines(xs+scale[,1], ys+scale[,2])
	# value and axis labels
   stext <- matrix(c(0,0, 2,0, 4,0, 4, 0.1), nrow=4, ncol=2, byrow=TRUE)
   text(xs+stext[,1], ys+stext[,2], labels=c("0", "2", "4", "100 m."), pos=c(1,1,1,4), cex=0.8)
}

# draw the map with the pieces
Sdeaths()
Spumps()
Sstreets()
mapscale()


# draw the Thiessen polygon boundaries
starts <- which(Snow.polygons$start==0)
for(i in 1:length(starts)) {
	this <- starts[i]:(starts[i]+1)
	lines(Snow.polygons[this,2:3], col="blue", lwd=2, lty=2)
	}


## overlay bivariate kernel density contours of deaths
Sdeaths()
Spumps()
Sstreets()
mapscale()
require(KernSmooth)
kde2d <- bkde2D(Snow.deaths[,2:3], bandwidth=c(0.5,0.5))
contour(x=kde2d$x1, y=kde2d$x2,z=kde2d$fhat, add=TRUE)
}
\keyword{
datasets
spatial
}
