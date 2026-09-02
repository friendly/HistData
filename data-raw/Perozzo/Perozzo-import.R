library(readr)
Perozzo <- read_csv("data-raw/Perozzo/perozzo-tidy.csv")

Perozzo <- as.data.frame(Perozzo)
str(Perozzo)

save(Perozzo, file = "data/Perozzo.RData")
