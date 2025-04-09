# Graph of Macdonell's data on height and finger length of criminals
# from: John Russell, https://github.com/drjohnrussell/30DayChartChallenge/blob/main/2025/Challenge04.R

library(HistData)
library(tidyverse)
library(RColorBrewer)
library(ggExtra)

data("MacdonellDF")

p <- MacdonellDF |> 
  ggplot(aes(x=height,y=finger)) +
  geom_point(position="jitter",alpha=.2) +
  geom_density2d(alpha=1, 
                 show.legend=FALSE,
                 bins=9, linewidth = 1.2) +
  theme_minimal() +
  scale_fill_brewer(palette="Purples") +
  labs(title="Macdonnell's Data on Height and Finger Length of Criminals",
       x="Height (feet)",
       y="Finger Length (inches)")

ggMarginal(p, type="histogram", color=grey(.1))
