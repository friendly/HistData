\name{Snow}
\Rdversion{1.1}
\alias{Snow}
\alias{Snow.deaths}
\alias{Snow.deaths2}
\alias{Snow.pumps}
\alias{Snow.streets}
\alias{Snow.polygons}
\alias{Snow.dates}
\docType{data}
\title{
John Snow's Map and Data on the 1854 London Cholera Outbreak
}
\description{
The \code{Snow} data consists of the relevant 1854 London streets, the location of 578 
deaths from cholera, and the position of 13 water pumps (wells)
that can be used to re-create John Snow's map showing deaths from
cholera in the area surrounding Broad Street, London in the 1854 outbreak.
Another data frame provides boundaries of a tesselation of the map into 
Thiessen (Voronoi) regions which include all cholera deaths nearer to
a given pump than to any other.

The apocryphal story of the significance of Snow's map is that, by closing  the
Broad Street pump (by removing its  handle), Dr. Snow  stopped the epidemic,  and
demonstrated that  cholera is  a water  borne disease.  The method of contagion of cholera
was  not previously
understood. Snow's map is the most famous and classical example in the field  of
medical cartography, even if  it didn't happen exactly  this way.
(the apocryphal part is that the epidemic ended when the pump handle was removed.)
At any  rate,
the map, together with  various statistical annotations,  is  compelling because
it points to the Broad Street pump as the source of the outbreak.

}
\usage{
	data(Snow.deaths)
	data(Snow.pumps)
	data(Snow.streets)
	data(Snow.polygons)
	data(Snow.dates)
}
\format{
  \code{Snow.deaths}: A  data frame  with 578  observations on  the following  3
  variables, giving the  address of a  person who died  from cholera. When  many
  points are associated with  a single street address,  they are "stacked" in  a
  line away from the street so that they are more easily visualized. This is how
  they are displayed on  John Snow's original map.  The dates of the  deaths are
  not individually recorded in this data set.
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

  \code{Snow.deaths2}: An alternative version of \code{Snow.deaths} correcting some possible
  duplicate and missing cases, as described in \code{vignette("Snow_deaths-duplicates")}.

  \code{Snow.dates}: A data frame of 44 observations and 3 variables from Table 1
  of Snow (1855), giving the number of fatal attacks and number of deaths by date from Aug. 19 -- Sept. 30, 1854.  There are a total of 616 deaths represented in both
  columns \code{attacks} and \code{deaths}; of these, the date of the attack is unknown 
  for 45 cases.
}
\details{
The scale of the source map is approx. 1:2000.  The \code{(x, y)} coordinate units are 100 meters,
with an arbitrary origin. 

Of the data in the \code{Snow.dates} table, Snow says,
\dQuote{The deaths in the above table are compiled from the sources mentioned above in describing the map; but some deaths which were omitted from the map on account of the number of the house not being known, are included in the table.} 

One limitation of these data sets is the lack of exact street addresses. Another
is the lack of any data that would serve as a population denominator to
allow for  a comparison  of mortality  rates in  the Broad  Street pump  area as
opposed to  others.  
See Koch (2000), Koch (2004),  Koch
\& Denike (2009) and Tufte (1999), p. 27-37,  for further discussion. 
}
\source{
Tobler, W. (1994). Snow's Cholera Map, 
\code{http://www.ncgia.ucsb.edu/pubs/snow/snow.html}; data files were obtained from
\code{http://ncgia.ucsb.edu/Publications/Software/cholera/}, but these sites
seem to be down.

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

Snow, J. (1885). \emph{On the Mode of Communication of Cholera}.
London: John Churchill.
\url{http://www.ph.ucla.edu/epi/snow/snowbook.html}.

Tufte, E. (1997). \emph{Visual Explanations}. Cheshire, CT: Graphics Press.
}

\seealso{
\code{\link{SnowMap}}
}
\examples{
data(Snow.deaths)
data(Snow.pumps)
data(Snow.streets)
data(Snow.polygons)
data(Snow.deaths)

## Plot deaths over time
require(lubridate)
clr <- ifelse(Snow.dates$date < mdy("09/08/1854"), "red", "darkgreen")
plot(deaths ~ date, data=Snow.dates, type="h", lwd=2, col=clr)
points(deaths ~ date, data=Snow.dates, cex=0.5, pch=16, col=clr)
text( mdy("09/08/1854"), 40, "Pump handle\nremoved Sept. 8", pos=4)


## draw Snow's map and data

SnowMap()

# add polygons
SnowMap(polygons=TRUE, main="Snow's Cholera Map with Pump Polygons")

# zoom in a bit, and show density estimate
SnowMap(xlim=c(7.5,16.5), ylim=c(7,16), polygons=TRUE, density=TRUE,
        main="Snow's Cholera Map, Annotated")


## re-do this the sp way... [thx: Stephane Dray]
%\dontrun{
library(sp)

# streets
slist <- split(Snow.streets[,c("x","y")],as.factor(Snow.streets[,"street"]))
Ll1 <- lapply(slist,Line)
Lsl1 <- Lines(Ll1,"Street")
Snow.streets.sp <- SpatialLines(list(Lsl1))
plot(Snow.streets.sp, col="gray")
title(main="Snow's Cholera Map of London (sp)")

# deaths
Snow.deaths.sp = SpatialPoints(Snow.deaths[,c("x","y")])
plot(Snow.deaths.sp, add=TRUE, col ='red', pch=15, cex=0.6)

# pumps
spp <- SpatialPoints(Snow.pumps[,c("x","y")])
Snow.pumps.sp <- SpatialPointsDataFrame(spp,Snow.pumps[,c("x","y")])
plot(Snow.pumps.sp, add=TRUE, col='blue', pch=17, cex=1.5)
text(Snow.pumps[,c("x","y")], labels=Snow.pumps$label, pos=1, cex=0.8)
%}
}
\keyword{datasets}
\keyword{spatial}

