\name{DrinksWages}
\Rdversion{1.1}
\alias{DrinksWages}
\docType{data}
\title{
Elderton and Pearson's (1910) data on drinking and wages
}
\description{
In 1910, Karl Pearson weighed in on the debate, fostered by the temperance movement,
on the evils done by alcohol not only to drinkers, but to their families.
The report "A first study of the influence
of parental alcholism on the physique and ability of their offspring"
was an ambitious attempt to the new methods of statistics to bear on
an important question of social policy, to see if the hypothesis that
children were damaged by parental alcoholism would stand up to
statistical scrutiny.

Working with his assistant, Ethel M. Elderton, Pearson collected voluminous
data in Edinburgh and Manchester on many aspects of health, stature,
intelligence, etc. of children classified according to the drinking
habits of their parents.  His conclusions where almost invariably
negative:  the tendency of parents to drink appeared unrelated
to any thing he had measured.

The firestorm that this report set off is well described by Stigler (1999),
Chapter 1.  The data set \code{DrinksWages} is just one of Pearsons
many tables, that he published in a letter to \emph{The Times},
August 10, 1910. 
}
\usage{data(DrinksWages)}
\format{
  A data frame with 70 observations on the following 6 variables.
  \describe{
    \item{\code{class}}{wage class: a factor with levels \code{A} \code{B} \code{C}}
    \item{\code{trade}}{a factor with levels \code{baker} \code{barman} \code{billposter} \code{blacksmith} \code{bookbinder} \code{bottler} \code{brassfounder} \code{butcher} \code{cabinetmaker} \code{cabmen} \code{carter} \code{cellarman} \code{chemist} \code{chimneysweep} \code{clerk} \code{coachbuilder} \code{coopers} \code{engineer} \code{factory worker} \code{french polisher} \code{gardener} \code{gasworker} \code{general labourer} \code{glassmaker} \code{goldbeater} \code{hammerman} \code{ironfounder} \code{ironmoulder} \code{jeweller} \code{joiner} \code{letterpresser} \code{linesman} \code{lithographer} \code{maltmen} \code{mason} \code{millworker} \code{painter} \code{papercutter} \code{picture framer} \code{pipelayer} \code{plasterer} \code{platelayer} \code{plumber} \code{porter} \code{postman} \code{printer} \code{railway porter} \code{rivetter} \code{sadler} \code{sailor} \code{scavenger} \code{shoemaker} \code{shop hand} \code{slater} \code{stablemen} \code{stoker} \code{stonecutter} \code{stream crane} \code{surfaceman} \code{tailors} \code{timekeeper} \code{tinsmith} \code{tramdriver} \code{turnroom} \code{typecaster} \code{upholsterer} \code{wagon examiner} \code{warehouse} \code{wellsinker} \code{wireworker}}
    \item{\code{sober}}{the number of non-drinkers, a numeric vector}
    \item{\code{drinks}}{the number of drinkers, a numeric vector}
    \item{\code{wage}}{weekly wage (in shillings), a numeric vector}
    \item{\code{n}}{total number, a numeric vector}
  }
}
\details{
The data give Karl Pearson's tabulation of the father's trades from
an Edinburgh sample, classified by whether they dring or are sober,
and giving average weekly wage.

The wages are averages of the individuals' nominal wages.
Class A is those with wages under 2.5s.; B: those with wages 2.5s. to 30s.; C:
wages over 30s.
}
\source{
Pearson, K. (1910). \emph{The Times}, August 10, 1910.

Stigler, S. M. (1999).
\emph{Statistics on the Table: The History of Statistical Concepts and Methods}.
 Harvard University Press, Table 1.1
}
\references{
M. E. Elderton & K. Pearson (1910). A first study of the influence
of parental alcholism on the physique and ability of their offspring,
Eugenics Laboratory Memoirs, 10.

}
\examples{
data(DrinksWages)
plot(DrinksWages) 

# plot proportion sober vs. wage | class
with(DrinksWages, plot(wage, sober/n, col=c("blue","red","green")[class]))

# fit logistic regression model of sober on wage
mod.sober <- glm(cbind(sober, n) ~ wage, family=binomial, data=DrinksWages)
summary(mod.sober)
op <- par(mfrow=c(2,2))
plot(mod.sober)
par(op)

# TODO: plot fitted model
}
\keyword{datasets}
