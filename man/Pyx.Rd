\name{Pyx}
\Rdversion{1.1}
\alias{Pyx}
\docType{data}
\title{
Trial of the Pyx
}
\description{
Stigler (1997, 1999) recounts the history of one of the oldest continuous schemes of
sampling inspection carried out by the Royal Mint in London for about eight centuries.
The Trial of the Pyx was the final, ceremonial stage in a process designed to ensure that
the weight and quality of gold and silver coins from the mint met the standards for
coinage.  

At regular intervals, coins would be taken from production and deposited into
a box called the Pyx.
When a Trial of the Pyx was called, the contents of the Pyx would be counted, weighed
and assayed for content, and the results would be compared with the standard set 
for the Royal Mint. 

The data frame \code{Pyx} gives the results for the year 1848 (Great Britain, 1848) in which 10,000
gold sovereigns were assayed. The coins in each bag were classified according to the
deviation from the standard content of gold for each coin, called the Remedy,
R = 123 * (12/5760) = .25625, in grains, for a single sovereign. 
}
\usage{data(Pyx)}
\format{
  A frequency data frame with 72 observations on the following 4 variables giving the
  distribution of 10,000 sovereigns, classified according to the \code{Bags} in which
  they were collected and the \code{Deviation} from the standard weight.
  \describe{
    \item{\code{Bags}}{an ordered factor with levels \code{1 and 2} < \code{3} < \code{4} < \code{5} < \code{6} < \code{7} < \code{8} < \code{9} < \code{10}}
    \item{\code{Group}}{an ordered factor with levels \code{below std} < \code{near std} < \code{above std}}
    \item{\code{Deviation}}{an ordered factor with levels \code{Below -R} < \code{(-R to -.2)} < \code{(-.2 to -.l)} < \code{(-.1 to 0)} < \code{(0 to .l)} < \code{(.1 to .2)} < \code{(.2 to R)} < \code{Above R}}
    \item{\code{count}}{number of sovereigns}
  }
}
\details{
\code{Bags} 1-4 were selected as "near to standard", bags 5-7 as below standard, bags 8-10 as above standard.
This classification is reflected in \code{Group}.
}
\source{
Stigler, S. M. (1999).
\emph{Statistics on the Table}.
Cambridge, MA: Harvard University Press, table 21.1.
}
\references{
Great Britain (1848).
"Report of the Commissioners Appointed to Inquire into the Constitution, Management
and Expense of the Royal Mint."
In Vol 28 of \emph{House Documents for 1849}.

Stigler, S. M. (1997).
Eight Centuries of Sampling Inspection: The Trial of the Pyx
\emph{Journal of the American Statistical Association}, 72(359), 493-500 

}
\examples{
data(Pyx)
# display as table
xtabs(count ~ Bags+Deviation, data=Pyx)

# grouped histogram
# from: https://github.com/drjohnrussell/30DayChartChallenge/blob/main/2025/Challenge08.R
library(ggplot2)
library(dplyr)
Pyx |> 
  mutate(Bags=forcats::fct_relevel(Bags,"5","6","7")) |>
  group_by(Bags) |> 
  mutate(percent=count/sum(count)*100) |>
  ungroup() |>
  ggplot(aes(x=Deviation, y=percent,
             group=Bags, fill=Group)) +
  geom_col(position=position_dodge()) +
  scale_fill_brewer(palette="Dark2") +
  theme_minimal() +
  theme(legend.position = "top") +
  labs(x="Deviation from the Standard",
       y="Percentage of an individual bag",
       title="Trial of the Pyx (1848)",
       fill="")

}
\keyword{datasets}
