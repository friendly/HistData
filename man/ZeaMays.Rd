\name{ZeaMays}
\alias{ZeaMays}
\docType{data}
\title{
Darwin's Heights of Cross- and Self-fertilized Zea May Pairs
}
\description{
Darwin (1876) studied the growth of pairs of zea may (aka corn)
seedlings, one produced by cross-fertilization and the other
produced by self-fertilization, but otherwise grown under identical 
conditions.
His goal was to demonstrate the greater vigour of the cross-fertilized plants.
The data recorded are the final height (inches, to the nearest 1/8th)  of the plants in each pair.

In the \emph{Design of Experiments}, Fisher (1935) used these data to illustrate
a paired t-test (well, a one-sample test on the mean difference, \code{cross - self}).
Later in the book (section 21), he used this data to illustrate an early example of a non-parametric permutation
test, treating each paired difference as having (randomly) either a positive or negative sign. 
}
\usage{data(ZeaMays)}
\format{
  A data frame with 15 observations on the following 4 variables.
  \describe{
    \item{\code{pair}}{pair number, a numeric vector}
    \item{\code{pot}}{pot, a factor with levels \code{1} \code{2} \code{3} \code{4}}
    \item{\code{cross}}{height of cross fertilized plant, a numeric vector}
    \item{\code{self}}{height of cross fertilized plant, a numeric vector}
    \item{\code{diff}}{\code{cross - self} for each pair}
  }
}
\details{
In addition to the standard paired t-test,
several types of non-parametric tests can be contemplated:

(a) Permutation test, where the values of, say \code{self} are permuted and \code{diff=cross - self}
is calculated for each permutation.  There are 15! permutations, but a reasonably
large number of random permutations would suffice.  But this doesn't take the paired samples
into account.

(b) Permutation test based on assigning each \code{abs(diff)} a + or - sign, and calculating the mean(diff).
There are \eqn{2^{15}} such possible values.  This is essentially what Fisher 
proposed.  The p-value for the test is the proportion of absolute mean differences
under such randomization which exceed the observed mean difference.

(c) Wilcoxon signed rank test: tests the hypothesis that the median signed rank of the \code{diff} is zero,
or that the distribution of \code{diff} is symmetric about 0, vs. a location shifted alternative.

}
\source{
Darwin, C. (1876). \emph{The Effect of Cross- and Self-fertilization in the Vegetable Kingdom},
2nd Ed. London: John Murray.

Andrews, D. and Herzberg, A. (1985) \emph{Data:
a collection of problems from many fields for the student and research worker}.
New York: Springer. Data retrieved from: \url{http://lib.stat.cmu.edu/datasets/Andrews/}
}
\references{
Fisher, R. A. (1935). \emph{The Design of Experiments}. London: Oliver & Boyd.
}
\seealso{
\code{\link[stats]{wilcox.test}}

\code{\link[coin]{independence_test}} in the \code{coin} package, a general framework for conditional inference procedures
(permutation tests)
}

\examples{
data(ZeaMays)

##################################
## Some preliminary exploration ##
##################################
boxplot(ZeaMays[,c("cross", "self")], ylab="Height (in)", xlab="Fertilization")

# examine large individual diff/ces
largediff <- subset(ZeaMays, abs(diff) > 2*sd(abs(diff)))
with(largediff, segments(1, cross, 2, self, col="red"))

# plot cross vs. self.  NB: unusual trend and some unusual points
with(ZeaMays, plot(self, cross, pch=16, cex=1.5))
abline(lm(cross ~ self, data=ZeaMays), col="red", lwd=2)

# pot effects ?
 anova(lm(diff ~ pot, data=ZeaMays))

##############################
## Tests of mean difference ##
##############################
# Wilcoxon signed rank test
# signed ranks:
with(ZeaMays, sign(diff) * rank(abs(diff)))
wilcox.test(ZeaMays$cross, ZeaMays$self, conf.int=TRUE, exact=FALSE)

# t-tests
with(ZeaMays, t.test(cross, self))
with(ZeaMays, t.test(diff))

mean(ZeaMays$diff)
# complete permutation distribution of diff, for all 2^15 ways of assigning
# one value to cross and the other to self (thx: Bert Gunter)
N <- nrow(ZeaMays)
allmeans <- as.matrix(expand.grid(as.data.frame(
                         matrix(rep(c(-1,1),N), nr =2))))  \%*\% abs(ZeaMays$diff) / N

# upper-tail p-value
sum(allmeans > mean(ZeaMays$diff)) / 2^N
# two-tailed p-value
sum(abs(allmeans) > mean(ZeaMays$diff)) / 2^N

hist(allmeans, breaks=64, xlab="Mean difference, cross-self",
	main="Histogram of all mean differences")
abline(v=c(1, -1)*mean(ZeaMays$diff), col="red", lwd=2, lty=1:2)

plot(density(allmeans), xlab="Mean difference, cross-self",
	main="Density plot of all mean differences")
abline(v=c(1, -1)*mean(ZeaMays$diff), col="red", lwd=2, lty=1:2)


}
\keyword{datasets}
\keyword{nonparametric}

