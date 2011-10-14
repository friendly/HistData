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
Later in the book (section 21), he used this data to illustrate an early example of a non-parametric sign
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
Two types of non-parametric tests can be contemplated:

(a) Permutation test, where the values of, say \code{self} are permuted and \code{diff=cross - self}
is calculated for each permutation.  There are 15! permutations, but a reasonably
large number of random permutations would suffice.  But this doesn't take the paired samples
into account.

(b) Test based on assigning each \code{abs(diff)} a + or - sign, and calculating the mean(diff).
There are \eqn{2^{15}} such possible values, but again, a reasonably large number of random
samples would do.


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
\examples{
data(ZeaMays)
boxplot(ZeaMays[,c("cross", "self")], ylab="Height (in)", xlab="Fertilization")

# t-tests
with(ZeaMays, t.test(cross, self))
with(ZeaMays, t.test(diff))

mean(ZeaMays$diff)
# complete permutation distribution of diff, for all 2^15 ways of assigning
# one value to cross and the other to self
allmeans <- as.matrix(expand.grid(as.data.frame(matrix(rep(c(-1,1),15), nr =2)))) %*% abs(ZeaMays$diff) / 15

# upper-tail p-value
sum(allmeans > mean(ZeaMays$diff)) / 2^15
# two-tailed p-value
sum(abs(allmeans) > mean(ZeaMays$diff)) / 2^15

hist(allmeans, breaks=64, xlab="Mean difference, cross-self",
	main="Histogram of all mean differences")
abline(v=mean(ZeaMays$diff), col="red", lwd=2)
abline(v=-mean(ZeaMays$diff), col="red", lwd=2, lty=2)

plot(density(allmeans), xlab="Mean difference, cross-self",
	main="Density plot of all mean differences")
abline(v=mean(ZeaMays$diff), col="red", lwd=2)
abline(v=-mean(ZeaMays$diff), col="red", lwd=2, lty=2)

}
\keyword{datasets}
