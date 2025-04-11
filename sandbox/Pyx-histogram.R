# Pyx histogram
# From: https://github.com/drjohnrussell/30DayChartChallenge/blob/main/2025/Challenge08.R

library(HistData)
library(tidyverse)
library(RColorBrewer)


data("Pyx")

Pyx |> 
  mutate(Bags=fct_relevel(Bags,"5","6","7")) |>
  group_by(Bags) |> 
  mutate(percent=count/sum(count)*100) |>
  ungroup() |>
  ggplot(aes(x=Deviation,y=percent,group=Bags,fill=Group)) +
  geom_col(stat="identity",position=position_dodge()) +
  theme_minimal() +
  theme(legend.position = "top") +
  labs(x="Deviation from the Standard",
       y="Percentage of an individual bag",
       title="Trial of the Pyx (1848)",
       fill="")
