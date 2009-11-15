\name{Dactyl}
\Rdversion{1.1}
\alias{Dactyl}
\docType{data}
\title{
Edgeworth's counts of dactyls in Virgil's Aeneid
}
\description{
Edgeworth (1885) took the first 75 lines in Book XI of
Virgil's \emph{Aeneid} and classified each of the first four "feet" of the line 
as a dactyl (one long syllable followed by two short ones) or not.

Grouping the lines in blocks of five gave a 4 x 25 table of counts,
represented here as a data frame with ordered factors, \code{Foot} and
\code{Lines}. Edgeworth used this table in what was among the first
examples of analysis of variance applied to a two-way
classification.
}
\usage{data(Dactyl)}
\format{
  A data frame with 60 observations on the following 3 variables.
  \describe{
    \item{\code{Foot}}{an ordered factor with levels \code{1} < \code{2} < \code{3} < \code{4}}
    \item{\code{Lines}}{an ordered factor with levels \code{1:5} < \code{6:10} < \code{11:15} < \code{16:20} < \code{21:25} < \code{26:30} < \code{31:35} < \code{36:40} < \code{41:45} < \code{46:50} < \code{51:55} < \code{56:60} < \code{61:65} < \code{66:70} < \code{71:75}}
    \item{\code{count}}{number of dactyls}
  }
}
%\details{
%%%  ~~ If necessary, more details than the __description__ above ~~
%}
\source{
Stigler, S. (1999)
\emph{Statistics on the Table}
Cambridge, MA: Harvard University Press, table 5.1.
}
\references{
Edgeworth, F. Y. (1885).
On methods of ascertaining variations in the rate of births, deaths and marriages.
\emph{Journal of the [Royal] Statistical Society}, 48, 628-649.
}
\examples{
data(Dactyl)

# display the basic table
xtabs(count ~ Foot+Lines, data=Dactyl)

# simple two-way anova
anova(dact.lm <- lm(count ~ Foot+Lines, data=Dactyl))

# plot the lm-quartet
op <- par(mfrow=c(2,2))
plot(dact.lm)
par(op)

# show table as a simple mosaicplot
mosaicplot(xtabs(count ~ Foot+Lines, data=Dactyl), shade=TRUE)
}
\keyword{datasets}
