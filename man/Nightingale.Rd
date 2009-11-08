\name{Nightingale}
\Rdversion{1.1}
\alias{Nightingale}
\docType{data}
\title{
Florence Nightingale's data on deaths from various causes in the Crimean War
}
\description{
In the history of data visualization, Florence Nightingale is best remembered 
for her role as a social activist and her view that statistical data,  presented in
charts and diagrams, could be used as powerful arguments for medical reform. 

After witnessing deplorable sanitary conditions  in the Crimea, she wrote  
several influential texts (Nightingale, 1858, 1859), including polar-area
graphs (sometimes called "Coxcombs" or rose diagrams), showing the number of deaths in the
Crimean from battle compared to disease or preventable causes that could be reduced by
better battlefield nursing care.  

Her \emph{Diagram of the Causes of Mortality in the Army in the East}
showed that  most of the  British soldiers who  died  during the  Crimean War
died of sickness rather than of wounds  or other causes.
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
For a given cause of death, \code{D}, annual rates per 1000 are calculated as \code{12 * 1000 * D / Army}.
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

Pearson, M. and Short, I. (2008)
Nightingale's Rose (flash animation).
\url{http://understandinguncertainty.org/files/animations/Nightingale11/Nightingale1.html}
}
\examples{
data(Nightingale)

# What if she had made a set of line graphs?

colors <- c("blue", "red", "black")
with(Nightingale, {
	plot(Date, Disease.rate, type="n", col="blue", 
		ylab="Annual Death Rate", xlab="Date", xaxt="n",
		main="Causes of Mortality of the British Army in the East");
	# background, to separate before, after
	rect(as.Date("1854/4/1"), -10, as.Date("1855/3/1"), 
		1.02*max(Disease.rate), col="lightgray", border="transparent");
	text( as.Date("1854/4/1"), .98*max(Disease.rate), "Before Sanitary\nCommission", pos=4);
	text( as.Date("1855/4/1"), .98*max(Disease.rate), "After Sanitary\nCommission", pos=4);
	# plot the data
	points(Date, Disease.rate, type="b", col=colors[1]);
	points(Date, Wounds.rate, type="b", col=colors[2]);
	points(Date, Other.rate, type="b", col=colors[3])
	}
)
# add custom Date axis and legend
axis.Date(1, at=seq(as.Date("1854/4/1"), as.Date("1856/3/1"), "4 months"), format="\%b \%Y")
legend(as.Date("1855/10/20"), 700, c("Disease", "Wounds", "Other"),
	col=colors, fill=colors, title="Cause")

# For some graphs, it is more convenient to
# reshape death rates to long format; keep only Date and death rates
require(reshape)
Night<- Nightingale[,c(1,8:10)]
nm <- melt(Night, "Date")
names(nm) <- c("Date", "Cause", "Deaths")
nm$Cause <- sub("\\\\.rate", "", nm$Cause)
nm$Regime <- ordered( rep(c(rep('Before', 12), rep('After', 12)), 3), levels=c('Before', 'After'))
Night <- nm

}
\keyword{datasets}
