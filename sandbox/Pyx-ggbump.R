library(HistData)
library(tidyverse)
library(RColorBrewer)
library(ggbump)


data("Pyx")

xtabs(count ~ Bags + Deviation, data=Pyx)

Pyxlabels <- Pyx |> 
  filter(Deviation=="Above R") |>
  mutate(rank=rank(-count))

Pyx |> 
  group_by(Deviation) |> 
  mutate(rank=rank(-count)) |> 
  ungroup() |> 
  ggplot(aes(x=Deviation,y=rank,color=Group)) +
  geom_point() +
  geom_bump(aes(group=Bags),size=2) +
  scale_y_reverse(breaks=seq(1,9,1)) +
  labs(title="Trial of the Pyx (1848)",
       subtitle="The rank of the bags of coins by deviation from the standard set by the Royal Mint",
       x="Deviation from the Standard (in percentages of the Remedy)",
       y="Rank of the bags",
       caption="The Remedy was the tolerance allowed by law, where a coin could be exchanged") +
  #  geom_text(data=Pyxlabels,
  #           aes(x=8.2,y=rank,label=Bags),size=3.5,hjust=0, color="black", show.legend=FALSE) +
  #  scale_x_discrete(expand=expansion(mult=c(0,0.1))) +
  theme_minimal()

