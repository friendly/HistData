\name{ChestSizes}
\alias{ChestSizes}
\docType{data}
\title{
Chest measurements of 5738 Scottish Militiamen
}
\description{
Quetelet's data on chest measurements of 5738 Scottish Militiamen. Quetelet (1846) used this
data as a demonstration of the normal distribution of physical characteristics.
}
\usage{data(ChestSizes)}
\format{
  A data frame with 16 observations on the following 2 variables.
  \describe{
    \item{\code{chest}}{Chest size (in inches)}
    \item{\code{count}}{Number of soldiers with this chest size}
  }
}
%\details{
%%%  ~~ If necessary, more details than the __description__ above ~~
%}
\source{
Velleman, P. F. and Hoaglin, D. C. (1981). 
\emph{Applications, Basics, and Computing of Exploratory Data Analysis}. Belmont. CA: Wadsworth.
Retrieved from Statlib: \code{https://www.stat.cmu.edu/StatDat/Datafiles/MilitiamenChests.html}
}
\references{
A. Quetelet, \emph{Lettres a S.A.R. le Duc Regnant de Saxe-Cobourg et Gotha, sur la Theorie des Probabilites, 
Appliquee aux Sciences Morales et Politiques}. Brussels: M. Hayes, 1846, p. 400.

}
\examples{
data(ChestSizes)
## maybe str(ChestSizes) ; plot(ChestSizes) ...

# frequency polygon
plot(ChestSizes, type='b')
#barplot
barplot(ChestSizes[,2], ylab="Frequency", xlab="Chest size")
}
\keyword{datasets}
