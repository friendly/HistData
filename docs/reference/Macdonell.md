# Macdonell's Data on Height and Finger Length of Criminals, used by Gosset (1908)

In the second issue of *Biometrika*, W. R. Macdonell (1902) published an
extensive paper, *On Criminal Anthropometry and the Identification of
Criminals* in which he included numerous tables of physical
characteristics 3000 non-habitual male criminals serving their sentences
in England and Wales. His Table III (p. 216) recorded a bivariate
frequency distribution of `height` by `finger` length. His main purpose
was to show that Scotland Yard could have indexed their material more
efficiently, and find a given profile more quickly.

W. S. Gosset (aka "Student") used these data in two classic papers in
1908, in which he derived various characteristics of the sampling
distributions of the mean, standard deviation and Pearson's r. He said,
"Before I had succeeded in solving my problem analytically, I had
endeavoured to do so empirically." Among his experiments, he randomly
shuffled the 3000 observations from Macdonell's table, and then grouped
them into samples of size 4, 8, ..., calculating the sample means,
standard deviations and correlations for each sample.

## Usage

``` r
data(Macdonell)
data(MacdonellDF)
```

## Format

`Macdonell`: A frequency data frame with 924 observations on the
following 3 variables giving the bivariate frequency distribution of
`height` and `finger`.

- `height`:

  lower class boundaries of height, in decimal ft.

- `finger`:

  length of the left middle finger, in mm.

- `frequency`:

  frequency of this combination of `height` and `finger`

`MacdonellDF`: A data frame with 3000 observations on the following 2
variables.

- `height`:

  a numeric vector

- `finger`:

  a numeric vector

## Details

Class intervals for `height` in Macdonell's table were given in 1 in.
ranges, from (4' 7" 9/16 - 4' 8" 9/16), to (6' 4" 9/16 - 6' 5" 9/16).
The values of `height` are taken as the lower class boundaries.

For convenience, the data frame `MacdonellDF` presents the same data, in
expanded form, with each combination of `height` and `finger` replicated
`frequency` times.

## Source

Macdonell, W. R. (1902). On Criminal Anthropometry and the
Identification of Criminals. *Biometrika*, 1(2), 177-227.
[doi:10.1093/biomet/1.2.177](https://doi.org/10.1093/biomet/1.2.177)

The data used here were obtained from:

Hanley, J. (2008). Macdonell data used by Student.
<http://www.medicine.mcgill.ca/epidemiology/hanley/Student/>

## References

Hanley, J. and Julien, M. and Moodie, E. (2008). Student's z, t, and s:
What if Gosset had R? *The American Statistician*, 62(1), 64-69.

Gosset, W. S. \[Student\] (1908). Probable error of a mean.
*Biometrika*, 6(1), 1-25.
<https://www.york.ac.uk/depts/maths/histstat/student.pdf>

Gosset, W. S. \[Student\] (1908). Probable error of a correlation
coefficient. *Biometrika*, 6, 302-310.

## Examples

``` r
data(Macdonell)

# display the frequency table
xtabs(frequency ~ finger+round(height,3), data=Macdonell)
#>       round(height, 3)
#> finger 4.63 4.714 4.797 4.88 4.964 5.047 5.13 5.214 5.297 5.38 5.464 5.547 5.63
#>   9.4     0     0     0    0     0     0    0     0     0    0     0     0    0
#>   9.5     0     0     0    0     0     1    0     0     0    0     0     0    0
#>   9.6     0     0     0    0     0     0    0     0     0    0     0     0    0
#>   9.7     0     0     0    0     0     0    0     0     0    0     0     0    0
#>   9.8     0     0     0    0     0     0    1     0     0    0     0     0    0
#>   9.9     0     0     1    0     1     0    1     0     0    0     0     0    0
#>   10      1     0     0    1     2     0    2     0     0    1     0     0    0
#>   10.1    0     0     0    1     3     1    0     1     1    0     0     0    0
#>   10.2    0     0     2    2     2     1    0     2     0    1     0     0    0
#>   10.3    0     1     1    3     2     2    3     5     0    0     0     0    0
#>   10.4    0     0     1    1     2     3    3     4     3    3     0     0    0
#>   10.5    0     0     0    1     3     7    6     4     3    1     3     1    0
#>   10.6    0     0     0    1     4     5    9    14     6    3     1     0    0
#>   10.7    0     0     1    2     4     9   14    16    15    7     3     1    2
#>   10.8    0     0     0    2     5     6   14    27    10    7     1     2    1
#>   10.9    0     0     0    0     2     6   14    24    27   14    10     4    1
#>   11      0     0     0    2     6    12   15    31    37   27    17    10    6
#>   11.1    0     0     0    3     3    12   22    26    24   26    24     7    4
#>   11.2    0     0     0    3     2     7   21    30    38   29    27    20    4
#>   11.3    0     0     0    1     0     5   10    24    26   39    26    24    7
#>   11.4    0     0     0    0     3     4    9    29    56   58    26    22   10
#>   11.5    0     0     0    0     0     5   11    17    33   57    38    34   25
#>   11.6    0     0     0    0     2     1    4    13    37   39    48    38   27
#>   11.7    0     0     0    0     0     2    9    17    30   37    48    45   24
#>   11.8    0     0     0    0     1     0    2    11    15   35    41    34   29
#>   11.9    0     0     0    0     1     1    2    12    10   27    32    35   19
#>   12      0     0     0    0     0     0    1     4     8   19    42    39   22
#>   12.1    0     0     0    0     0     0    0     2     4   13    22    28   15
#>   12.2    0     0     0    0     0     0    1     2     5    6    23    17   16
#>   12.3    0     0     0    0     0     0    0     0     4    8    10    13   20
#>   12.4    0     0     0    0     0     0    1     1     1    2     7    12    4
#>   12.5    0     0     0    0     0     0    0     1     0    1     3    12   11
#>   12.6    0     0     0    0     0     0    0     0     0    1     0     3    5
#>   12.7    0     0     0    0     0     0    0     0     0    1     1     7    5
#>   12.8    0     0     0    0     0     0    0     0     0    0     1     2    3
#>   12.9    0     0     0    0     0     0    0     0     0    0     0     1    2
#>   13      0     0     0    0     0     0    0     0     0    0     3     0    1
#>   13.1    0     0     0    0     0     0    0     0     0    0     0     1    1
#>   13.2    0     0     0    0     0     0    0     0     0    0     1     1    0
#>   13.3    0     0     0    0     0     0    0     0     0    0     0     0    0
#>   13.4    0     0     0    0     0     0    0     0     0    0     0     0    0
#>   13.5    0     0     0    0     0     0    0     0     0    0     0     0    0
#>       round(height, 3)
#> finger 5.714 5.797 5.88 5.964 6.047 6.13 6.214 6.297 6.38
#>   9.4      0     0    0     0     0    0     0     0    0
#>   9.5      0     0    0     0     0    0     0     0    0
#>   9.6      0     0    0     0     0    0     0     0    0
#>   9.7      0     0    0     0     0    0     0     0    0
#>   9.8      0     0    0     0     0    0     0     0    0
#>   9.9      0     0    0     0     0    0     0     0    0
#>   10       0     0    0     0     0    0     0     0    0
#>   10.1     0     0    0     0     0    0     0     0    0
#>   10.2     0     0    0     0     0    0     0     0    0
#>   10.3     0     0    0     0     0    0     0     0    0
#>   10.4     0     0    0     0     0    0     0     0    0
#>   10.5     1     0    0     0     0    0     0     0    0
#>   10.6     1     0    0     0     0    0     0     0    0
#>   10.7     0     0    0     0     0    0     0     0    0
#>   10.8     0     0    0     0     0    0     0     0    0
#>   10.9     0     0    0     0     0    0     0     0    0
#>   11       0     0    0     0     0    0     0     0    0
#>   11.1     1     0    0     0     0    0     0     0    0
#>   11.2     1     0    0     0     0    0     0     0    1
#>   11.3     2     0    0     0     0    0     0     0    0
#>   11.4    11     0    0     0     0    0     0     0    0
#>   11.5    11     2    0     0     0    0     0     0    0
#>   11.6    12     2    2     0     1    0     0     0    0
#>   11.7     9     9    2     0     0    0     0     0    0
#>   11.8    10     5    1     0     0    0     0     0    0
#>   11.9    10     9    3     1     0    0     0     0    0
#>   12      16     8    2     2     0    0     0     0    0
#>   12.1    27    10    4     1     0    0     0     0    0
#>   12.2    11     8    1     1     0    0     0     0    0
#>   12.3    23     6    5     0     0    0     0     0    0
#>   12.4     7     7    1     0     0    1     0     0    0
#>   12.5     8     6    8     0     2    0     0     0    0
#>   12.6     7     8    6     3     1    1     0     0    0
#>   12.7     5     8    2     2     0    0     0     0    0
#>   12.8     1     8    5     3     1    1     0     0    0
#>   12.9     2     0    1     1     0    0     0     0    0
#>   13       0     1    0     2     1    0     0     0    0
#>   13.1     0     0    0     0     0    0     0     0    0
#>   13.2     1     0    3     0     0    0     0     0    0
#>   13.3     0     0    0     1     0    1     0     0    0
#>   13.4     0     0    0     0     0    0     0     0    0
#>   13.5     0     0    0     0     1    0     0     0    0

## Some examples by james.hanley@mcgill.ca    October 16, 2011
## http://www.biostat.mcgill.ca/hanley/
## See:  http://www.biostat.mcgill.ca/hanley/Student/

###############################################
##  naive contour plots of height and finger ##
###############################################
 
# make a 22 x 42 table
attach(Macdonell)
ht <- unique(height) 
fi <- unique(finger)
fr <- t(matrix(frequency, nrow=42))
detach(Macdonell)


dev.new(width=10, height=5)  # make plot double wide
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
# [Galton had experience with plotting isobars for meteorological data]
# it was the smoothed plot that made him remember his 'conic sections'
# and ask a mathematician to work out for him the iso-density
# contours of a bivariate Gaussian distribution... 

dx <- 0.5/12; dy <- 0.05  ; # shifts caused by averaging

plot(ht,ht,xlim=c(min(ht),max(ht)),ylim=c(min(fi),max(fi)), xlab="", ylab="", type="n"  )
 
sm.fr <- matrix(rep(0,21*41),nrow <- 21)
for(i in 1:21) {
  for (j in 1:41) {
     smooth.freq  <-  (1/4) * sum( fr[i:(i+1), j:(j+1)] ) 
     sm.fr[i,j]  <-  smooth.freq
     if(smooth.freq > 0 )
     text(ht[i]+dx, fi[j]+dy, sub("^0.", ".",toString(smooth.freq)), cex=0.4, col="grey40" )
     }
  }
 
contour(ht[1:21]+dx, fi[1:41]+dy, sm.fr, add=TRUE, drawlabels=FALSE, col="grey60")
text(6.05,11, "Smoothed bin\nfrequencies", adj=c(0.5,1), col="grey40", cex=0.85) ;
par(op)
dev.new()    # new default device

#######################################
## bivariate kernel density estimate
#######################################

if(require(KernSmooth)) {
MDest <- bkde2D(MacdonellDF, bandwidth=c(1/8, 1/8))
contour(x=MDest$x1, y=MDest$x2, z=MDest$fhat,
  xlab="Height (feet)", ylab="Finger length (cm)", col="red", lwd=2)
with(MacdonellDF, points(jitter(height), jitter(finger), cex=0.5))
}
#> Loading required package: KernSmooth
#> KernSmooth 2.23 loaded
#> Copyright M. P. Wand 1997-2009

#############################################################
## sunflower plot of height and finger with data ellipses  ##
#############################################################

with(MacdonellDF, 
  {
  sunflowerplot(height, finger, size=1/12, seg.col="green3",
    xlab="Height (feet)", ylab="Finger length (cm)")
  reg <- lm(finger ~ height)
  abline(reg, lwd=2)
  if(require(car)) {
  dataEllipse(height, finger, plot.points=FALSE, levels=c(.40, .68, .95))
    }
  })


############################################################
## Sampling distributions of sample sd (s) and z=(ybar-mu)/s
############################################################

# note that Gosset used a divisor of n (not n-1) to get the sd.
# He also used Sheppard's correction for the 'binning' or grouping.
# with concatenated height measurements...

mu <- mean(heights) ; sigma <- sqrt( 3000 * var(heights)/2999 )
c(mu,sigma)
#> [1] 5.4196250 0.2131819

# 750 samples of size n=4 (as Gosset did)

# see Student's z, t, and s: What if Gosset had R? 
# [Hanley J, Julien M, and Moodie E. The American Statistician, February 2008] 

# see also the photographs from Student's notebook ('Original small sample data and notes")
# under the link "Gosset' 750 samples of size n=4" 
# on website http://www.biostat.mcgill.ca/hanley/Student/
# and while there, look at the cover of the Notebook containing his yeast-cell counts
# http://www.medicine.mcgill.ca/epidemiology/hanley/Student/750samplesOf4/Covers.JPG
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

#####################################################
## Chisquare probability plot for bivariate normality
#####################################################

mu <- colMeans(MacdonellDF)
sigma <- var(MacdonellDF)
Dsq <- mahalanobis(MacdonellDF, mu, sigma)

Q <- qchisq(1:3000/3000, 2)
plot(Q, sort(Dsq), xlab="Chisquare (2) quantile", ylab="Squared distance")
abline(a=0, b=1, col="red", lwd=2)


```
