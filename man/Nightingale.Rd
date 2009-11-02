\name{Nightingale}
\Rdversion{1.1}
\alias{Nightingale}
\docType{data}
\title{
Florence Nightingale's data on deaths from various causes in the Crimean War
}
\description{
In the history of data visualization, Florence Nightingale is best remembered 
for her role as a social  activist and view that statistical data,  presented in
charts and diagrams, could be used as powerful arguments for medical reform. 

After witnessing deplorable sanitary conditions  in the Crimea, she wrote  
several influential texts (Nightingale, 1858, 1859), including polar-area
graphs (sometimes called "Coxcombs" or rose diagrams), showing the number of deaths in the
Crimean from battle compared to preventable causes that could be reduced by
better battlefield nursing care.  

Her \emph{Diagram of the Causes of Mortality in the Army in the East}
showed that  most of the  British soldiers who  died  during the  Crimean War
died of sickness rather than of wounds  or other causes (red  or black).
It also  showed that  the death  rate was  higher in  the first  year of the war,
before a Sanitary Commissioners arrived in March 1855 to improve hygiene in the camps and hospitals.
}
\usage{data(Nightingale)}
\format{
  A data frame with 24 observations on the following 10 variables.
  \describe{
    \item{\code{Date}}{a Date, composed as \code{as.Date(paste(Year, Month, 1, sep='-'), "\%Y-\%b-\%d")}}
    \item{\code{Month}}{Month of the Crimean War, a factor}
    \item{\code{Year}}{Year of the Crimean War}
    \item{\code{Army}}{Estimated average monthly strength of the British army}
    \item{\code{Disease}}{Number of deaths from preventable or mitagable zymotic diseases}
    \item{\code{Wounds}}{Number of deaths directly from battle wounds}
    \item{\code{Other}}{Number of deaths from other causes}
    \item{\code{Disease.rate}}{Annual rate of deaths from preventable or mitagable zymotic diseases, per 1000}
    \item{\code{Wounds.rate}}{Annual rate of deaths directly from battle wounds, per 1000}
    \item{\code{Other.rate}}{Annual rate of deaths from other causes, per 1000}
  }
}
\details{
For a given cause of death, \code{D}, annual rates per 1000 are calcualted as \code{12000 * D / Army}.
}
\source{
The data were obtained from:

Pearson, M. and Short, I. (2007).
Understanding Uncertainty: Mathematics of the Coxcomb.
\url{http://understandinguncertainty.org/node/214}.

}
\references{
Nightingale, F. (1858)
\emph{Notes on Matters Affecting the Health, Efficiency, and Hospital Administration of the British Army}
Harrison and Sons, 1858


Nightingale, F. (1859)
\emph{A Contribution to the Sanitary History of the British Army during the Late War with Russia}
London: John W. Parker and Son.

Small, H. (1998)
Florence Nightingale's statistical diagrams
\url{http://www.florence-nightingale-avenging-angel.co.uk/GraphicsPaper/Graphics.htm}

Nightingale's Rose (flash animation).
\url{http://understandinguncertainty.org/files/animations/Nightingale11/Nightingale1.html}
}
\examples{
data(Nightingale)
## maybe str(Nightingale) ; plot(Nightingale) ...
}
\keyword{datasets}
