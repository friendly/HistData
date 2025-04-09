# From: https://github.com/drjohnrussell/30DayChartChallenge/blob/main/2025/Challenge01.R

library(HistData)
#library(tidyverse)
library(ggplot2)
library(dplyr)
library(waffle)
library(emojifont)
library(RColorBrewer)

load.fontawesome()

data("Cholera")

plot1 <- Cholera |> 
  ggplot(aes(x=elevation, y=cholera_drate,color=water)) +
  geom_point(size = 2) +
  geom_smooth(method = lm, se = FALSE) +
  theme_bw() +
  labs(y="Cholera Death Rate per 10000 citizens (log)",
       x="Elevation in feet (log)",
       color="Water Source") +
  theme(legend.position="bottom") +
  scale_y_log10() +
  scale_x_log10() +
  scale_color_brewer(palette="Dark2")

plot1



day1 <- Cholera |> 
  mutate(newcholeradeaths = cholera_deaths/40) |>
  arrange(water) |> 
  ggplot(aes(fill=water,values=newcholeradeaths)) +
  geom_waffle(radius=grid::unit(0.4,"npc"),
              size=.25) +
  theme_void() +
  labs(title="Deaths from Cholera in London in 1849",
       subtitle="40 Deaths per Square",
       caption="Data from William Farr's initial report, where he concluded elevation \nwas the factor in the spread of plague",
       fill="Water Source") +
  scale_fill_brewer(palette="Dark2") +
  theme(legend.position="bottom",
        panel.background=element_rect(color="white"))

day1

ggsave("2025/final/day_01.png",
       bg="white",
       dpi=600)
