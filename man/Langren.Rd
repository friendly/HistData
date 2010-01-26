\encoding{latin1}
\name{Langren}
\Rdversion{1.1}
\alias{Langren}
\alias{Langren1644}
\alias{Langren.all}
\docType{data}
\title{
van Langren's data on longitude distance between Toledo and Rome
}
\description{
Michael Florent van Langren (1598-1675) was a Dutch mathematician and astronomer, who served
as a royal mathematician to King Phillip IV of Spain, and who worked on one of the most significant
problems of his time--- the accurate determination of longitude, particularly for navigation at sea.

In order to convince the Spanish court of the seriousness of the problem (often resulting in
great losses through ship wrecks), he prepared a 1-dimensional line graph, showing all the 
available estimates of the distance in longitude between Toledo and Rome, which showed
large errors, for even this modest distance.  This 1D line graph, from Langren (1644), is believed
to be the first known graph of statistical data (Friendly etal., 2009).
It provides a compelling example of the notions of statistical variability and bias.

The data frame \code{Langren1644} gives the estimates and other information derived from the
previously known 1644 graph.  
It turns out that van Langren produced other versions of this graph, as early as 1628.
The data frame \code{Langren.all} gives the estimates derived
from all known versions of this graph.
}
\usage{
	data(Langren1644)
	data(Langren.all)
	}
\format{
  \code{Langren1644}: A data frame with 12 observations on the following 5 variables,
  giving determinations of the distance in longitude between Toledo and Rome, from the 1644 graph.
  \describe{
    \item{\code{Name}}{The name of the person giving a determination, a factor with levels \code{A. Argelius} ... \code{T. Brahe}}
    \item{\code{Longitude}}{Estimated value of the longitude distance between Toledo and Rome}
    \item{\code{Year}}{Year associated with this determination}
    \item{\code{Longname}}{A longer version of the \code{Name}, where appropriate; a factor with levels \code{Andrea Argoli} \code{Christoph Clavius}  \code{Tycho Brahe}}
    \item{\code{Where}}{a factor with levels \code{Alexandria} \code{Belgium} \code{Denmark} \code{Flanders} \code{France} \code{Germany} \code{Italy} \code{Italy }}
  }

  \code{Langren.all}: A data frame with 61 observations on the following 4 variables,
  giving determinations of Longitude between Toledo and Rome from all known versions of van Langren's graph.
  \describe{
    \item{\code{Author}}{Author of the graph, a factor with levels \code{Langren} \code{Lelewel}}
    \item{\code{Year}}{Year of publication}
    \item{\code{Name}}{The name of the  person giving a determination,  a factor
    with levels  \code{Algunos1} \code{Algunos2}  \code{Apianus} ... \code{Schonerus}}
    \item{\code{Longitude}}{Estimated value of the longitude distance between Toledo and Rome}
  }

}
\details{
In all the graphs, Toledo is implicitly at the origin and Rome is located relatively at the value of \code{Longitude}  
To judge correspondence with an actual map, the positions in (lat, long) are

\code{
	toledo <- c(39.86, -4.03);
	rome   <- c(41.89, 12.5)
}
}
\source{
The longitude values were digitized from images of the various graphs, which may be
found on the Supplementary materials page for Friendly etal. (2009).
}
\references{
Friendly, M., Valero-Mora, P. and Ulargui, J. I. (2009).
The First (Known) Statistical Graph: Michael Florent van Langren and the "Secret" of Longitude.
Unpublished ms (submitted). 
Supplementary materials: \url{http://www.math.yorku.ca/SCS/Gallery/langren/}. 

Langren, M. F. van. (1644).  \emph{La Verdadera Longitud por Mar y Tierra}. Antwerp: (n.p.), 1644.
English translation available at \url{http://www.math.yorku.ca/SCS/Gallery/langren/verdadera.pdf}.

Lelewel, J. (1851). \emph{Géographie du Moyen Âge}. Paris: Pilliet, 1851.

}
\keyword{
datasets
spatial
}
\examples{
data(Langren1644)

\dontrun{
require(maps)
require(ggplot2)
require(reshape)
require(plyr)

# set latitude to that of Toledo
Langren1644$Latitude <- 39.68

#          x/long   y/lat
bbox <- c( 38.186, -9.184,
           43.692, 28.674 )
bbox <- matrix(bbox, 2, 2, byrow=TRUE)

borders <- as.data.frame(map("world", plot = FALSE,
  xlim = expand_range(bbox[,2], 0.2),
  ylim = expand_range(bbox[,1], 0.2))[c("x", "y")])

data(world.cities)
# get actual locations of Toledo & Rome
cities <- subset(world.cities,
  name \%in\% c("Rome", "Toledo") & country.etc \%in\% c("Spain", "Italy"))
colnames(cities)[4:5]<-c("Latitude", "Longitude")

mplot <- ggplot(Langren1644, aes(Longitude, Latitude) ) +
  geom_path(aes(x, y), borders, colour = "grey60") +
  geom_point(y = 40) +
  geom_text(aes(label = Name), y = 40.1, angle = 90, hjust = 0, size = 3)
mplot <- mplot +
	geom_segment(aes(x=-4.03, y=40, xend=30, yend=40))

mplot <- mplot +
  geom_point(data = cities, colour = "red", size = 2) +
  geom_text(data=cities, aes(label=name), color="red", size=3, vjust=-0.5) +
  coord_cartesian(xlim=bbox[,2], ylim=bbox[,1])

# make the plot have approximately aspect ratio = 1
windows(width=10, height=2)
mplot
}

if (require(ReadImages)) {
  gimage <- read.jpeg(system.file("images", "google-toledo-rome3.jpg", package="HistData"))
  plot(gimage)
  
  # pixel coordinates of Toledo and Rome in the image, measured from the bottom left corner
  toledo.map <- c(130, 59)
  rome.map <- c(505, 119)
  
  # confirm locations of Toledo and Rome
  points(rbind(toledo.map, rome.map), cex=2)
  
  # set a scale for translation of lat,long to pixel x,y
  scale <- data.frame(x=c(130, 856), y=c(52,52))
  rownames(scale)=c(0,30)
  lines(scale)
  
  xlate <- function(x) {
    130+x*726/30	
  }
  points(x=xlate(Langren1644$Longitude), y=rep(57, nrow(Langren1644)), pch=25, col="blue")
  text(x=xlate(Langren1644$Longitude), y=rep(57, nrow(Langren1644)), labels=Langren1644$Name, srt=90, adj=c(0, 0.5), cex=0.8)
}

# show variation in estimates across graphs
library(lattice)
graph <- paste(Langren.all$Author, Langren.all$Year)
dotplot(Name ~ Longitude, data=Langren.all)

dotplot( as.factor(Year) ~ Longitude, data=Langren.all, groups=Name, type="o")

dotplot(Name ~ Longitude|graph, data=Langren.all, groups=graph)



}
