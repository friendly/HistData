\name{PolioTrials}
\alias{PolioTrials}
\docType{data}
\title{
Polio Field Trials Data
}
\description{
The data frame \code{PolioTrials} gives the results of the 1954 field trials to test the Salk polio vaccine 
(named for the developer, Jonas Salk), conducted by the National Foundation for Infantile Paralysis (NFIP). 
It is adapted from data in the article by Francis et al. (1955).  
There were actually two clinical trials, corresponding to two statistical designs (\code{Experiment}),
discussed by Brownlee (1955).  The comparison of designs and results represented a
milestone in the development of randomized clinical trials. 
}
\usage{data(PolioTrials)}
\format{
  A data frame with 8 observations on the following 6 variables.
  \describe{
    \item{\code{Experiment}}{a factor with levels \code{ObservedControl} \code{RandomizedControl}}
    \item{\code{Group}}{a factor with levels \code{Controls} \code{Grade2NotInoculated} \code{IncompleteVaccinations} \code{NotInoculated} \code{Placebo} \code{Vaccinated}}
    \item{\code{Population}}{the size of the population in each group in each experiment}
    \item{\code{Paralytic}}{the number of cases of paralytic polio observed in that group}
    \item{\code{NonParalytic}}{the number of cases of paralytic polio observed in that group}
    \item{\code{FalseReports}}{the number of cases initially reported as polio, but later determined
    	not to be polio in that group}
  }
}
\details{
The data frame is in the form of a single table, but actually comprises the results of two separate
field trials, given by \code{Experiment}.  Each should be analyzed separately, because the designs
differ markedly.

The original design (\code{Experiment == "ObservedControl"})
called for vaccination of second-graders at selected schools in selected areas  
of the country (with the consent of the children's parents, of course). 
The \code{Vaccinated} second-graders  formed the treatment group. 
The first and third-graders at the schools were not given the vaccination, and formed the 
\code{Controls} group. 

In the second design  (\code{Experiment == "RandomizedControl"})
children were selected (again in various schools in various areas), 
all of whose parents consented to vaccination. 
The sample was randomly divided into treatment (\code{Group == "Vaccinated"}),
given the real polio vaccination, 
and control groups (\code{Group == "Placebo"}), 
a placebo dose that looked just like the real vaccine.   
The experiment was also double blind:  neither the parents of a child in the study nor the doctors treating the child knew which group the child belonged to.  

In both experiments, \code{NotInnoculated} refers to children who did not participate in the experiment.
\code{IncompleteVaccinations} refers to children who received one or two, but not all three
administrations of the vaccine.


}
\source{
Kyle Siegrist, "Virtual Laboratories in Probability and Statistics", \url{http://www.math.uah.edu/stat/data/Polio.xhtml}

Thomas Francis, Robert Korn, et al. (1955). "An Evaluation of the 1954 Poliomyelitis Vaccine Trials", 
\emph{American Journal of Public Health},  45, (50 page supplement with a 63 page appendix).
}
\references{
K. A.  Brownlee (1955). "Statistics of the 1954 Polio Vaccine Trials",  
\emph{Journal of the American Statistical Association},  50, 1005-1013.
}
\examples{
data(PolioTrials)
## maybe str(PolioTrials) ; plot(PolioTrials) ...
}
\keyword{datasets}
