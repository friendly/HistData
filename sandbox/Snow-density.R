
# From: https://github.com/drjohnrussell/30DayChartChallenge/blob/main/2025/Challenge11.R
library(tidyverse)
library(HistData)

data("Snow.deaths")
data("Snow.pumps")
data("Snow.streets")

Snow.deaths |> 
  ggplot(aes(x=x,y=y)) +
  geom_line(data=Snow.streets,
            aes(x=x,y=y,group=street),
            color="black",
            size=0.5) +
  geom_point(alpha=.6) +
  geom_density_2d_filled(bins=4,show.legend=FALSE) +
  geom_density_2d(bins=4,color="black",alpha=.6) +
  scale_fill_manual(values=c("#FFFFFF00","#F0808030","#FF000030","#8B000080")) +
  geom_label(data=Snow.pumps,
             aes(x=x,y=y,label=label),
             size=4,
             color="blue",
             alpha=.8) +
  theme_void() +
  theme(plot.title=element_text(hjust=.1),
        plot.subtitle=element_text(hjust=.2),
        plot.caption=element_text(hjust=.9)) +
  labs(title="John Snow's Cholera Map",
       subtitle="With contour lines showing densities of death",
       caption="Using data from HistData package")
