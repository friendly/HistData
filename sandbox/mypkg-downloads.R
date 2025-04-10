# downloads of my packages

library(dplyr)
library(ggplot2)
#library(extrafont)
library(cranlogs)

packages <- c("heplots", 
              "candisc", 
              "mvinfluence", 
              "VisCollin",
              "genridge", 
              "matlib", 
              "HistData", 
              "vcdExtra",
              "nestedLogit",
              "ggbiplot",
              "HistData",
              "Guerry",
              "WordPools"
)

downloads <- cran_downloads(packages, from = "2021-01-01", to = Sys.Date())

ggplot(downloads, aes(count, color = package)) +
  geom_density() 
  