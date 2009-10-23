\name{Minard}
\Rdversion{1.1}
\alias{Minard}
\alias{Minard.cities}
\alias{Minard.troops}
\alias{Minard.temp}
\docType{data}
\title{
Data from Minard's famous graphic map of Napoleon's march on Moscow
}
\description{
Charles Joseph Minard's graphic depiction of the fate of Napoleon's Grand
Army in the Russian campaign of 1815 has been called the "greatest statistical graphic
ever drawn" (Tufte, 1983).   Friendly (2002) describes some background
for this graphic, and presented it as Minard's Chalenge: to reproduce it using
modern statistical or graphic software, in a way that showed the elegance of
some computer language to both describe and produce this graphic.
}
\usage{
data(Minard.troops)
data(Minard.cities)
data(Minard.temp)
}
\format{
  \code{Minard.troops}: A data frame with 51 observations on the following 5 variables giving the number
  of surviving troops.
  \describe{
    \item{\code{long}}{Longitude}
    \item{\code{lat}}{Latitude}
    \item{\code{survivors}}{Number of surviving troops, a numeric vector}
    \item{\code{direction}}{a factor with levels \code{A} ("Advance") \code{R} ("Retreat")}
    \item{\code{group}}{a numeric vector}
  }

  \code{Minard.cities}: A data frame with 20 observations on the following 3 variables giving the locations of
  various places along the path of Napoleon's army.
  \describe{
    \item{\code{long}}{Longitude}
    \item{\code{lat}}{Latitude}
    \item{\code{city}}{City name: a factor with levels \code{Bobr} \code{Chjat}  ... \code{Witebsk} \code{Wixma}}
  }

  \code{Minard.temp}: A data frame with 9 observations on the following 4 variables, giving the temperature
  at various places along the march of retreat from Moscow.
  \describe{
    \item{\code{long}}{Longitude}
    \item{\code{temp}}{Temperature}
    \item{\code{days}}{Number of days on the retreat march}
    \item{\code{date}}{a factor with levels \code{Dec01} \code{Dec06} \code{Dec07} \code{Nov09} \code{Nov14} \code{Nov28} \code{Oct18} \code{Oct24}}
  }

}
%\usage{data(Minard.cities)}
%\format{
%  A data frame with 20 observations on the following 3 variables giving the locations of
%  various places along the path of Napoleon's army.
%  \describe{
%    \item{\code{long}}{Longitude}
%    \item{\code{lat}}{Latitude}
%    \item{\code{city}}{a factor with levels \code{Bobr} \code{Chjat} \code{Dorogobouge} \code{Gloubokoe} \code{Kowno} \code{Malo-Jarosewii} \code{Minsk} \code{Mohilow} \code{Moiodexno} \code{Mojaisk} \code{Moscou} \code{Orscha} \code{Polotzk} \code{Smolensk} \code{Smorgoni} \code{Studienska} \code{Tarantino} \code{Wilna} \code{Witebsk} \code{Wixma}}
%  }
%}

%\usage{data(Minard.temp)}
%\format{
%  A data frame with 9 observations on the following 4 variables, giving the temperature
%  at various places along the march of retreat from Moscow.
%  \describe{
%    \item{\code{long}}{Longitude}
%    \item{\code{temp}}{Temperature}
%    \item{\code{days}}{Number of days on the retreat march}
%    \item{\code{date}}{a factor with levels \code{Dec01} \code{Dec06} \code{Dec07} \code{Nov09} \code{Nov14} \code{Nov28} \code{Oct18} \code{Oct24}}
%  }
%}
\details{
\code{date} in \code{Minard.temp} should be made a real date in 1815.
}
\source{
\url{http://www.cs.uic.edu/~wilkinson/TheGrammarOfGraphics/minard.txt}
}
\references{
Friendly, M. (2002). 
Visions and Re-visions of Charles Joseph Minard,
 \emph{Journal of Educational and Behavioral Statistics}, 27, No. 1, 31-51.

Friendly, M. (2003). Re-Visions of Minard.
\url{http://www.math.yorku.ca/SCS/Gallery/re-minard.html}
}
\examples{
data(Minard.troops); data(Minard.cities)
## maybe str(Minard.troops) ; plot(Minard.troops) ...

if (require(ggplot2)) {
 plot_troops <- ggplot(Minard.troops, aes(long, lat)) +
   geom_path(aes(size = survivors, colour = direction, group = group))
   
 plot_both <- plot_troops + 
   geom_text(aes(label = city), size = 4, data = Minard.cities)
   
 plot_polished <- plot_both + 
   scale_size(to = c(1, 12), 
     breaks = c(1, 2, 3) * 10^5, labels = comma(c(1, 2, 3) * 10^5)) + 
   scale_colour_manual(values = c("grey50","red")) +
   xlab(NULL) + 
   ylab(NULL)
 
 # need to re-scale the plot window to an aspect ratio of ~ 4 x 1
 plot_polished
 
 ## TODO: add the plot of temperature below
 }
}
\keyword{datasets}
