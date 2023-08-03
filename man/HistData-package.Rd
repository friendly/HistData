\name{HistData-package}
\Rdversion{1.1}
\alias{HistData-package}
\alias{HistData}
\docType{package}
\title{
Data sets from the History of Statistics and Data Visualization}

\description{
The HistData package provides a collection of data sets
that are interesting and important in the history of statistics and data visualization.
The goal of the package is to make these available, both for instructional use
and for historical research.

Some of the data sets have examples which reproduce an historical graph or analysis.
These are meant mainly as starters for more extensive re-analysis or graphical
elaboration. Some of these present graphical challenges to reproduce in R.

They are part of a program of research called \emph{statistical historiography},
meaning the use of statistical methods to study problems and questions in the
history of statistics and graphics.  A main aspect of this is the increased
understanding of historical problems in science and data analysis
trough the process of trying to reproduce a graph or analysis using
modern methods. I call this "Re-visioning", meaning to \emph{see again,
hopefully in a new light}.

A number of these are illustrated in our book,
Friendly & Wainer (2021), \emph{A History of Data Visualization and Graphic Communication},
and some are re-produced in R in the companion web site, \url{https://friendly.github.io/HistDataVis/}.
}


\details{
Descriptions of each DataSet can be found using \code{help(DataSet)};
\code{example(DataSet)} will likely show applications similar to the
historical use.

Data sets included in the HistData package are:

\describe{
  \item{\code{\link{Arbuthnot}}}{Arbuthnot's data on male and female birth ratios in London from 1629-1710}
  \item{\code{\link{Armada}}}{The Spanish Armada}
  \item{\code{\link{Bowley}}}{Bowley's data on values of British and Irish trade, 1855-1899}
  \item{\code{\link{Breslau}}}{Halley's Breslau Life Table}
  \item{\code{\link{Cavendish}}}{Cavendish's 1798 determinations of the density of the earth}
  \item{\code{\link{ChestSizes}}}{Quetelet's data on chest measurements of Scottish militiamen}
  \item{\code{\link{Cholera}}}{William Farr's Data on Cholera in London, 1849}
  \item{\code{\link{CholeraDeaths1849}}}{Daily Deaths from Cholera and Diarrhaea in England, 1849}
  \item{\code{\link{CushnyPeebles}}}{Cushny-Peebles data: Soporific effects of scopolamine derivatives}
  \item{\code{\link{Dactyl}}}{Edgeworth's counts of dactyls in Virgil's Aeneid}
  \item{\code{\link{DrinksWages}}}{Elderton and Pearson's (1910) data on drinking and wages}
  \item{\code{\link{EdgeworthDeaths}}}{Edgeworth's Data on Death Rates in British Counties}
  \item{\code{\link{Fingerprints}}}{Waite's data on Patterns in Fingerprints}
  \item{\code{\link{Galton}}}{Galton's data on the heights of parents and their children}
  \item{\code{\link{GaltonFamilies}}}{Galton's data on the heights of parents and their children, by family}
  \item{\code{\link{Guerry}}}{Data from A.-M. Guerry, "Essay on the Moral Statistics of France"}
  \item{\code{\link{HalleyLifeTable}}}{Halley's Life Table}
  \item{\code{\link{Jevons}}}{W. Stanley Jevons' data on numerical discrimination}
  \item{\code{\link{Langren}}}{van Langren's data on longitude distance between Toledo and Rome}
  \item{\code{\link{Macdonell}}}{Macdonell's data on height and finger length of criminals, used by Gosset (1908)}
  \item{\code{\link{Mayer}}}{Mayer's data on the libration of the moon}
  \item{\code{\link{Michelson}}}{Michelson's 1879 determinations of the velocity of light}
  \item{\code{\link{Minard}}}{Data from Minard's famous graphic map of Napoleon's march on Moscow}
  \item{\code{\link{Nightingale}}}{Florence Nightingale's data on deaths from various causes in the Crimean War}
  \item{\code{\link{OldMaps}}}{Latitudes and Longitudes of 39 Points in 11 Old Maps}
  \item{\code{\link{PearsonLee}}}{Pearson and Lee's 1896 data on the heights of parents and children classified by gender}
  \item{\code{\link{PolioTrials}}}{Polio Field Trials Data on the Salk vaccine}
  \item{\code{\link{Pollen}}}{5D dataset from the 1986 JSM Challenge}
  \item{\code{\link{Prostitutes}}}{Parent-Duchatelet's time-series data on the number of prostitutes in Paris}
  \item{\code{\link{Pyx}}}{Trial of the Pyx}
  \item{\code{\link{Quarrels}}}{Statistics of Deadly Quarrels}
  \item{\code{\link{Saturn}}}{Laplace's Saturn data}
  \item{\code{\link{Snow}}}{John Snow's map and data on the 1854 London Cholera outbreak}
  \item{\code{\link{Virginis}}}{J. F. W. Herschel's data on the orbit of the twin star gamma Virginis}
  \item{\code{\link{Wheat}}}{Playfair's data on wages and the price of wheat}
  \item{\code{\link{Yeast}}}{Student's (1906) Yeast Cell Counts}
  \item{\code{\link{ZeaMays}}}{Darwin's Heights of Cross- and Self-fertilized Zea May Pairs}
}

}


\author{
Michael Friendly

Maintainer: Michael Friendly <friendly@yorku.ca>
}
\references{
Friendly, M. (2007). A Brief History of Data Visualization.
In Chen, C., Hardle, W. & Unwin, A. (eds.)  
\emph{Handbook of Computational Statistics: Data Visualization}, Springer-Verlag, III, Ch. 1, 1-34.

Friendly, M. & Denis, D. (2001).
Milestones in the history of thematic cartography, statistical graphics, and data visualization.
\url{http://datavis.ca/milestones/}

Friendly, M. & Denis, D. (2005). The early origins and development of the scatterplot. 
\emph{Journal of the History of the Behavioral Sciences}, 
41, 103-130.

Friendly, M. & Sigal, M. & Harnanansingh, D. (2016).
"The Milestones Project: A Database for the History of Data Visualization,"  
In Kostelnick, C. & Kimball, M. (ed.),  
\emph{Visible Numbers: The History of Data Visualization}, Ashgate Press, Chapter 10.

Friendly, M. & Wainer, H. (2021). \emph{A History of Data Visualization and Graphic Communication}.
Harvard University Press. Book: \url{https://www.hup.harvard.edu/catalog.php?isbn=9780674975231}, Web site:
\url{https://friendly.github.io/HistDataVis/}.

}

\seealso{
\code{\link{Arbuthnot}}, 
\code{\link{Armada}}, 
\code{\link{Bowley}},
\code{\link{Cavendish}}, 
\code{\link{ChestSizes}}, 
\code{\link{Cholera}}, 
\code{\link{CholeraDeaths1849}}, 
\code{\link{CushnyPeebles}},

\code{\link{Dactyl}}, 
\code{\link{DrinksWages}}, 
\code{\link{EdgeworthDeaths}}, 
\code{\link{Fingerprints}},
\code{\link{Galton}}, 
\code{\link{GaltonFamilies}}, 
\code{\link{Guerry}},
\code{\link{HalleyLifeTable}},

\code{\link{Jevons}}, 
\code{\link{Langren}},
\code{\link{Macdonell}}, 
\code{\link{Michelson}}, 
\code{\link{Minard}},
\code{\link{Nightingale}},

\code{\link{OldMaps}}, 
\code{\link{PearsonLee}},
\code{\link{PolioTrials}}, 
\code{\link{Pollen}}, 
\code{\link{Prostitutes}}, 
\code{\link{Pyx}},

\code{\link{Quarrels}},
\code{\link{Snow}},
\code{\link{Wheat}},
\code{\link{Yeast}},
\code{\link{ZeaMays}
}

Other packages containing data sets of historical interest include:

The \code{\link[Guerry]{Guerry-package}}, containing maps and
other data sets related to Guerry's (1833) \emph{Moral Statistics of France}.

\code{morsecodes} from the (defunct) \pkg{xgobi} package
for data from Rothkopf (1957) on errors in learning Morse code, a classical
example for MDS.

The \pkg{psych} package, containing Galton's \code{peas} data.
% \code{\link[psych]{peas}} data.
The same data set is contained in \pkg{alr4} as \code{\link[alr4]{galtonpeas}}.

The \pkg{agridat} contains a large number of data sets of agricultural data,
including some extra data sets related to
 the classical barley data 
(\code{\link[MASS]{immer}} and \code{\link[lattice]{barley}})
 from Immer (1934): 
\code{\link[agridat]{minnesota.barley.yield}},
\code{\link[agridat]{minnesota.barley.weather}}.
}

\keyword{ package }
\examples{
# see examples for the separate data sets
}
