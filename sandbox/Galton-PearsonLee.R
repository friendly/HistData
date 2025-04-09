# ggplots of Galton and PearsonLee data
# From: John Russell, https://github.com/drjohnrussell/30DayChartChallenge/blob/main/2025/Challenge02.R

library(HistData)
#library(tidyverse)
library(ggplot2)
library(dplyr)
library(RColorBrewer)

data("Galton")
data("PearsonLee")

Galton |> 
  ggplot(aes(x=parent,y=child)) +
  geom_point(position="jitter") +
  geom_density2d_filled(alpha=.6,show.legend=FALSE,bins=9) +
  theme_minimal() +
  geom_smooth(method="loess",se=FALSE,color="red") +
  geom_smooth(method="lm",se=FALSE) +
  labs(title="Galton's Height Data",
       x="Parent Height (inches)",
       y="Child Height (inches)") +
  scale_fill_brewer(type="seq")


PearsonLee |> 
  ggplot(aes(x=parent,y=child)) +
  geom_point() +
  theme_minimal() +
  geom_smooth(aes(weight=frequency), method="lm", se=FALSE, color="red",size=2) +
  geom_smooth(aes(weight = frequency), method="lm", se=FALSE) +
  facet_grid(par ~ chl) +
  labs(title="Pearson and Lee's Data on Parent and Child",
       x="Parent Height (inches)",
       y="Child Height (inches)")
