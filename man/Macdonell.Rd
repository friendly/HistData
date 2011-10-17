\name{Macdonell}
\Rdversion{1.1}
\alias{Macdonell}
\docType{data}
\title{
Macdonell's Data on Height and Finger Length of Criminals, used by Gosset (1908)
}
\description{
In the second issue of \emph{Biometrika}, W. R. Macdonell (1902) published an extensive
paper, \emph{On Criminal Anthropometry and the Identification of Criminals}
in which he included numerous tables of physical characteristics 3000 non-habitual 
male criminals serving their sentences in England and Wales.  His Table III (p. 216)
recorded a bivariate frequency distribution of \code{height} by \code{finger} length.
His main purpose was to show, via a Principal Components analysis, that Scotland Yard 
could have indexed their material more efficiently, and find a given profile more quickly. 

W. S. Gosset (aka "Student") used these data in two classic papers in 1908,
in which he derived various
characteristics of the sampling distributions of the mean, standard deviation and
Pearson's r. He said, "Before I had succeeded in solving my problem analytically, I
had endeavoured to do so empirically."  Among his experiments, he randomly shuffled
the 3000 observations from Macdonell's table, and then grouped them into samples
of size 4, 8, ..., calculating the sample means, standard deviations and correlations
for each sample. 
}
\usage{data(Macdonell)}
\format{
  A frequency data frame with 924 observations on the following 3 variables giving
  the bivariate frequency distribution of \code{height} and \code{finger}.
  \describe{
    \item{\code{height}}{lower class boundaries of height, in decimal ft.}
    \item{\code{finger}}{length of the left middle finger, in mm.}
    \item{\code{frequency}}{frequency of this combination of \code{height} and \code{finger}}
  }
}
\details{
Class intervals for \code{height} in Macdonell's table were given in 1 in.
ranges, from (4' 7" 9/16 - 4' 8" 9/16), to (6' 4" 9/16 - 6' 5" 9/16).
The values of \code{height} are taken as the lower class boundaries.

}
\source{
Macdonell, W. R. (1902).
On Criminal Anthropometry and the Identification of Criminals.
\emph{Biometrika}, 1(2), 177-227. doi:10.1093/biomet/1.2.177

The data used here were obtained from:

Hanley, J. (2008).
Macdonell data used by Student.
\url{http://www.medicine.mcgill.ca/epidemiology/hanley/Student/}

}

\references{
Hanley, J. and Julien, M. and Moodie, E. (2008).
Student's z, t, and s: What if Gosset had R?
\emph{The American Statistican}, 62(1), 64-69.

Gosett, W. S. [Student] (1908).
Probable error of a mean.
\emph{Biometrika}, 6(1), 1-25.
\url{http://www.york.ac.uk/depts/maths/histstat/student.pdf}

Gosett, W. S. [Student] (1908).
Probable error of a correlation coefficient.
\emph{Biometrika}, 6, 302-310.
}
\examples{
data(Macdonell)

# display the frequency table
xtabs(frequency ~ finger+round(height,3), data=Macdonell)

## Examples by james.hanley@mcgill.ca    October 16, 2011
## http://www.biostat.mcgill.ca/hanley/
## See:  http://www.biostat.mcgill.ca/hanley/Student/

#########################################
##  contour plots of height and finger ##
#########################################
 
# make a 22 x 42 table
attach(Macdonell)
ht <- unique(height) 
fi <- unique(finger)
fr <- t(matrix(frequency, nrow=42))
detach(Macdonell)

windows(10, 5)  # make plot double wide
op <- par(mfrow=c(1,2),mar=c(0.5,0.5,0.5,0.5),oma=c(2,2,0,0))

dx <- 0.5/12
dy <- 0.5/12

plot(ht,ht,xlim=c(min(ht)-dx,max(ht)+dx),
           ylim=c(min(fi)-dy,max(fi)+dy), xlab="", ylab="", type="n" )

# unpack  3000 heights while looping though the frequencies 
heights <- c()
for(i in 1:22) {
	for (j in 1:42) {
	 f  <-  fr[i,j]
	 if(f>0) heights <- c(heights,rep(ht[i],f))
	 if(f>0) text(ht[i], fi[j], toString(f), cex=0.4, col="grey40" ) 
	}
}
text(4.65,13.5, "Finger length (cm)",adj=c(0,1), col="black") ;
text(5.75,9.5, "Height (feet)", adj=c(0,1), col="black") ;
text(6.1,11, "Observed bin\nfrequencies", adj=c(0.5,1), col="grey40",cex=0.85) ;
# crude countour plot
contour(ht, fi, fr, add=TRUE, drawlabels=FALSE, col="grey60")


# smoother contour plot (Galton smoothed 2-D frequencies this way)
# [Galton had experience with plotting isbars for meteorological data]
# it was the smoothed plot that made him remember his 'conic sections'
# and ask a mathematician to work out for him the iso-density
# countours of a bivariate Gaussian distribution... 

dx <- 0.5/12; dy <- 0.05  ; # shifts caused by averaging

plot(ht,ht,xlim=c(min(ht),max(ht)),ylim=c(min(fi),max(fi)), xlab="", ylab="", type="n"  )
 
sm.fr <- matrix(rep(0,21*41),nrow <- 21)
for(i in 1:21) {
	for (j in 1:41) {
	   smooth.freq  <-  (1/4) * sum( fr[i:(i+1), j:(j+1)] ) 
	   sm.fr[i,j]  <-  smooth.freq
	   if(smooth.freq > 0 )
	   text(ht[i]+dx,fi[j]+dy, sub("^0.", ".",toString(smooth.freq)), cex=0.4, col="grey40" )
	   }
	}
 
contour(ht[1:21]+dx, fi[1:41]+dy, sm.fr, add=TRUE, drawlabels=FALSE, col="grey60")
text(6.05,11, "Smoothed bin\nfrequencies", adj=c(0.5,1), col="grey40", cex=0.85) ;
par(op)

############################################################
## Sampling distributions of sample sd (s) and z=(ybar-mu)/s
############################################################

# note that Gosset used a divisor of n (not n-1) to get the sd.
# He also used Sheppard's correction for the 'binning' or grouping.
# with concatenated height measurements...

mu <- mean(heights) ; sigma <- sqrt( 3000 * var(heights)/2999 )
c(mu,sigma)

# 750 samples of size n=4 (as Gosset did)

# see Student's z, t, and s: What if Gosset had R? 
# [Hanley J, Julien M, and Moodie E. The American Statistician, February 2008] 

# see also the photographs from Student's notebook ('Original small sample data and notes")
# under the link "Gosset' 750 samples of size n=4" 
# on website http://www.biostat.mcgill.ca/hanley/Student/
# and while there, look at the cover of the Notebook containing his yeast-cell counts
# (Biometrika 1907) and decide for yourself why Gosset, when forced to write under a 
# pen-name, might have taken the name he did!

# PS: Can you figure out what the 750 pairs of numbers signify?
# hint: look again at the numbers of rows and columns in Macdonell's (frequency) Table III.


n <- 4
Nsamples <- 750

y.bar.values <- s.over.sigma.values <- z.values <- c()
for (samp in 1:Nsamples) {
	y <- sample(heights,n)
	y.bar <- mean(y)
	s  <-  sqrt( (n/(n-1))*var(y) ) 
	z <- (y.bar-mu)/s
	y.bar.values <- c(y.bar.values,y.bar) 
	s.over.sigma.values <- c(s.over.sigma.values,s/sigma)
	z.values <- c(z.values,z)
	}

windows()	
op <- par(mfrow=c(2,2),mar=c(2.5,2.5,2.5,2.5),oma=c(2,2,0,0))
# sampling distributions
hist(heights,breaks=seq(4.5,6.5,1/12), main="Histogram of heights (N=3000)")
hist(y.bar.values, main=paste("Histogram of y.bar (n=",n,")",sep=""))

hist(s.over.sigma.values,breaks=seq(0,4,0.1),
	main=paste("Histogram of s/sigma (n=",n,")",sep="")); 
z=seq(-5,5,0.25)+0.125
hist(z.values,breaks=z-0.125, main="Histogram of z=(ybar-mu)/s")
# theoretical
lines(z, 750*0.25*sqrt(n-1)*dt(sqrt(n-1)*z,3), col="red", lwd=1)
par(op)

}
\keyword{datasets}
