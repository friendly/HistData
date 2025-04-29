# From: https://github.com/drjohnrussell/30DayChartChallenge/blob/main/2025/Challenge28.R
library(tidyverse)
library(HistData)

data("Yeast")

means <- Yeast |> 
  group_by(sample) |> 
  summarise(means=weighted.mean(count,freq))

calculated <- tibble(calculated=c(202,138,47,11,2,0,
                                  106,141,93,41,14,4,1,
                                  66,119,107,64,29,10,3,1,0,0,
                                  4,17,41,63,74,70,54,36,21,11,5,2,1))
Yeast <- Yeast |> 
  bind_cols(calculated)

Yeast |> 
  ggplot() +
  geom_col(aes(x=count,y=freq,fill=sample)) +
  geom_col(aes(x=count,y=calculated),fill=NA,color="black",linetype="dashed") +
  geom_vline(data=means,aes(xintercept=means,color=sample)) +
  geom_text(data=means,aes(x=means,y=175,label=paste0("mean=",round(means,2))),vjust=0,hjust=0) +
  facet_wrap(~sample,ncol=2) +
  theme_minimal() +
  guides(fill=FALSE,color=FALSE) +
  labs(x="Number of yeast cells seen in the grid square",
       y="Frequency of the count in the grid square",
       title="Student's Yeast Cells",
       subtitle="Actual counts vs predicted counts based on t-distribution")
