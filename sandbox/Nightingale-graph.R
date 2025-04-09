# Reproduce Nightingale's graph
# from: John Russell, https://github.com/drjohnrussell/30DayChartChallenge/blob/main/2025/Challenge06.R

library(HistData)
library(tidyverse)
library(RColorBrewer)
library(showtext)

font_add_google("Enriqueta", family="Nightingale")
showtext_auto()

data("Nightingale")

Nightingale2 <- Nightingale |> 
  mutate(Time=case_when(Date<ymd("1855-03-15") ~ "April 1954 to March 1855",
                        .default = "April 1855 to March 1856"),
         Time=fct_inorder(Time),
         Month=str_to_upper(month(Date,label=TRUE,abbr=FALSE)),
         Month=fct_inorder(Month)) |> 
  select(Month, Time, Army:Other) |> 
  pivot_longer(Disease:Other, names_to="Cause", values_to="Deaths") |> 
  mutate(Cause=factor(Cause, levels=c("Disease","Wounds","Other")))

Nightingale2 |> 
  arrange(Time,Month,-Deaths) |> 
  ggplot(aes(x=Month, y=Deaths, fill=Cause)) +
  geom_col(width=1,position="identity",color="black",size=.01) +
  geom_text(aes(x=Month,y=2800,label=Month,angle=0),family="Nightingale") +
  coord_radial(start=-pi/2, expand=FALSE, rotate_angle=TRUE) +
  facet_wrap(~Time) +
  scale_y_sqrt() +
  theme_void() +
  scale_fill_manual(values=c("lightblue","tomato", "darkslategrey")) +
  theme(
    text=element_text(family="Nightingale",size=20),
    legend.position="bottom",
    panel.grid=element_blank(),
    axis.text.y=element_blank(),
    plot.title=element_text(hjust=.5,lineheight=.5)
  ) +
  labs(y="",
       x="",
       title="Diagram of the Causes of Mortality \n in the Army in the East") +
  annotate(geom="segment",
           x=.5, y=0, xend=.5, yend=2800,
           color="black", size=.2, linetype="dashed")

