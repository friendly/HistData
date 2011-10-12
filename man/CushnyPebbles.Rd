\name{CushnyPebbles}
\alias{CushnyPebbles}
\alias{CushnyPebblesN}
\docType{data}
\title{
Cushny-Pebbles Data: Soporific Effects of Scopolamine Derivatives
}
\description{
Cushny and Peebles (1905) studied the effects of hydrobromides
related to scopolamine and atropine
in producing sleep. The sleep of mental patients was
measured without hypnotic (\code{Control}) and after treatment 
with one of three drugs: L. hyoscyamine hydrobromide (\code{L_hyoscyamine}),
L. hyoscine hydrobromide (\code{L_hyoscyine}), and
a mixture (racemic) form, \code{DL_hyoscine}, called atropine.  
The L (levo) and D (detro)
form of a given molecule are optical isomers (mirror images).

The drugs were given on alternate evenings, and the hours
of sleep were compared with the intervening control night.
Each of the drugs was tested in this manner a varying number of times in each subject.
The average number of hours of sleep for each treatment is the response.

Student (1908) used these data to illustrate the paired-sample t-test
in small samples, testing the hypothesis that the mean difference between
a given drug and the control condition was zero.  
This data set became well known when used by Fisher (1925).  Both Student
and Fisher had problems labeling the drugs correctly (see Senn & Richardson (1994)),
and consequently came to wrong conclusions.

But as well, the sample sizes (number of nights) for each mean differed widely,
ranging from 3-9, and this was not taken into account in their analyses.
To allow weighted analyses, the number of observations for each mean
is contained in the data frame \code{CushnyPebblesN}.

}
\usage{
data(CushnyPebbles)
data(CushnyPebblesN)
	}
\format{
  \code{CushnyPebbles}: A data frame with 11 observations on the following 4 variables.
  \describe{
    \item{\code{Control}}{a numeric vector: mean hours of sleep}
    \item{\code{L_hyoscyamine}}{a numeric vector: mean hours of sleep}
    \item{\code{L_hyoscine}}{a numeric vector: mean hours of sleep}
    \item{\code{D_hyoscine}}{a numeric vector: mean hours of sleep}
  }

  \code{CushnyPebblesN}:   A data frame with 11 observations on the following 4 variables.
  \describe{
    \item{\code{Control}}{a numeric vector: number of observations}
    \item{\code{L_hyoscyamine}}{a numeric vector: number of observations}
    \item{\code{L_hyoscine}}{a numeric vector: number of observations}
    \item{\code{DL_hyoscine}}{a numeric vector: number of observations}
  }

}
\details{
The last patient (11) has no \code{Control} observations, and so is often excluded
in analyses or other versions of this data set.
}
\source{
Cushny, A. R., and Peebles, A. R. (1905), "The Action of Optical Isomers. II:
Hyoscines," \emph{Journal of Physiology}, 32, 501-510.

Senn, Stephen, Data from Cushny and Pebbles, \url{http://www.senns.demon.co.uk/Data/Cushny.xls}
}
\references{

Fisher, R. A. (1925), \emph{Statistical Methods for Research Workers}, Edinburgh and London:
Oliver & Boyd.

Student (1908), "The Probable Error of a Mean," \emph{Biometrika}, 6, 1-25.

Senn, S.J. and Richardson, W. (1994), "The first t-test", \emph{Statistics in Medicine}, 13, 785-803.
}
\examples{
data(CushnyPebbles)
plot(CushnyPebbles)
boxplot(CushnyPebbles, ylab="Hours of Sleep")

}
\keyword{datasets}
