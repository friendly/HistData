pkgname <- "UsingR"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('UsingR')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("BushApproval")
### * BushApproval

flush(stderr()); flush(stdout())

### Name: BushApproval
### Title: U.S. President George Bush approval ratings
### Aliases: BushApproval
### Keywords: datasets

### ** Examples

data(BushApproval)
attach(BushApproval)

## Plot data with confidence intervals. Each poll gets different line type
## no points at first
plot(strptime(date,"%m/%d/%y"),approval,type="n",
     ylab = "Approval Rating",xlab="Date",
     ylim=c(30,100)
     )

## plot line for CI. Margin or error about 3
## matlines has trouble with dates from strptime()
colors = rainbow(6)

for(i in 1:nrow(BushApproval)) {
  lines(rep(strptime(date[i],"%m/%d/%y"),2),
        c(approval[i]-3,approval[i]+3),
        lty=as.numeric(who[i]),
        col=colors[as.numeric(who[i])]
        )
  
}

## plot points
points(strptime(date,"%m/%d/%y"),approval,pch=as.numeric(who))

## add legend
legend((2003-1970)*365*24*60*60,90,legend=as.character(levels(who)),lty=1:6,col=1:6)
detach(BushApproval)



cleanEx()
nameEx("DOTplot")
### * DOTplot

flush(stderr()); flush(stdout())

### Name: DOTplot
### Title: Make big DOT plot likestripchart
### Aliases: DOTplot DOTplot.default DOTplot.formula DOTplt DOTplot.formula
### Keywords: hplot

### ** Examples

x = c(1,1,2,3,5,8)
DOTplot(x,main="Fibonacci",cex=2)



cleanEx()
nameEx("DensityPlot")
### * DensityPlot

flush(stderr()); flush(stdout())

### Name: DensityPlot
### Title: Plots densities of data
### Aliases: DensityPlot DensityPlot.default DensityPlot.formula
### Keywords: multivariate

### ** Examples

## taken from boxplot
## using a formula
data(InsectSprays)
DensityPlot(count ~ spray, data = InsectSprays)
## on a matrix (data frame)
mat <- cbind(Uni05 = (1:100)/21, Norm = rnorm(100),
             T5 = rt(100, df = 5), Gam2 = rgamma(100, shape = 2))
DensityPlot(data.frame(mat))





cleanEx()
nameEx("HUMMER")
### * HUMMER

flush(stderr()); flush(stdout())

### Name: HUMMER
### Title: Deliveries of new HUMMER vehicles
### Aliases: HUMMER
### Keywords: datasets

### ** Examples

data(HUMMER)
plot(HUMMER)



cleanEx()
nameEx("KSI")
### * KSI

flush(stderr()); flush(stdout())

### Name: KSI
### Title: Data set on automobile deaths and injuries in Great Britain
### Aliases: KSI
### Keywords: datasets

### ** Examples

data(KSI)
plot(KSI)
seatbelt = time(KSI) < 1983 + (2-1)/12




cleanEx()
nameEx("MLBattend")
### * MLBattend

flush(stderr()); flush(stdout())

### Name: MLBattend
### Title: Major league baseball attendance data
### Aliases: MLBattend
### Keywords: datasets

### ** Examples

data(MLBattend)
boxplot(attendance ~ franchise, MLBattend)
with(MLBattend, cor(attendance,wins))



cleanEx()
nameEx("Medicare")
### * Medicare

flush(stderr()); flush(stdout())

### Name: Medicare
### Title: Sample from "Medicare Provider Charge Data"
### Aliases: Medicare
### Keywords: datasets

### ** Examples

data(Medicare)



cleanEx()
nameEx("OBP")
### * OBP

flush(stderr()); flush(stdout())

### Name: OBP
### Title: On base percentage for 2002 major league baseball season
### Aliases: OBP
### Keywords: datasets

### ** Examples

data(OBP)
hist(OBP)
OBP[OBP>.5]			# who is better than 50%? (only Barry Bonds)



cleanEx()
nameEx("ObamaApproval")
### * ObamaApproval

flush(stderr()); flush(stdout())

### Name: ObamaApproval
### Title: Approval ratings for President Obama
### Aliases: ObamaApproval
### Keywords: datasets

### ** Examples

data(ObamaApproval)



cleanEx()
nameEx("QQplot")
### * QQplot

flush(stderr()); flush(stdout())

### Name: QQplot
### Title: Creates a qqplot with shaded density estimate
### Aliases: QQplot
### Keywords: misc

### ** Examples


x = rnorm(100)
y = rt(100, df=3)
QQplot(x,y)




cleanEx()
nameEx("SAT")
### * SAT

flush(stderr()); flush(stdout())

### Name: SAT
### Title: SAT data with expenditures
### Aliases: SAT
### Keywords: datasets

### ** Examples

data(SAT)



cleanEx()
nameEx("Split.zoo")
### * Split.zoo

flush(stderr()); flush(stdout())

### Name: Split.zoo
### Title: Add split method for zoo objects
### Aliases: Split.zoo
### Keywords: misc

### ** Examples

if(require(zoo)) {
split.zoo = Split.zoo ## make generic
x = zoo(1:30,1:30)
f = sample(letters[1:5],30, replace=TRUE)
split(x,f)
}



cleanEx()
nameEx("age.universe")
### * age.universe

flush(stderr()); flush(stdout())

### Name: age.universe
### Title: Best estimate of the age of the universe
### Aliases: age.universe
### Keywords: datasets

### ** Examples

data(age.universe)
n <- nrow(age.universe)
x <- 1:n
names(x) = age.universe$year
plot(x,age.universe$upper,ylim=c(0,20))
points(x,age.universe$lower)
with(age.universe,sapply(x,function(i) lines(c(i,i),c(lower[i],upper[i]))))



cleanEx()
nameEx("aid")
### * aid

flush(stderr()); flush(stdout())

### Name: aid
### Title: monthly payment for federal program
### Aliases: aid
### Keywords: datasets

### ** Examples

data(aid)
hist(aid)



cleanEx()
nameEx("alaska.pipeline")
### * alaska.pipeline

flush(stderr()); flush(stdout())

### Name: alaska.pipeline
### Title: Comparison of in-field and laboratory measurement of defects
### Aliases: alaska.pipeline
### Keywords: datasets

### ** Examples

data(alaska.pipeline)
res = lm(lab.defect ~ field.defect, alaska.pipeline)
plot(lab.defect ~ field.defect, alaska.pipeline)
abline(res)
plot(fitted(res),resid(res))



cleanEx()
nameEx("alltime.movies")
### * alltime.movies

flush(stderr()); flush(stdout())

### Name: alltime.movies
### Title: Top movies of all time
### Aliases: alltime.movies
### Keywords: datasets

### ** Examples

data(alltime.movies)
hist(alltime.movies$Gross)



cleanEx()
nameEx("answers")
### * answers

flush(stderr()); flush(stdout())

### Name: answers
### Title: Answers to selected problems
### Aliases: answers
### Keywords: utilities

### ** Examples

## answers()



cleanEx()
nameEx("aosat")
### * aosat

flush(stderr()); flush(stdout())

### Name: aosat
### Title: Artic Oscillation data based on SAT data
### Aliases: aosat
### Keywords: datasets

### ** Examples

data(aosat)
## Not run: 
##D library(zoo)
##D z = zoo(aosat[,2], order.by=aosat[,1])
##D plot(z)
##D ## yearly
##D plot(aggregate(z, floor(index(z)), mean))
##D ## decade-long means
##D plot(aggregate(z, 10*floor(index(z)/10), mean))
## End(Not run)



cleanEx()
nameEx("arctic.oscillations")
### * arctic.oscillations

flush(stderr()); flush(stdout())

### Name: arctic.oscillations
### Title: Measurement of sea-level pressure at the arctic
### Aliases: arctic.oscillations
### Keywords: datasets

### ** Examples

data(arctic.oscillations)
x = ts(arctic.oscillations, start=c(1899,1), frequency=12)
plot(x)



cleanEx()
nameEx("babies")
### * babies

flush(stderr()); flush(stdout())

### Name: babies
### Title: Mothers and their babies data
### Aliases: babies
### Keywords: datasets

### ** Examples

data(babies)
plot(wt ~ factor(smoke), data=babies)
plot(wt1 ~ dwt, data=babies, subset=wt1 < 800 & dwt < 800)



cleanEx()
nameEx("babyboom")
### * babyboom

flush(stderr()); flush(stdout())

### Name: babyboom
### Title: Babyboom: data for 44 babies born in one 24-hour period.
### Aliases: babyboom
### Keywords: datasets

### ** Examples

data(babyboom)
hist(babyboom$wt)
hist(diff(babyboom$running.time))



cleanEx()
nameEx("batting")
### * batting

flush(stderr()); flush(stdout())

### Name: batting
### Title: Batting statistics for 2002 baseball season
### Aliases: batting
### Keywords: datasets

### ** Examples

data(batting)
attach(batting)
BA = H/AB			# batting average
OBP = (H + BB + HBP) / (AB + BB + HBP + SF) # On base "percentage"



cleanEx()
nameEx("baycheck")
### * baycheck

flush(stderr()); flush(stdout())

### Name: baycheck
### Title: Population estimate of type of Bay Checkerspot butterfly
### Aliases: baycheck
### Keywords: datasets

### ** Examples

data(baycheck)
plot(Nt ~ year,baycheck)
## fit Ricker model N_{t+1} = N_t e^{-rt}W_t
n = length(baycheck$year)
yt = with(baycheck,log(Nt[-1]/Nt[-n]))
nt = with(baycheck,Nt[-n])
lm(yt ~ nt,baycheck)



cleanEx()
nameEx("best.times")
### * best.times

flush(stderr()); flush(stdout())

### Name: best.times
### Title: Best track and field times by age and distance
### Aliases: best.times
### Keywords: datasets

### ** Examples

data(best.times)
attach(best.times)
by.dist = split(best.times,as.factor(Dist))
lm(scale(Time) ~ age, by.dist[['400']])
dists = names(by.dist)
lapply(dists, function(n) print(lm(scale(Time) ~ age, by.dist[[n]])))



cleanEx()
nameEx("blood")
### * blood

flush(stderr()); flush(stdout())

### Name: blood
### Title: blood pressure readings
### Aliases: blood
### Keywords: datasets

### ** Examples

data(blood)
attach(blood)
t.test(Machine,Expert)
detach(blood)



cleanEx()
nameEx("breakdown")
### * breakdown

flush(stderr()); flush(stdout())

### Name: breakdown
### Title: Time of insulating fluid to breakdown
### Aliases: breakdown
### Keywords: datasets

### ** Examples

data(breakdown)
plot(log(time) ~ voltage, data = breakdown)



cleanEx()
nameEx("bright.stars")
### * bright.stars

flush(stderr()); flush(stdout())

### Name: bright.stars
### Title: List of bright stars with Hipparcos catalog number
### Aliases: bright.stars
### Keywords: datasets

### ** Examples

data(bright.stars)
all.names  = paste(bright.stars$name, sep="", collapse="")
x = unlist(strsplit(tolower(all.names), ""))
letter.dist = sapply(letters, function(i) sum(x == i))
data(scrabble)			#  for frequency info
p = scrabble$frequency[1:26];p=p/sum(p)
chisq.test(letter.dist, p=p)	# compare with English



cleanEx()
nameEx("brightness")
### * brightness

flush(stderr()); flush(stdout())

### Name: brightness
### Title: Brightness of 966 stars
### Aliases: brightness
### Keywords: datasets

### ** Examples

data(brightness)
hist(brightness)



cleanEx()
nameEx("bumpers")
### * bumpers

flush(stderr()); flush(stdout())

### Name: bumpers
### Title: Bumper repair costs for various automobiles
### Aliases: bumpers
### Keywords: datasets

### ** Examples

data(bumpers)
stem(bumpers)



cleanEx()
nameEx("bycatch")
### * bycatch

flush(stderr()); flush(stdout())

### Name: bycatch
### Title: Number of Albatrosses accidentaly caught during a fishing haul
### Aliases: bycatch
### Keywords: datasets

### ** Examples

data(bycatch)
hauls = with(bycatch,rep(no.albatross,no.hauls))



cleanEx()
nameEx("cabinet")
### * cabinet

flush(stderr()); flush(stdout())

### Name: cabinet
### Title: Estimated tax savings for US President Bush's cabinet
### Aliases: cabinet
### Keywords: datasets

### ** Examples

data(cabinet)
attach(cabinet)
median(est.dividend.cg)
mean(est.dividend.cg)
detach(cabinet)



cleanEx()
nameEx("camp")
### * camp

flush(stderr()); flush(stdout())

### Name: camp
### Title: Mount Campito Yearly Treering Data, -3435-1969.
### Aliases: camp
### Keywords: datasets

### ** Examples

data(camp)
acf(camp)



cleanEx()
nameEx("cancer")
### * cancer

flush(stderr()); flush(stdout())

### Name: cancer
### Title: cancer survival times
### Aliases: cancer
### Keywords: datasets

### ** Examples

data(cancer)
boxplot(cancer)



cleanEx()
nameEx("carbon")
### * carbon

flush(stderr()); flush(stdout())

### Name: carbon
### Title: Carbon Monoxide levels at different sites
### Aliases: carbon
### Keywords: datasets

### ** Examples

data(carbon)
boxplot(Monoxide ~ Site,data=carbon)



cleanEx()
nameEx("carsafety")
### * carsafety

flush(stderr()); flush(stdout())

### Name: carsafety
### Title: Fatality information in U.S. for several popular cars
### Aliases: carsafety
### Keywords: datasets

### ** Examples

data(carsafety)
plot(Driver.deaths + Other.deaths ~ type, data = carsafety)
plot(Driver.deaths + Other.deaths ~ type, data = carsafety)



cleanEx()
nameEx("central.park")
### * central.park

flush(stderr()); flush(stdout())

### Name: central.park
### Title: Weather in Central Park NY in May 2003
### Aliases: central.park
### Keywords: datasets

### ** Examples

data(central.park)
attach(central.park)
barplot(rbind(MIN,MAX-MIN),ylim=c(0,80))



cleanEx()
nameEx("central.park.cloud")
### * central.park.cloud

flush(stderr()); flush(stdout())

### Name: central.park.cloud
### Title: Type of day in Central Park, NY May 2003
### Aliases: central.park.cloud
### Keywords: datasets

### ** Examples

data(central.park.cloud)
table(central.park.cloud)



cleanEx()
nameEx("ceo2013")
### * ceo2013

flush(stderr()); flush(stdout())

### Name: ceo2013
### Title: CEO compensation in 2013
### Aliases: ceo2013
### Keywords: datasets

### ** Examples

data(ceo2013)



cleanEx()
nameEx("cfb")
### * cfb

flush(stderr()); flush(stdout())

### Name: cfb
### Title: Bootstrap sample from the Survey of Consumer Finances
### Aliases: cfb
### Keywords: datasets

### ** Examples

data(cfb)
attach(cfb)
mean(INCOME)



cleanEx()
nameEx("chicken")
### * chicken

flush(stderr()); flush(stdout())

### Name: chicken
### Title: weight gain of chickens fed 3 different rations
### Aliases: chicken
### Keywords: datasets

### ** Examples

data(chicken)
boxplot(chicken)



cleanEx()
nameEx("chips")
### * chips

flush(stderr()); flush(stdout())

### Name: chips
### Title: Measurements of chip wafers
### Aliases: chips
### Keywords: datasets

### ** Examples

data(chips)
boxplot(chips)



cleanEx()
nameEx("co2emiss")
### * co2emiss

flush(stderr()); flush(stdout())

### Name: co2emiss
### Title: Carbon Dioxide Emissions from the U.S.A. from fossil fuel
### Aliases: co2emiss
### Keywords: datasets

### ** Examples

data(co2emiss)
monthplot(co2emiss)
stl(co2emiss, s.window="periodic")



cleanEx()
nameEx("coins")
### * coins

flush(stderr()); flush(stdout())

### Name: coins
### Title: The coins in my change bin
### Aliases: coins
### Keywords: datasets

### ** Examples

data(coins)
years = cut(coins$year,seq(1920,2010,by=10),include.lowest=TRUE,
  labels = paste(192:200,"*",sep=""))
table(years)



cleanEx()
nameEx("coldvermont")
### * coldvermont

flush(stderr()); flush(stdout())

### Name: coldvermont
### Title: Daily minimum temperature in Woodstock Vermont
### Aliases: coldvermont
### Keywords: datasets

### ** Examples

data(coldvermont)
plot(coldvermont)



cleanEx()
nameEx("confint.htest")
### * confint.htest

flush(stderr()); flush(stdout())

### Name: confint.htest
### Title: Produce confidence interval for objects of class 'htest'
### Aliases: confint.htest
### Keywords: utilities

### ** Examples

confint(t.test(rnorm(10)))	



cleanEx()
nameEx("corn")
### * corn

flush(stderr()); flush(stdout())

### Name: corn
### Title: Comparison of corn for new and standard variety
### Aliases: corn
### Keywords: datasets

### ** Examples

data(corn)
t.test(corn)



cleanEx()
nameEx("crime")
### * crime

flush(stderr()); flush(stdout())

### Name: crime
### Title: violent crime rates in 50 states of US
### Aliases: crime
### Keywords: datasets

### ** Examples

data(crime)
boxplot(crime)
t.test(crime[,1],crime[,2],paired=TRUE)



cleanEx()
nameEx("deflection")
### * deflection

flush(stderr()); flush(stdout())

### Name: deflection
### Title: Deflection under load
### Aliases: deflection
### Keywords: datasets

### ** Examples

data(deflection)
res = lm(Deflection ~ Load, data = deflection)
plot(Deflection ~ Load, data = deflection)
abline(res)			# looks good?
plot(res)



cleanEx()
nameEx("demos")
### * demos

flush(stderr()); flush(stdout())

### Name: demos
### Title: Provide menu for possible shiny demonstrations
### Aliases: demos
### Keywords: dynamic

### ** Examples

## demos()



cleanEx()
nameEx("diamond")
### * diamond

flush(stderr()); flush(stdout())

### Name: diamond
### Title: Price by size for diamond rings
### Aliases: diamond
### Keywords: datasets

### ** Examples

data(diamond)
plot(price ~ carat, diamond, pch=5)



cleanEx()
nameEx("divorce")
### * divorce

flush(stderr()); flush(stdout())

### Name: divorce
### Title: Time until divorce for divorced women (by age)
### Aliases: divorce
### Keywords: datasets

### ** Examples

data(divorce)
apply(divorce[,2:6],2,sum)	# percent divorced by age of marriage



cleanEx()
nameEx("dottodot")
### * dottodot

flush(stderr()); flush(stdout())

### Name: dottodot
### Title: Dot-to-dot puzzle
### Aliases: dottodot
### Keywords: datasets

### ** Examples

data(dottodot)
# make a blank graph
plot(y~x,data=dottodot,type="n",bty="n",xaxt="n",xlab="",yaxt="n",ylab="")
# add the points
points(y~x,data=dottodot)
# add the labels using pos argument
with(dottodot, text(x,y,labels=ind,pos=pos))
# solve the puzzle
lines(y~x, data=dottodot)



cleanEx()
nameEx("dowdata")
### * dowdata

flush(stderr()); flush(stdout())

### Name: dowdata
### Title: The Dow Jones average from Jan 1999 to October 2000
### Aliases: dowdata
### Keywords: datasets

### ** Examples

data(dowdata)
the.close <- dowdata$Close
n <- length(the.close)
plot(log(the.close[2:n]/the.close[1:(n-1)]))



cleanEx()
nameEx("dvdsales")
### * dvdsales

flush(stderr()); flush(stdout())

### Name: dvdsales
### Title: Monthly DVD player sales since introduction to May 2004
### Aliases: dvdsales
### Keywords: datasets

### ** Examples

data(dvdsales)
barplot(t(dvdsales[7:1,]),beside=TRUE)



cleanEx()
nameEx("emissions")
### * emissions

flush(stderr()); flush(stdout())

### Name: emissions
### Title: CO2 emissions data and gross domestic product for 26 countries
### Aliases: emissions
### Keywords: datasets

### ** Examples

data(emissions)
plot(emissions)



cleanEx()
nameEx("ewr")
### * ewr

flush(stderr()); flush(stdout())

### Name: ewr
### Title: Taxi in and taxi out times at EWR (Newark) airport for 1999-2001
### Aliases: ewr
### Keywords: datasets

### ** Examples

data(ewr)
boxplot(ewr[3:10])



cleanEx()
nameEx("exec.pay")
### * exec.pay

flush(stderr()); flush(stdout())

### Name: exec.pay
### Title: Direct compensation for 199 United States CEOs in the year 2000
### Aliases: exec.pay
### Keywords: datasets

### ** Examples

data(exec.pay)
hist(exec.pay)



cleanEx()
nameEx("fat")
### * fat

flush(stderr()); flush(stdout())

### Name: fat
### Title: Body measurements to predict percentage of body fat in males
### Aliases: fat
### Keywords: datasets

### ** Examples

data(fat)
f = body.fat ~ age + weight + height + BMI + neck + chest + abdomen +
hip + thigh + knee + ankle + bicep + forearm + wrist
res = lm(f, data=fat)
summary(res)



cleanEx()
nameEx("father.son")
### * father.son

flush(stderr()); flush(stdout())

### Name: father.son
### Title: Pearson's data set on heights of fathers and their sons
### Aliases: father.son
### Keywords: datasets

### ** Examples

data(father.son)
## like cover of Freedman, Pisani, and Purves
plot(sheight ~ fheight, data=father.son,bty="l",pch=20)
abline(a=0,b=1,lty=2,lwd=2)
abline(lm(sheight ~ fheight, data=father.son),lty=1,lwd=2)



cleanEx()
nameEx("female.inc")
### * female.inc

flush(stderr()); flush(stdout())

### Name: female.inc
### Title: Income distribution for females in 2001
### Aliases: female.inc
### Keywords: datasets

### ** Examples

data(female.inc)
boxplot(income ~ race, female.inc)
boxplot(log(income,10) ~ race, female.inc)
sapply(with(female.inc,split(income,race)),median)



cleanEx()
nameEx("firstchi")
### * firstchi

flush(stderr()); flush(stdout())

### Name: firstchi
### Title: Age of mother at birth of first child
### Aliases: firstchi
### Keywords: datasets

### ** Examples

data(firstchi)
hist(firstchi)



cleanEx()
nameEx("five.yr.temperature")
### * five.yr.temperature

flush(stderr()); flush(stdout())

### Name: five.yr.temperature
### Title: Five years of weather in New York City
### Aliases: five.yr.temperature
### Keywords: datasets

### ** Examples

data(five.yr.temperature)
attach(five.yr.temperature)
scatter.smooth(temps ~ days,col=gray(.75))
lines(smooth.spline(temps ~ days), lty=2)
lines(supsmu(days, temps), lty=3)



cleanEx()
nameEx("florida")
### * florida

flush(stderr()); flush(stdout())

### Name: florida
### Title: County-by-county results of year 2000 US presidential election
###   in Florida
### Aliases: florida
### Keywords: datasets

### ** Examples

data(florida)
attach(florida)
result.lm <- lm(BUCHANAN ~ BUSH)
plot(BUSH,BUCHANAN)
abline(result.lm) ## can you find Palm Beach and Miami Dade counties?



cleanEx()
nameEx("galileo")
### * galileo

flush(stderr()); flush(stdout())

### Name: galileo
### Title: Galileo data on falling bodies
### Aliases: galileo
### Keywords: datasets

### ** Examples

data(galileo)
polynomial = function(x,coefs) {
  sum = 0
  for(i in 0:(length(coefs)-1)) {
    sum = sum + coefs[i+1]*x^i
  }
  sum
}
res.lm = lm(h.d ~ init.h, data = galileo)
res.lm2 = update(res.lm, . ~ . + I(init.h^2), data=galileo)
res.lm3 = update(res.lm2, . ~ . + I(init.h^3), data=galileo)
plot(h.d ~ init.h, data = galileo)
curve(polynomial(x,coef(res.lm)),add=TRUE)
curve(polynomial(x,coef(res.lm2)),add=TRUE)
curve(polynomial(x,coef(res.lm3)),add=TRUE)




cleanEx()
nameEx("galton")
### * galton

flush(stderr()); flush(stdout())

### Name: galton
### Title: Galton's height data for parents and children
### Aliases: galton
### Keywords: datasets

### ** Examples

data(galton)
plot(galton)
## or with some jitter.
plot(jitter(child,5) ~ jitter(parent,5),galton)
## sunflowerplot shows flowers for multiple plots (Thanks MM)
sunflowerplot(galton)



cleanEx()
nameEx("gap")
### * gap

flush(stderr()); flush(stdout())

### Name: gap
### Title: Sales data for the Gap
### Aliases: gap
### Keywords: datasets

### ** Examples

data(gap)
monthplot(gap)



cleanEx()
nameEx("gasprices")
### * gasprices

flush(stderr()); flush(stdout())

### Name: gasprices
### Title: Monthly average gasoline prices in the United States
### Aliases: gasprices
### Keywords: datasets

### ** Examples

data(gasprices)
plot(gasprices)



cleanEx()
nameEx("goalspergame")
### * goalspergame

flush(stderr()); flush(stdout())

### Name: goalspergame
### Title: Goals per game in NHL
### Aliases: goalspergame
### Keywords: datasets

### ** Examples

data(goalspergame)



cleanEx()
nameEx("google")
### * google

flush(stderr()); flush(stdout())

### Name: google
### Title: Google stock values during 2005-02-07 to 2005-07-07
### Aliases: google
### Keywords: datasets

### ** Examples

data(google)
plot(google,type="l")



cleanEx()
nameEx("grades")
### * grades

flush(stderr()); flush(stdout())

### Name: grades
### Title: Current and previous grades
### Aliases: grades
### Keywords: datasets

### ** Examples

data(grades)
table(grades)



cleanEx()
nameEx("grip")
### * grip

flush(stderr()); flush(stdout())

### Name: grip
### Title: Effects of cross-country ski-pole grip
### Aliases: grip
### Keywords: datasets

### ** Examples

data(grip)
ftable(xtabs(UBP ~ person + replicate + grip.type,grip))



cleanEx()
nameEx("hall.fame")
### * hall.fame

flush(stderr()); flush(stdout())

### Name: hall.fame
### Title: Data frame containing baseball statistics including Hall of Fame
###   membership
### Aliases: hall.fame
### Keywords: datasets

### ** Examples

data(hall.fame)
hist(hall.fame$OBP)
with(hall.fame,last[Hall.Fame.Membership != "not a member"])



cleanEx()
nameEx("headtail")
### * headtail

flush(stderr()); flush(stdout())

### Name: headtail
### Title: Show head and tail
### Aliases: headtail
### Keywords: utilities

### ** Examples

headtail(mtcars)



cleanEx()
nameEx("healthy")
### * healthy

flush(stderr()); flush(stdout())

### Name: healthy
### Title: Healthy or not?
### Aliases: healthy
### Keywords: datasets

### ** Examples

data(healthy)
library(MASS)
stepAIC(glm(healthy ~ p + g, healthy, family=binomial))



cleanEx()
nameEx("heartrate")
### * heartrate

flush(stderr()); flush(stdout())

### Name: heartrate
### Title: Simulated data of age vs. max heart rate
### Aliases: heartrate
### Keywords: datasets

### ** Examples

data(heartrate)
plot(heartrate)
abline(lm(maxrate ~ age,data=heartrate))



cleanEx()
nameEx("home")
### * home

flush(stderr()); flush(stdout())

### Name: home
### Title: Maplewood NJ homedata
### Aliases: home
### Keywords: datasets

### ** Examples

data(home)
## compare on the same scale
boxplot(data.frame(scale(home))) 



cleanEx()
nameEx("homedata")
### * homedata

flush(stderr()); flush(stdout())

### Name: homedata
### Title: Maplewood NJ assessed values for years 1970 and 2000
### Aliases: homedata
### Keywords: datasets

### ** Examples

data(homedata)
plot(homedata)



cleanEx()
nameEx("homeprice")
### * homeprice

flush(stderr()); flush(stdout())

### Name: homeprice
### Title: Sale price of homes in New Jersey in the year 2001
### Aliases: homeprice
### Keywords: datasets

### ** Examples

data(homeprice)
plot(homeprice$sale,homeprice$list)
abline(lm(homeprice$list~homeprice$sale))



cleanEx()
nameEx("homework")
### * homework

flush(stderr()); flush(stdout())

### Name: homework
### Title: Homework averages for Private and Public schools
### Aliases: homework
### Keywords: datasets

### ** Examples

data(homework)
boxplot(homework)



cleanEx()
nameEx("income_percentiles")
### * income_percentiles

flush(stderr()); flush(stdout())

### Name: income_percentiles
### Title: Top percentiles of U.S. income
### Aliases: income_percentiles
### Keywords: datasets

### ** Examples

data(income_percentiles)



cleanEx()
nameEx("iq")
### * iq

flush(stderr()); flush(stdout())

### Name: iq
### Title: IQ scores
### Aliases: iq
### Keywords: datasets

### ** Examples

data(iq)
qqnorm(iq)



cleanEx()
nameEx("kid.weights")
### * kid.weights

flush(stderr()); flush(stdout())

### Name: kid.weights
### Title: Weight and height measurement for a sample of U.S. children
### Aliases: kid.weights
### Keywords: datasets

### ** Examples

data(kid.weights)
attach(kid.weights)
plot(weight,height,pch=as.character(gender))
## find the BMI -- body mass index
m.ht = height*2.54/100        # 2.54 cm per inch
m.wt = weight / 2.2046        # 2.2046 lbs. per kg
bmi = m.wt/m.ht^2
hist(bmi)



cleanEx()
nameEx("last.tie")
### * last.tie

flush(stderr()); flush(stdout())

### Name: last.tie
### Title: Last tie in 100 coin tosses
### Aliases: last.tie
### Keywords: datasets

### ** Examples

data(last.tie)
hist(last.tie)



cleanEx()
nameEx("lawsuits")
### * lawsuits

flush(stderr()); flush(stdout())

### Name: lawsuits
### Title: Law suit settlements
### Aliases: lawsuits
### Keywords: datasets

### ** Examples

data(lawsuits)
mean(lawsuits)
median(lawsuits)



cleanEx()
nameEx("lorem")
### * lorem

flush(stderr()); flush(stdout())

### Name: lorem
### Title: Placeholder text
### Aliases: lorem
### Keywords: datasets

### ** Examples

table(unlist(strsplit(lorem, "")))



cleanEx()
nameEx("malpract")
### * malpract

flush(stderr()); flush(stdout())

### Name: malpract
### Title: malpractice settlements
### Aliases: malpract
### Keywords: datasets

### ** Examples

data(malpract)
boxplot(malpract)



cleanEx()
nameEx("mandms")
### * mandms

flush(stderr()); flush(stdout())

### Name: mandms
### Title: Proportions of colors in various M and M's varieties
### Aliases: mandms
### Keywords: datasets

### ** Examples

data(mandms)
bagfull = c(15,34,7,19,29,24)
names(bagfull) = c("blue","brown","green","orange","red","yellow")
prop = function(x) x/sum(x)
chisq.test(bagfull,p = prop(mandms["milk chocolate",]))
chisq.test(bagfull,p = prop(mandms["Peanut",]))



cleanEx()
nameEx("math")
### * math

flush(stderr()); flush(stdout())

### Name: math
### Title: Standardized math scores
### Aliases: math
### Keywords: datasets

### ** Examples

data(math)
hist(math)



cleanEx()
nameEx("maydow")
### * maydow

flush(stderr()); flush(stdout())

### Name: maydow
### Title: Dow Jones industrial average and May maximum temperature
### Aliases: maydow
### Keywords: datasets

### ** Examples

data(maydow)
attach(maydow)
plot(max.temp,DJA)
plot(max.temp[-1],diff(DJA))



cleanEx()
nameEx("midsize")
### * midsize

flush(stderr()); flush(stdout())

### Name: midsize
### Title: Price of new and used of three mid-sized cars
### Aliases: midsize
### Keywords: datasets

### ** Examples

data(midsize)
plot(Accord ~ I(2004-Year), data = midsize)



cleanEx()
nameEx("movie_data_2011")
### * movie_data_2011

flush(stderr()); flush(stdout())

### Name: movie_data_2011
### Title: Movie data for 2011 by weekend
### Aliases: movie_data_2011
### Keywords: datasets

### ** Examples

data(movie_data_2011)



cleanEx()
nameEx("movies")
### * movies

flush(stderr()); flush(stdout())

### Name: movies
### Title: Data frome on top 25 movies for some week, many weeks ago
### Aliases: movies
### Keywords: datasets

### ** Examples

data(movies)
boxplot(movies$previous)



cleanEx()
nameEx("mw.ages")
### * mw.ages

flush(stderr()); flush(stdout())

### Name: mw.ages
### Title: Age distribution in year 2000 in Maplewood New Jersey
### Aliases: mw.ages
### Keywords: datasets

### ** Examples

data(mw.ages)
barplot(mw.ages$Male + mw.ages$Female)



cleanEx()
nameEx("nba.draft")
### * nba.draft

flush(stderr()); flush(stdout())

### Name: nba.draft
### Title: NBA draft lottery odds for 2002
### Aliases: nba.draft
### Keywords: datasets

### ** Examples

data(nba.draft)
top.pick = sample(row.names(nba.draft),1,prob = nba.draft$Balls)



cleanEx()
nameEx("normtemp")
### * normtemp

flush(stderr()); flush(stdout())

### Name: normtemp
### Title: Body temperature and heart rate of 130 health individuals
### Aliases: normtemp
### Keywords: datasets

### ** Examples

data(normtemp)
hist(normtemp$temperature)
t.test(normtemp$temperature,mu=98.2)
summary(lm(temperature ~ factor(gender), normtemp))



cleanEx()
nameEx("npdb")
### * npdb

flush(stderr()); flush(stdout())

### Name: npdb
### Title: National Practioner Data Bank
### Aliases: npdb
### Keywords: datasets

### ** Examples

data(npdb)
table(table(npdb$ID))		# big offenders
hist(log(npdb$amount))		# log normal?



cleanEx()
nameEx("nym.2002")
### * nym.2002

flush(stderr()); flush(stdout())

### Name: nym.2002
### Title: Random sample of 2002 New York City Marathon finishers
### Aliases: nym.2002
### Keywords: datasets

### ** Examples

data(nym.2002)
with(nym.2002, cor(time,age))



cleanEx()
nameEx("oral.lesion")
### * oral.lesion

flush(stderr()); flush(stdout())

### Name: oral.lesion
### Title: Oral lesion location by town
### Aliases: oral.lesion
### Keywords: datasets

### ** Examples

data(oral.lesion)
chisq.test(oral.lesion)$p.value
chisq.test(oral.lesion,simulate.p.value=TRUE)$p.value ## exact is.0269



cleanEx()
nameEx("ozonemonthly")
### * ozonemonthly

flush(stderr()); flush(stdout())

### Name: ozonemonthly
### Title: Monthly mean ozone values at Halley Bay Antartica
### Aliases: ozonemonthly
### Keywords: datasets

### ** Examples

data(ozonemonthly)
## notice decay in the 80s
plot(ozonemonthly)
## October plot shows dramatic swing
monthplot(ozonemonthly)



cleanEx()
nameEx("paradise")
### * paradise

flush(stderr()); flush(stdout())

### Name: paradise
### Title: Annual snowfall at Paradise Ranger Station, Mount Ranier
### Aliases: paradise
### Keywords: datasets

### ** Examples

require(zoo)
data(paradise)
range(paradise, na.rm=TRUE)
plot(paradise)



cleanEx()
nameEx("pi2000")
### * pi2000

flush(stderr()); flush(stdout())

### Name: pi2000
### Title: first 2000 digits of pi
### Aliases: pi2000
### Keywords: datasets

### ** Examples

data(pi2000)
chisq.test(table(pi2000))



cleanEx()
nameEx("primes")
### * primes

flush(stderr()); flush(stdout())

### Name: primes
### Title: Primes numbers less than 2003
### Aliases: primes
### Keywords: datasets

### ** Examples

data(primes)
diff(primes)



cleanEx()
nameEx("puerto")
### * puerto

flush(stderr()); flush(stdout())

### Name: puerto
### Title: Incomes for Puerto Rican immigrants to Miami
### Aliases: puerto
### Keywords: datasets

### ** Examples

data(puerto)
hist(puerto)



cleanEx()
nameEx("rat")
### * rat

flush(stderr()); flush(stdout())

### Name: rat
### Title: Survival times of 20 rats exposed to radiation
### Aliases: rat
### Keywords: datasets

### ** Examples

data(rat)
hist(rat)



cleanEx()
nameEx("reaction.time")
### * reaction.time

flush(stderr()); flush(stdout())

### Name: reaction.time
### Title: Reaction time with cell phone usage
### Aliases: reaction.time
### Keywords: datasets

### ** Examples

data(reaction.time)
boxplot(time ~ control, data = reaction.time)



cleanEx()
nameEx("reddrum")
### * reddrum

flush(stderr()); flush(stdout())

### Name: reddrum
### Title: Growth of red drum
### Aliases: reddrum
### Keywords: datasets

### ** Examples

data(reddrum)
plot(length ~ age, reddrum)



cleanEx()
nameEx("salmon.rate")
### * salmon.rate

flush(stderr()); flush(stdout())

### Name: salmon.rate
### Title: Simulated Data on Rate of Recruitment for Salmon
### Aliases: salmon.rate
### Keywords: datasets

### ** Examples

data(salmon.rate)
hist(log(salmon.rate))



cleanEx()
nameEx("salmonharvest")
### * salmonharvest

flush(stderr()); flush(stdout())

### Name: salmonharvest
### Title: Salmon harvest in Alaska from 1980 to 1998
### Aliases: salmonharvest
### Keywords: datasets

### ** Examples

data(salmonharvest)
acf(salmonharvest)



cleanEx()
nameEx("samhda")
### * samhda

flush(stderr()); flush(stdout())

### Name: samhda
### Title: Substance Abuse and Mental Health Data for teens
### Aliases: samhda
### Keywords: datasets

### ** Examples

data(samhda)
attach(samhda)
table(amt.smoke)



cleanEx()
nameEx("scatter.with.hist")
### * scatter.with.hist

flush(stderr()); flush(stdout())

### Name: scatter.with.hist
### Title: Scatterplot with histograms
### Aliases: scatter.with.hist
### Keywords: hplot multivariate

### ** Examples

data(emissions)
attach(emissions)
scatter.with.hist(perCapita,CO2)



cleanEx()
nameEx("scrabble")
### * scrabble

flush(stderr()); flush(stdout())

### Name: scrabble
### Title: Distribution of Scrabble pieces
### Aliases: scrabble
### Keywords: datasets

### ** Examples

data(scrabble)
## perform chi-squared analysis on long string. Is it in English?
quote = " R is a language and environment for statistical computing  \
and graphics. It is a GNU project which is similar to the S language \
and environment which was developed at Bell Laboratories (formerly   \
AT&T, now Lucent Technologies) by John Chambers and colleagues. R    \
can be considered as a different implementation of S. There are      \
some important differences, but much code written for S runs         \
unaltered under R."
quote.lc = tolower(quote)
quote = unlist(strsplit(quote.lc,""))
ltr.dist = sapply(c(letters," "),function(x) sum(quote == x))
chisq.test(ltr.dist,,scrabble$freq)




cleanEx()
nameEx("simple.chutes")
### * simple.chutes

flush(stderr()); flush(stdout())

### Name: simple.chutes
### Title: simulate a chutes and ladder game
### Aliases: simple.chutes
### Keywords: univar

### ** Examples

plot(simple.chutes(sim=TRUE))



cleanEx()
nameEx("simple.densityplot")
### * simple.densityplot

flush(stderr()); flush(stdout())

### Name: simple.densityplot
### Title: Plots densities of data
### Aliases: simple.densityplot simple.densityplot.default
###   simple.densityplot.formula dnstyplt
### Keywords: multivariate

### ** Examples

## taken from boxplot
## using a formula
data(InsectSprays)
simple.densityplot(count ~ spray, data = InsectSprays)
## on a matrix (data frame)
mat <- cbind(Uni05 = (1:100)/21, Norm = rnorm(100),
             T5 = rt(100, df = 5), Gam2 = rgamma(100, shape = 2))
simple.densityplot(data.frame(mat))





cleanEx()
nameEx("simple.eda")
### * simple.eda

flush(stderr()); flush(stdout())

### Name: simple.eda
### Title: Simple function to plot histogram, boxplot and normal plot
### Aliases: simple.eda
### Keywords: univar hplot

### ** Examples

  x<- rnorm(100,5,10)
  simple.eda(x)



cleanEx()
nameEx("simple.eda.ts")
### * simple.eda.ts

flush(stderr()); flush(stdout())

### Name: simple.eda.ts
### Title: Makes 3 useful graphs for eda of times series
### Aliases: simple.eda.ts
### Keywords: univar

### ** Examples

## The function is currently defined as

## look for no correlation
x <- rnorm(100);simple.eda.ts(x)
## you will find correlation here
simple.eda.ts(cumsum(x))



cleanEx()
nameEx("simple.fancy.stripchart")
### * simple.fancy.stripchart

flush(stderr()); flush(stdout())

### Name: simple.fancy.stripchart
### Title: Makes a fancier strip chart: plots means and a line
### Aliases: simple.fancy.stripchart
### Keywords: hplot

### ** Examples

x = rnorm(10);y=rnorm(10,1)
simple.fancy.stripchart(list(x=x,y=y))



cleanEx()
nameEx("simple.freqpoly")
### * simple.freqpoly

flush(stderr()); flush(stdout())

### Name: simple.freqpoly
### Title: Simply plot histogram and frequency polygon
### Aliases: simple.freqpoly
### Keywords: univar hplot

### ** Examples

x <- rt(100,4)
simple.freqpoly(x)



cleanEx()
nameEx("simple.hist.and.boxplot")
### * simple.hist.and.boxplot

flush(stderr()); flush(stdout())

### Name: simple.hist.and.boxplot
### Title: A function to plot both a histogram and a boxplot
### Aliases: simple.hist.and.boxplot simple.plot.hist.and.box
### Keywords: univar aplot

### ** Examples

x<-rnorm(100)
simple.hist.and.boxplot(x)



cleanEx()
nameEx("simple.lag")
### * simple.lag

flush(stderr()); flush(stdout())

### Name: simple.lag
### Title: applies function to moving subsets of a data vector
### Aliases: simple.lag
### Keywords: ts univar

### ** Examples

## find a moving average of the dow daily High
data(dowdata)
lag = 50; n = length(dowdata$High)
plot(simple.lag(dowdata$High,lag),type="l")
lines(dowdata$High[lag:n])



cleanEx()
nameEx("simple.lm")
### * simple.lm

flush(stderr()); flush(stdout())

### Name: simple.lm
### Title: Simplify usage of lm
### Aliases: simple.lm
### Keywords: regression

### ** Examples

## on simulated data
x<-1:10
y<-5*x + rnorm(10,0,1)
tmp<-simple.lm(x,y)
summary(tmp)

## predict values
simple.lm(x,y,pred=c(5,6,7))



cleanEx()
nameEx("simple.median.test")
### * simple.median.test

flush(stderr()); flush(stdout())

### Name: simple.median.test
### Title: Do simple sign test for median - no ranks
### Aliases: simple.median.test
### Keywords: htest

### ** Examples

x<-c(12,2,17,25,52,8,1,12)
simple.median.test(x,20)



cleanEx()
nameEx("simple.scatterplot")
### * simple.scatterplot

flush(stderr()); flush(stdout())

### Name: simple.scatterplot
### Title: Simple scatter plot of x versus y with histograms of each
### Aliases: simple.scatterplot
### Keywords: hplot

### ** Examples

  x<-sort(rnorm(100))
  y<-sort(rt(100,3))
  simple.scatterplot(x,y)




cleanEx()
nameEx("simple.sim")
### * simple.sim

flush(stderr()); flush(stdout())

### Name: simple.sim
### Title: Simplify the process of simulation
### Aliases: simple.sim
### Keywords: univar datagen

### ** Examples

## First shows trivial (and very unnecessary usage)
## define a function f and then simulate
f<-function() rnorm(1)     # create a single random real number
sim <- simple.sim(100,f)   # create 100 random normal numbers
hist(sim)

## what does range look like?
f<- function (n,mu=0,sigma=1) {
  tmp <- rnorm(n,mu,sigma)
  max(tmp) - min(tmp)
}
sim <- simple.sim(100,f,5)
hist(sim)



cleanEx()
nameEx("simple.violinplot")
### * simple.violinplot

flush(stderr()); flush(stdout())

### Name: simple.violinplot
### Title: Plots violinplots instead of boxplots
### Aliases: simple.violinplot simple.violinplot.formula
###   simple.violinplot.default vlnplt
### Keywords: multivariate

### ** Examples

## make a "violin"
x <- rnorm(100) ;x[101:150] <- rnorm(50,5)
simple.violinplot(x,col="brown")
f<-factor(rep(1:5,30))
## make a quintet. Note also choice of bandwidth
simple.violinplot(x~f,col="brown",bw="SJ")






cleanEx()
nameEx("simple.z.test")
### * simple.z.test

flush(stderr()); flush(stdout())

### Name: simple.z.test
### Title: Implement basic z-test for illustrative purposes
### Aliases: simple.z.test
### Keywords: univar

### ** Examples

  x<-rnorm(10,0,5)
  simple.z.test(x,5)



cleanEx()
nameEx("skateranks")
### * skateranks

flush(stderr()); flush(stdout())

### Name: skateranks
### Title: Judges scores for disputed ice skating competition
### Aliases: skateranks
### Keywords: datasets

### ** Examples

data(skateranks)



cleanEx()
nameEx("slc")
### * slc

flush(stderr()); flush(stdout())

### Name: slc
### Title: Sodium-Lithium countertransport
### Aliases: slc
### Keywords: datasets

### ** Examples

data(slc)
hist(slc)



cleanEx()
nameEx("smokyph")
### * smokyph

flush(stderr()); flush(stdout())

### Name: smokyph
### Title: Water pH levels at 75 water samples in the Great Smoky Mountains
### Aliases: smokyph
### Keywords: datasets

### ** Examples

data(smokyph)
plot(smokyph$elev,smokyph$waterph)



cleanEx()
nameEx("snacks")
### * snacks

flush(stderr()); flush(stdout())

### Name: snacks
### Title: Snack data from the USDA
### Aliases: snacks
### Keywords: datasets

### ** Examples

data(snacks)



cleanEx()
nameEx("south")
### * south

flush(stderr()); flush(stdout())

### Name: south
### Title: Murder rates for 30 Southern US cities
### Aliases: south
### Keywords: datasets

### ** Examples

data(south)
hist(south)



cleanEx()
nameEx("southernosc")
### * southernosc

flush(stderr()); flush(stdout())

### Name: southernosc
### Title: Southern Oscillations
### Aliases: southernosc
### Keywords: datasets

### ** Examples

data(southernosc)
plot(southernosc)



cleanEx()
nameEx("sp500.excess")
### * sp500.excess

flush(stderr()); flush(stdout())

### Name: sp500.excess
### Title: Excess returns of S&P 500
### Aliases: sp500.excess
### Keywords: datasets

### ** Examples

data(sp500.excess)
plot(sp500.excess)



cleanEx()
nameEx("squareplot")
### * squareplot

flush(stderr()); flush(stdout())

### Name: squareplot
### Title: Create a squareplot alternative to a segmented barplot
### Aliases: squareplot
### Keywords: hplot univar

### ** Examples

## A Roger Clemens Cy Young year -- roids?
squareplot(c(21,7,6),col=c("blue","green","white"))



cleanEx()
nameEx("stud.recs")
### * stud.recs

flush(stderr()); flush(stdout())

### Name: stud.recs
### Title: Student records
### Aliases: stud.recs
### Keywords: datasets

### ** Examples

data(stud.recs)
hist(stud.recs$sat.v)
with(stud.recs,cor(sat.v,sat.m))



cleanEx()
nameEx("student.expenses")
### * student.expenses

flush(stderr()); flush(stdout())

### Name: student.expenses
### Title: Some simulated data on student expenses
### Aliases: student.expenses
### Keywords: datasets

### ** Examples

data(student.expenses)
attach(student.expenses)
table(dial.up,cable.modem)



cleanEx()
nameEx("superbarplot")
### * superbarplot

flush(stderr()); flush(stdout())

### Name: superbarplot
### Title: super segmented barplot
### Aliases: superbarplot
### Keywords: hplot multivariate

### ** Examples

record.high=c(95,95,93,96,98,96,97,96,95,97)
record.low= c(49,47,48,51,49,48,52,51,49,52)
normal.high=c(78,78,78,79,79,79,79,80,80,80)
normal.low= c(62,62,62,63,63,63,64,64,64,64)
actual.high=c(80,78,80,68,83,83,73,75,77,81)
actual.low =c(62,65,66,58,69,63,59,58,59,60)
x=rbind(record.low,record.high,normal.low,normal.high,actual.low,actual.high)
the.names=c("S","M","T","W","T","F","S")[c(3:7,1:5)]
superbarplot(x,names=the.names)




cleanEx()
nameEx("tastesgreat")
### * tastesgreat

flush(stderr()); flush(stdout())

### Name: tastesgreat
### Title: Does new goo taste great?
### Aliases: tastesgreat
### Keywords: datasets

### ** Examples

data(tastesgreat)
summary(glm(enjoyed ~ gender + age, data=tastesgreat, family=binomial))



cleanEx()
nameEx("tcm1y")
### * tcm1y

flush(stderr()); flush(stdout())

### Name: tcm1y
### Title: One-year treasury security values
### Aliases: tcm1y
### Keywords: datasets

### ** Examples

data(tcm1y)
ar(diff(log(tcm1y)))



cleanEx()
nameEx("tempsalinity")
### * tempsalinity

flush(stderr()); flush(stdout())

### Name: tempsalinity
### Title: Temperature/Salinity measurements along a moving Eddy
### Aliases: tempsalinity
### Keywords: datasets

### ** Examples

data(tempsalinity)
if(require(zoo)) {
  plot(tempsalinity[,3:4])
  ## overide plot.zoo method
  plot.default(tempsalinity[,3:4])
  abline(lm(salinity ~ temperature, tempsalinity, subset = 1:67))
  abline(lm(salinity ~ temperature, tempsalinity, subset = -(1:67)))
  }



cleanEx()
nameEx("too.young")
### * too.young

flush(stderr()); flush(stdout())

### Name: too.young
### Title: What age is too young for a male to data a female?
### Aliases: too.young
### Keywords: datasets

### ** Examples

data(too.young)
lm(Female ~ Male, data=too.young)



cleanEx()
nameEx("twins")
### * twins

flush(stderr()); flush(stdout())

### Name: twins
### Title: Burt's IQ data for twins
### Aliases: twins
### Keywords: datasets

### ** Examples

data(twins)
plot(Foster ~ Biological, twins)



cleanEx()
nameEx("u2")
### * u2

flush(stderr()); flush(stdout())

### Name: u2
### Title: Song and lengths for U2 albums
### Aliases: u2
### Keywords: datasets

### ** Examples

data(u2)
sapply(u2,mean)			# average track length
max(sapply(u2,max))		# longest track length
sort(unlist(u2))		# lengths in sorted order



cleanEx()
nameEx("urchin.growth")
### * urchin.growth

flush(stderr()); flush(stdout())

### Name: urchin.growth
### Title: Data on growth of sea urchins
### Aliases: urchin.growth
### Keywords: datasets

### ** Examples

data(urchin.growth)
plot(jitter(size) ~ jitter(age), data=urchin.growth)



cleanEx()
nameEx("vacation")
### * vacation

flush(stderr()); flush(stdout())

### Name: vacation
### Title: vacation days
### Aliases: vacation
### Keywords: datasets

### ** Examples

data(vacation)
hist(vacation)



cleanEx()
nameEx("violinplot")
### * violinplot

flush(stderr()); flush(stdout())

### Name: violinplot
### Title: Plots violinplots instead of boxplots
### Aliases: violinplot violinplot.default violinplot.formula
### Keywords: multivariate

### ** Examples

## make a "violin"
x <- rnorm(100) ;x[101:150] <- rnorm(50,5)
violinplot(x,col="brown")
f<-factor(rep(1:5,30))
## make a quintet. Note also choice of bandwidth
violinplot(x~f,col="brown",bw="SJ")






cleanEx()
nameEx("watertemp")
### * watertemp

flush(stderr()); flush(stdout())

### Name: watertemp
### Title: Temperature measurement of water at 85m depth
### Aliases: watertemp
### Keywords: datasets

### ** Examples

if(require(zoo)) {
data(watertemp)	 
plot(watertemp)
acf(watertemp)
acf(diff(watertemp))
}



cleanEx()
nameEx("wchomes")
### * wchomes

flush(stderr()); flush(stdout())

### Name: wchomes
### Title: A random sample of Wake County, North Carolina residential real
###   estate plots
### Aliases: wchomes
### Keywords: datasets

### ** Examples

data(wchomes)



cleanEx()
nameEx("wellbeing")
### * wellbeing

flush(stderr()); flush(stdout())

### Name: wellbeing
### Title: What makes us happy?
### Aliases: wellbeing
### Keywords: datasets

### ** Examples

data(wellbeing)



cleanEx()
nameEx("yellowfin")
### * yellowfin

flush(stderr()); flush(stdout())

### Name: yellowfin
### Title: Yellow fin tuna catch rate in Tropical Indian Ocean
### Aliases: yellowfin
### Keywords: datasets

### ** Examples

data(yellowfin)
plot(yellowfin)



### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
