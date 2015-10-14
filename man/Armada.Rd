\name{Armada}
\alias{Armada}
\docType{data}
\title{
La Felicisima Armada
}
\description{
The Spanish Armada (Spanish: \emph{Grande y Felicisima Armada}, literally "Great and Most Fortunate Navy") was a Spanish fleet of 130 ships 
that sailed from La Coruna in August 1588.
During its preparation, several accounts of its formidable strength
were circulated to reassure allied powers of Spain or to intimidate its enemies.
One such account was given by Paz Salas et Alvarez (1588).
The intent was bring the forces of Spain to invade England, overthrow
Queen Elizabeth I, and re-establish Spanish control of the Netherlands.
However the Armada
was not as fortunate as hoped: it was all destroyed in one week's fighting.

de Falguerolles (2008) reports the table given here as \code{Armada}
as an early example of data to which multivariate methods might be applied.
}
\usage{data("Armada")}
\format{
  A data frame with 10 observations on the following 11 variables.
  \describe{
    \item{\code{Armada}}{designation of the fleet, a factor with levels \code{Andalucia} \code{Castilla} \code{Galeras} \code{Guipuscua} \code{Napoles} \code{Pataches} \code{Portugal} \code{Uantiscas} \code{Vizca} \code{Vrcas}}
    \item{\code{ships}}{number of ships, a numeric vector}
    \item{\code{tons}}{total tons, a numeric vector}
    \item{\code{soldiers}}{number of soldiers, a numeric vector}
    \item{\code{sailors}}{number of sailors, a numeric vector}
    \item{\code{men}}{total of soldiers plus sailors, a numeric vector}
    \item{\code{artillery}}{a numeric vector}
    \item{\code{balls}}{a numeric vector}
    \item{\code{gunpowder}}{a numeric vector}
    \item{\code{lead}}{a numeric vector}
    \item{\code{rope}}{a numeric vector}
  }
}
\details{
Note that \code{men = soldiers + sailors}
}
\source{
de Falguerolles, A. (2008)
L'analyse des donnees; before and around.
\emph{Journal Electronique  d'Histoire des
Probabilites et de la Statistique},
4 (2),
\url{www.jehps.net/Decembre2008/Falguerolles.pdf}
}
\references{
Pedro de Paz Salas and Antonio Alvares. La felicissima armada que elrey Don
Felipe nuestro Senor mando juntar enel puerto de la ciudad de Lisboa enel Reyno
de Portugal. Lisbon, 1588.
}
\examples{
data(Armada)
# delete character and redundant variable
armada <- Armada[,-c(1,6)]

armada.pca <- prcomp(armada, scale.=TRUE)
summary(armada.pca)

plot(armada.pca, type="lines", pch=16, cex=2)
biplot(armada.pca)
}
\keyword{datasets}
