\name{Macdonell}
\Rdversion{1.1}
\alias{Macdonell}
\docType{data}
\title{
Macdonell's data on height and finger length of criminals, used by Gosset (1908)
}
\description{
In the second issue of \emph{Biometrika}, W. R. Macdonell (1902) published an extensive
paper, \emph{On Criminal Anthropometry and the Identification of Criminals}
in which he included numerous tables of physical characteristics 3000 non-habitual 
male criminals serving their sentences in England and Wales.  His Table III (p. 216)
recorded a bivariate frequency distribution of \code{height} by \code{finger} length.

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
## maybe str(Macdonell) ; plot(Macdonell) ...

# display the frequency table
xtabs(frequency ~ finger+round(height,3), data=Macdonell)

}
\keyword{datasets}
