\name{Quarrels}
\Rdversion{1.1}
\alias{Quarrels}
\docType{data}
\title{
Statistics of Deadly Quarrels
}
\description{
\emph{The Statistics Of Deadly Quarrels} by                            
Lewis Fry Richardson (1960) is one of the earlier attempts                   
at quantification of historical conflict behavior.                    

The data set contains 779 dyadic deadly quarrels that cover a             
time period from 1809 to 1949.  A quarrel consists of one             
pair of belligerents, and is identified by its
beginning date and magnitude (log 10 of the number of deaths).
Neither actor in a quarrel is identified by name.

Because Richardson took a dyad of belligerents as his unit,
a given war, such as World War I or World War II comprises
multiple observations, for all pairs of belligerents. 
For example, there are forty-four pairs of belligerents coded for              
World War I.

For each quarrel, the nominal variables
include the type of quarrel, as well as political, cultural, and economic
similarities and dissimilarities between the pair of combatants.

}
\usage{data(Quarrels)}
\format{
  A data frame with 779 observations on the following 84 variables.
  \describe{
    \item{\code{ID }}{Id sequence }
    \item{\code{year }}{Begin date of quarrel }
    \item{\code{international }}{Nation vs nation }
    \item{\code{colonial }}{Nation vs colony }
    \item{\code{revolution }}{Revolution or civil war }
    \item{\code{nat.grp }}{Nation vs gp in other nation }
    \item{\code{grp.grpSame }}{Grp vs grp (same nation) }
    \item{\code{grp.grpDif }}{Grp vs grp (between nations) }
    \item{\code{numGroups }}{Num grps agst which fighting }
    \item{\code{months }}{Num months fighting }
    \item{\code{pairs }}{Num pairs in whole matrix }
    \item{\code{monthsPairs }}{Num mons for all in mtrx }
    \item{\code{logDeaths }}{Log (killed) matrix }
    \item{\code{deaths }}{Total killed for matrix }
    \item{\code{exchangeGoods }}{Gp sent goods to other }
    \item{\code{obstacleGoods }}{Gp puts obstacles to goods }
    \item{\code{intermarriageOK }}{Present intermarriages }
    \item{\code{intermarriageBan }}{Intermarriages banned }
    \item{\code{simBody }}{Similar body characteristics }
    \item{\code{difBody }}{Difference in body characteristics }
    \item{\code{simDress }}{Similarity of customs (dress) }
    \item{\code{difDress }}{Difference of customs (dress) }
    \item{\code{eqWealth }}{Common level of wealth }
    \item{\code{difWealth }}{Difference in wealth }
    \item{\code{simMariagCust }}{Similar marriage cusomst }
    \item{\code{difMariagCust }}{Different marriage customs }
    \item{\code{simRelig }}{Similar religeon or philosophy of life }
    \item{\code{difRelig }}{Religeon or philisophy felt different }
    \item{\code{philanthropy }}{General philanthropy }
    \item{\code{restrictMigration }}{Restricted immigrations }
    \item{\code{sameLanguage }}{Common mother tongue }
    \item{\code{difLanguage }}{Different languages }
    \item{\code{simArtSci }}{Similar science, arts }
    \item{\code{travel }}{Travel }
    \item{\code{ignorance }}{Ignorant of other/both }
    \item{\code{simPersLiberty }}{Personal liberty similar }
    \item{\code{difPersLiberty }}{More personal liberty }
    \item{\code{sameGov }}{Common government }
    \item{\code{sameGovYrs }}{Years since common govt established }
    \item{\code{prevConflict }}{Belligerents fought previously }
    \item{\code{prevConflictYrs }}{Years since belligerents fought }
    \item{\code{chronicFighting }}{Chronic figthing between belligerents }
    \item{\code{persFriendship }}{Autocrats personal friends }
    \item{\code{persResentment }}{Leaders personal resentment }
    \item{\code{difLegal }}{Annoyingly different legal systems }
    \item{\code{nonintervention }}{Policy of nonintervention }
    \item{\code{thirdParty }}{Led by 3rd group to conflict }
    \item{\code{supportEnemy }}{Supported others enemy }
    \item{\code{attackAlly }}{Attacked ally of other }
    \item{\code{rivalsLand }}{Rivals territory concess }
    \item{\code{rivalsTrade }}{Rivals trade }
    \item{\code{churchPower }}{Church civil power }
    \item{\code{noExtension }}{Policy not extending ter }
    \item{\code{territory }}{Desired territory }
    \item{\code{habitation }}{Wanted habitation }
    \item{\code{minerals }}{Desired minerals }
    \item{\code{StrongHold }}{Wanted strategic stronghold }
    \item{\code{taxation }}{Taxed other }
    \item{\code{loot }}{Wanted loot }
    \item{\code{objectedWar }}{Objected to war }
    \item{\code{enjoyFight }}{Enjoyed fighting }
    \item{\code{pride }}{Elated by strong pride }
    \item{\code{overpopulated }}{Insufficient land for population }
    \item{\code{fightForPay }}{Fought only for pay }
    \item{\code{joinWinner }}{Desired to join winners }
    \item{\code{otherDesiredWar }}{Quarrel desired by other }
    \item{\code{propaganda3rd }}{Issued of propaganda to third parties }
    \item{\code{protection }}{Offered protection }
    \item{\code{sympathy }}{Sympathized under control }
    \item{\code{debt }}{Owed money to others }
    \item{\code{prevAllies }}{Had fought as allies }
    \item{\code{yearsAllies }}{Years since fought as allies }
    \item{\code{intermingled }}{Had intermingled on territory }
    \item{\code{interbreeding }}{Interbreeding between groups }
    \item{\code{propadanda }}{Issued propaganda to other group }
    \item{\code{orderedObey }}{Ordered other to obey }
    \item{\code{commerceOther }}{Commercial enterprises }
    \item{\code{feltStronger }}{Felt stronger }
    \item{\code{competeIntellect }}{Competed succesfully intellectual occ }
    \item{\code{insecureGovt }}{Government insecure }
    \item{\code{prepWar }}{Preparations for war }
    \item{\code{RegionalError }}{Regional error measure }
    \item{\code{CasualtyError }}{Casualty error measure }
    \item{\code{Auxiliaries }}{Auxiliaries in service of nation at war }
  }
}
\details{
In the original data set obtained from ICPSR, variables were
named \code{V1}-\code{V84}.  These were renamed to make them more
meaningful. \code{V84}, renamed \code{ID} was moved to the first position,
but otherwise the order of variables is the same.

In many of the \code{factor} variables, \code{0} is used to indicate
"irrelevant to quarrel".  This refers to those relations that              
Richardson found absent or irrelevant to the particular               
quarrel, and did not subsequently mention.                            

See the original codebook at
\url{http://www.icpsr.umich.edu/cgi-bin/file?comp=none&study=5407&ds=1&file_id=652814}
for details not contained here.

}
\source{
\url{http://www.icpsr.umich.edu/icpsrweb/ICPSR/studies/05407}
}
\references{
Lewis F. Richardson, (1960).
\emph{The Statistics Of Deadly Quarrels}.  Boxwood Press.                    

}
\examples{
data(Quarrels)
str(Quarrels)
}
\keyword{datasets}
