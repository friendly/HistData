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
    \item{\code{ID }}{V84: Id sequence }
    \item{\code{year }}{V1: Begin date of quarrel }
    \item{\code{international }}{V2: Nation vs nation }
    \item{\code{colonial }}{V3: Nation vs colony }
    \item{\code{revolution }}{V4: Revolution or civil war }
    \item{\code{nat.grp }}{V5: Nation vs gp in other nation }
    \item{\code{grp.grpSame }}{V6: Grp vs grp (same nation) }
    \item{\code{grp.grpDif }}{V7: Grp vs grp (between nations) }
    \item{\code{numGroups }}{V8: Num grps agst which fighting }
    \item{\code{months }}{V9: Num months fighting }
    \item{\code{pairs }}{V10: Num pairs in whole matrix }
    \item{\code{monthsPairs }}{V11: Num mons for all in mtrx }
    \item{\code{logDeaths }}{V12: Log (killed) matrix }
    \item{\code{deaths }}{V13: Total killed for matrix }
    \item{\code{exchangeGoods }}{V14: Gp sent goods to other }
    \item{\code{obstacleGoods }}{V15: Gp puts obstacles to goods }
    \item{\code{intermarriageOK }}{V16: Present intermarriages }
    \item{\code{intermarriageBan }}{V17: Intermarriages banned }
    \item{\code{simBody }}{V18: Similar body characteristics }
    \item{\code{difBody }}{V19: Difference in body characteristics }
    \item{\code{simDress }}{V20: Similarity of customs (dress) }
    \item{\code{difDress }}{V21: Difference of customs (dress) }
    \item{\code{eqWealth }}{V22: Common level of wealth }
    \item{\code{difWealth }}{V23: Difference in wealth }
    \item{\code{simMariagCust }}{V24: Similar marriage cusomst }
    \item{\code{difMariagCust }}{V25: Different marriage customs }
    \item{\code{simRelig }}{V26: Similar religeon or philosophy of life }
    \item{\code{difRelig }}{V27: Religeon or philisophy felt different }
    \item{\code{philanthropy }}{V28: General philanthropy }
    \item{\code{restrictMigration }}{V29: Restricted immigrations }
    \item{\code{sameLanguage }}{V30: Common mother tongue }
    \item{\code{difLanguage }}{V31: Different languages }
    \item{\code{simArtSci }}{V32: Similar science, arts }
    \item{\code{travel }}{V33: Travel }
    \item{\code{ignorance }}{V34: Ignorant of other/both }
    \item{\code{simPersLiberty }}{V35: Personal liberty similar }
    \item{\code{difPersLiberty }}{V36: More personal liberty }
    \item{\code{sameGov }}{V37: Common government }
    \item{\code{sameGovYrs }}{V38: Years since common govt established }
    \item{\code{prevConflict }}{V39: Belligerents fought previously }
    \item{\code{prevConflictYrs }}{V40: Years since belligerents fought }
    \item{\code{chronicFighting }}{V41: Chronic figthing between belligerents }
    \item{\code{persFriendship }}{V42: Autocrats personal friends }
    \item{\code{persResentment }}{V43: Leaders personal resentment }
    \item{\code{difLegal }}{V44: Annoyingly different legal systems }
    \item{\code{nonintervention }}{V45: Policy of nonintervention }
    \item{\code{thirdParty }}{V46: Led by 3rd group to conflict }
    \item{\code{supportEnemy }}{V47: Supported others enemy }
    \item{\code{attackAlly }}{V48: Attacked ally of other }
    \item{\code{rivalsLand }}{V49: Rivals territory concess }
    \item{\code{rivalsTrade }}{V50: Rivals trade }
    \item{\code{churchPower }}{V51: Church civil power }
    \item{\code{noExtension }}{V52: Policy not extending ter }
    \item{\code{territory }}{V53: Desired territory }
    \item{\code{habitation }}{V54: Wanted habitation }
    \item{\code{minerals }}{V55: Desired minerals }
    \item{\code{StrongHold }}{V56: Wanted strategic stronghold }
    \item{\code{taxation }}{V57: Taxed other }
    \item{\code{loot }}{V58: Wanted loot }
    \item{\code{objectedWar }}{V59: Objected to war }
    \item{\code{enjoyFight }}{V60: Enjoyed fighting }
    \item{\code{pride }}{V61: Elated by strong pride }
    \item{\code{overpopulated }}{V62: Insufficient land for population }
    \item{\code{fightForPay }}{V63: Fought only for pay }
    \item{\code{joinWinner }}{V64: Desired to join winners }
    \item{\code{otherDesiredWar }}{V65: Quarrel desired by other }
    \item{\code{propaganda3rd }}{V66: Issued of propaganda to third parties }
    \item{\code{protection }}{V67: Offered protection }
    \item{\code{sympathy }}{V68: Sympathized under control }
    \item{\code{debt }}{V69: Owed money to others }
    \item{\code{prevAllies }}{V70: Had fought as allies }
    \item{\code{yearsAllies }}{V71: Years since fought as allies }
    \item{\code{intermingled }}{V72: Had intermingled on territory }
    \item{\code{interbreeding }}{V73: Interbreeding between groups }
    \item{\code{propadanda }}{V74: Issued propaganda to other group }
    \item{\code{orderedObey }}{V75: Ordered other to obey }
    \item{\code{commerceOther }}{V76: Commercial enterprises }
    \item{\code{feltStronger }}{V77: Felt stronger }
    \item{\code{competeIntellect }}{V78: Competed succesfully intellectual occ }
    \item{\code{insecureGovt }}{V79: Government insecure }
    \item{\code{prepWar }}{V80: Preparations for war }
    \item{\code{RegionalError }}{V81: Regional error measure }
    \item{\code{CasualtyError }}{V82: Casualty error measure }
    \item{\code{Auxiliaries }}{V83: Auxiliaries in service of nation at war }
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
\emph{The Statistics Of Deadly Quarrels}. (Edited by Q. Wright and C. C. Lienau). 
 Pittsburgh: Boxwood Press.  
                 
Rummel, Rudolph J. (1967), "Dimensions of Dyadic War, 1820-1952." \emph{Journal of
Conflict Resolution}. 11, (2), 176 - 183.
}
\examples{
data(Quarrels)
str(Quarrels)
}
\keyword{datasets}
