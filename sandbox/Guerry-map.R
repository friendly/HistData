# from: John Russell, https://github.com/drjohnrussell/30DayChartChallenge/blob/main/2025/Challenge18.R

#library(tidyverse)
library(ggplot2)
library(dplyr)
library(sf)
library(HistData)
#library(Guerry)
library(patchwork)

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

#do Guerry / Balbi

data_gf85 <- st_as_sf(gfrance85)


p1 <-  ggplot(data_gf85) +
  geom_sf(aes(geometry=geometry,
              fill=Crime_pers),
          show.legend=FALSE) +
  geom_sf_text(aes(label=floor(Crime_pers/1000),
                   color=(Crime_pers < mean(Crime_pers))),
               size=3, 
               show.legend=FALSE) +
  scale_fill_gradient2(low = "white", high = 'black') +
  scale_color_manual(values=c("white","black")) +
  theme_void() +
  labs(title = "Crimes against persons per 1000 inhabitants")
p1

p2<-  ggplot(data_gf85) +
  geom_sf(aes(geometry=geometry,
              fill=Crime_prop),
          show.legend=FALSE) +
  geom_sf_text(aes(label=floor(Crime_prop/1000),
                   color=(Crime_prop < mean(Crime_prop))),
               size=3, 
               show.legend=FALSE) +
  scale_fill_gradient2(low = "white", high = 'black') +
  scale_color_manual(values=c("white","black")) +
  theme_void() +
  labs(title = "Crimes against property per 1000 inhabitants")
p2

p3 <- ggplot(data_gf85) +
  geom_sf(aes(geometry=geometry,
              fill=Literacy),
          show.legend=FALSE) +
  geom_sf_text(aes(label=Literacy,
                   color=(Literacy < mean(Literacy))),
               size=3, 
               show.legend=FALSE) +
  scale_fill_gradient2(low = "white", high = 'black') +
  scale_color_manual(values=c("white","black")) +
  theme_void() +
  labs(title = "Literacy: Percent who can read and write")
p3

(p1 + p2) / p3
