# Arbuthnot's data on M/F births
# From: https://github.com/drjohnrussell/30DayChartChallenge/blob/main/2025/Challenge03.R

library(HistData)
library(tidyverse)
library(PieGlyph)

data("Arbuthnot")

Arbuthnot |> 
  mutate(total=`Males` + `Females`) |>
  ggplot(aes(x=Year, y=total)) +
  geom_pie_glyph(slices=c("Males","Females"),
                 color="black",radius=0.4) +
  scale_fill_manual(values=c("lightblue","pink")) +
  theme_minimal() +
  theme(legend.position="bottom") +
  labs(fill="Gender",
       title="John Arbuthnot's Data on Male and Female Baptisms in London",
       x="Year",
       y="Total Baptisms")
