library(readr)
Playfair1824 <- read_csv("data-raw/Playfair1824.csv")
View(Playfair1824)

Playfair1824 <- as.data.frame(Playfair1824)
str(Playfair1824)

save(Playfair1824, file = "data-raw/Playfair1824.RData")

source("C:/Dropbox/R/functions/use_data_doc.R")

use_data_doc(Playfair1824, file = "data-raw/Playfair1824.R")

# Plot multiple time series with matplot()
# use initial letters of variables for pch
matplot(Playfair1824$Year, Playfair1824[, -1],
        pch = c("S", "W", "B", "D", "E", "I", "X", "R"),
        type = "b",
        xlab = "Year",
        ylab = "value",
        ylim = c(0, 140),
        main = "Linear Chronology, Exhibiting the Revenues, Expenditure, ... from 1770 to 1824")

# main events
events <- data.frame(
  start = c(1776, 1793, 1804),
  end = c(1782.2, 1802, 1815.2),
  event = c("American War", "War: French Republic", "War: Napoleon")
)

# draw lines for main events
with(events, {
  arrows(x0 = start, x1 = end, 
         y0 = 130, y1 = 130, 
         lwd = 3,
         code = 3,
         angle = 90, length = 0.05)
  text((start+end)/2, 132, event, pos = 3)
})
