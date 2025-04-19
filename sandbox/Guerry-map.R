# from: John Russell, https://github.com/drjohnrussell/30DayChartChallenge/blob/main/2025/Challenge18.R

#library(tidyverse)
library(ggplot2)
library(dplyr)
library(sf)
library(HistData)
#library(Guerry)
#library(patchwork)

data("gfrance85", package = "Guerry")
data("gfrance",   package = "Guerry")

#data2 <- st_as_sf(gfrance85)

                   
data2 <- st_as_sf(gfrance)

data2 |> 
 ggplot() +
 geom_sf(aes(geometry=geometry,
             fill=Instruction),
         show.legend=FALSE) +
 geom_sf_text(aes(label=Instruction,
                  color=(Instruction<37)),
              size=3, 
              show.legend=FALSE) +
 scale_fill_gradient2(low = "white", high = 'black') +
 scale_color_manual(values=c("white","black")) +
 theme_void() +
 labs(
   title = "Guerry's data on French Instruction (1833)",
   subtitle="Ranking based on ability of conscripts to read and write",
   caption="Source: Guerry and HistData packages")
