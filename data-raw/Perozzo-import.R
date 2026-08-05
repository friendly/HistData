library(readr)
Perozzo <- read_csv("data-raw/perozzo-tidy.csv")

Perozzo <- as.data.frame(Perozzo)
str(Perozzo)

save(Perozzo, file = "data/Perozzo.RData")
