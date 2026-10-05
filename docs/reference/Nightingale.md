# Florence Nightingale's data on deaths in the Crimean War

In the history of data visualization, Florence Nightingale is best
remembered for her role as a social activist and her view that
statistical data, presented in charts and diagrams, could be used as
powerful arguments for medical reform.

After witnessing deplorable sanitary conditions in the Crimea, she wrote
several influential texts (Nightingale, 1858, 1859), including
polar-area graphs (sometimes called "Coxcombs" or rose diagrams),
showing the number of deaths in the Crimean from battle compared to
disease or preventable causes that could be reduced by better
battlefield nursing care.

Her *Diagram of the Causes of Mortality in the Army in the East* showed
that most of the British soldiers who died during the Crimean War died
of sickness rather than of wounds or other causes. It also showed that
the death rate was higher in the first year of the war, before a
Sanitary Commissioners arrived in March 1855 to improve hygiene in the
camps and hospitals.

## Format

A data frame with 24 observations on the following 10 variables.

- `Date`:

  a Date, composed as
  `as.Date(paste(Year, Month, 1, sep='-'), "\%Y-\%b-\%d")`

- `Month`:

  Month of the Crimean War, an ordered factor

- `Year`:

  Year of the Crimean War

- `Army`:

  Estimated average monthly strength of the British army

- `Disease`:

  Number of deaths from preventable or mitagable zymotic diseases

- `Wounds`:

  Number of deaths directly from battle wounds

- `Other`:

  Number of deaths from other causes

- `Disease.rate`:

  Annual rate of deaths from preventable or mitagable zymotic diseases,
  per 1000

- `Wounds.rate`:

  Annual rate of deaths directly from battle wounds, per 1000

- `Other.rate`:

  Annual rate of deaths from other causes, per 1000

## Source

The data were obtained from:

Pearson, M. and Short, I. (2007). Understanding Uncertainty: Mathematics
of the Coxcomb. <http://understandinguncertainty.org/node/214>.

## Details

For a given cause of death, `D`, annual rates per 1000 are calculated as
`12 * 1000 * D / Army`, rounded to 1 decimal.

The two panels of Nightingale's Coxcomb correspond to dates before and
after March 1855

## References

Nightingale, F. (1858) *Notes on Matters Affecting the Health,
Efficiency, and Hospital Administration of the British Army* Harrison
and Sons, 1858

Nightingale, F. (1859) *A Contribution to the Sanitary History of the
British Army during the Late War with Russia* London: John W. Parker and
Son.

Small, H. (1998) Florence Nightingale's statistical diagrams
<https://www.florence-nightingale-avenging-angel.co.uk/GraphicsPaper/Graphics.htm>

Pearson, M. and Short, I. (2008) Nightingale's Rose (flash animation).
[http://understandinguncertainty.org/files/animations/Nightingale11/Nightingale1.html](http://understandinguncertainty.org/files/animations/Nightingale11/Nightingale1.md)

See the example by John Russell for the
[30DayChartChallenge](https://github.com/drjohnrussell/30DayChartChallenge/blob/main/2025/Challenge06.R)

## Examples

``` r

data(Nightingale)

# For some graphs, it is more convenient to reshape death rates to long format
#  keep only Date and death rates
require(reshape)
Night<- Nightingale[,c(1,8:10)]
melted <- melt(Night, "Date")
names(melted) <- c("Date", "Cause", "Deaths")
melted$Cause <- sub("\\.rate", "", melted$Cause)
melted$Regime <- ordered( rep(c(rep('Before', 12), rep('After', 12)), 3), 
                          levels=c('Before', 'After'))
Night <- melted

# subsets, to facilitate separate plotting
Night1 <- subset(Night, Date < as.Date("1855-04-01"))
Night2 <- subset(Night, Date >= as.Date("1855-04-01"))

# sort according to Deaths in decreasing order, so counts are not obscured [thx: Monique Graf]
Night1 <- Night1[order(Night1$Deaths, decreasing=TRUE),]
Night2 <- Night2[order(Night2$Deaths, decreasing=TRUE),]

# merge the two sorted files
Night <- rbind(Night1, Night2)


require(ggplot2)
# Before plot
cxc1 <- ggplot(Night1, aes(x = factor(Date), y=Deaths, fill = Cause)) +
    # do it as a stacked bar chart first
   geom_bar(width = 1, position="identity", stat="identity", color="black") +
    # set scale so area ~ Deaths  
   scale_y_sqrt() 
    # A coxcomb plot = bar chart + polar coordinates
cxc1 + coord_polar(start=3*pi/2) + 
  ggtitle("Causes of Mortality in the Army in the East") + 
  xlab("")


# After plot
cxc2 <- ggplot(Night2, aes(x = factor(Date), y=Deaths, fill = Cause)) +
   geom_bar(width = 1, position="identity", stat="identity", color="black") +
   scale_y_sqrt()
cxc2 + coord_polar(start=3*pi/2) +
  ggtitle("Causes of Mortality in the Army in the East") + 
  xlab("")


if (FALSE) { # \dontrun{
# do both together, with faceting
cxc <- ggplot(Night, aes(x = factor(Date), y=Deaths, fill = Cause)) +
 geom_bar(width = 1, position="identity", stat="identity", color="black") + 
 scale_y_sqrt() +
 facet_grid(. ~ Regime, scales="free", labeller=label_both)
cxc + coord_polar(start=3*pi/2) +
  ggtitle("Causes of Mortality in the Army in the East") + 
  xlab("")
} # }

## What if she had made a set of line graphs?

# long format: one row per month and cause, with death rates and percent of all deaths
causes <- c("Disease", "Wounds", "Other")
Night.long <- data.frame(
  Date  = rep(Nightingale$Date, 3),
  Cause = factor(rep(causes, each = 24), levels = causes,
                 labels = c("Preventable disease", "Wounds and injuries", "Other")),
  Rate  = unlist(Nightingale[, paste0(causes, ".rate")]),
  Pct   = 100 * unlist(Nightingale[, causes]) / rowSums(Nightingale[, causes])
)

# shade the period before the Sanitary Commission, and label the two periods
regimes <- function(y) {
  rect(as.Date("1854-04-01"), -100, as.Date("1855-03-01"), 2000,
       col = gray(.5, alpha = .2), border = NA)
  text(as.Date(c("1854-04-01", "1855-04-01")), y,
       c("Before Sanitary Commission", "After Sanitary Commission"), pos = 4, cex = 0.85)
}
quarters <- seq(as.Date("1854-04-01"), as.Date("1856-03-01"), "3 months")

if (require(tinyplot)) {
  # these plots are best viewed with width ~ 2 * height
  plt(Rate ~ Date | Cause, data = Night.long, type = "b", lwd = 2,
      palette = c("blue", "red", "black"), legend = "right",
      xaxb = quarters, xaxl = function(x) format(x, "%b %Y"),
      ylab = "Annual Death Rate",
      main = "Causes of Mortality of the British Army in the East")
  regimes(980)

  # Alternatively, show each cause of death as percent of total
  plt(Pct ~ Date | Cause, data = Night.long, type = "b", lwd = 2,
      palette = c("blue", "red", "black"), legend = "bottom!", ylim = c(0, 110),
      xaxb = quarters, xaxl = function(x) format(x, "%b %Y"),
      ylab = "Percent deaths",
      main = "Percentage of Deaths by Cause")
  regimes(108)
}



```
