# Reproduce Langren's graph
# from: John Russell, https://github.com/drjohnrussell/30DayChartChallenge/blob/main/2025/Challenge09.R

library(tidyverse)
library(HistData)
library(showtext)

font_add_google("Kings", "kings")
font_add_google("Cormorant Unicase", "cormorant")
data("Langren1644")
showtext_auto()

ticks <- tibble(
  x = seq(0, 30, by = 1),
  xend = seq(0, 30, by= 1),
  y = rep(0, 31),
  yend= rep(-.005, 31)
)

ticks <- ticks |> 
  mutate(yend=case_when(x %in% c(0,10,20,30) ~ -.01,
                        .default=yend))

majorticks <- tibble(
  x = seq(-.2,29.8, by = 10),
  xend = seq(.2,30.2, by= 10),
  y=rep(-.01,4),
  yend=rep(-.01,4)
)

text <- tibble(
  x = c(9.8,19.8,29.8),
  y = rep(-.006,3),
  label = c("10", "20", "30")
)

Langren1644 |> 
  ggplot(aes(x=Longitude)) +
  geom_point(y=0) +
  geom_text(aes(y=.01, label=paste0(Name,".")), angle=90,
            hjust=0,family="kings",size=7) +
  scale_x_continuous(breaks=seq(0,30,by=10),limits=c(-.2,31),
                     minor_breaks=seq(0,30,by=1)) +
  scale_y_continuous(breaks=NULL,limits=c(-.02,.1)) +
  annotate("segment",
           x=0, y=0, xend=30, yend=0,
           size=.5, color="black") +
  theme_void() +
  geom_segment(data=ticks,
               aes(x=x, y=y, xend=xend, yend=yend),
               size=.5, color="gray") +
  geom_segment(data=majorticks,
               aes(x=x, y=y, xend=xend, yend=yend),
               size=.5, color="black") +
  annotate("text", x=0,y=.01,label="Toledo",angle=90,
           hjust=0, family="cormorant",size=9) +
  annotate("text", x=1, y=.015,label="Grados de la Longitud.",
           angle=0,hjust=0, family="cormorant",size=11) +
  annotate("text", x=22,y=0.005, label="Roma",
           angle=0,hjust=0, family="cormorant",size=9) +
  geom_text(data=text,
            aes(x=x, y=y, label=label),
            angle=0,hjust=1, family="cormorant",size=6) +
  labs(title="Van Langren's 1644 diagram of longitude differences between Toledo and Rome",
       subtitle="Sometimes known as the first statistical graph") +
  theme(plot.title = element_text(hjust=0.5, size=20),
        plot.subtitle = element_text(hjust=0.5, size=15)) +
  annotate("point",x=16.5,y=0,color="red")
