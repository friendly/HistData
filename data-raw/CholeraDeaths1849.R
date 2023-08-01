#' ---
#' title: Cholera deaths in 1849
#' ---

# data from: James Riley, https://github.com/jimr1603/1849-cholera
# plots from: https://openor.blog/2023/07/27/cholera-in-victorian-england/

library(readr)
library(dplyr)
library(tidyr)
library(stringr)
library(lubridate)
library(ggplot2)
# Cholera1849 <- read_csv("https://raw.githubusercontent.com/jimr1603/1849-cholera/main/1849%20cholera%20deaths%20England.csv", 
#                          na = c("-", "")) |>
CholeraDeaths1849 <- read_csv("data-raw/CholeraDeaths1849.csv") |>
  rename("month" = 1) |>
  rename("cause_of_death" = 3) |>
  select(month, cause_of_death, `1`:`31`) |>
  filter(!is.na(cause_of_death)) |>
  mutate(month = if_else(is.na(month), lag(month), month)) |>
  pivot_longer(`1`:`31`) |>
  rename(day_of_month = name) |>
  mutate(date = str_glue("1849-{month}-{day_of_month}")) |>
  mutate(date = ymd(date)) |>
  filter(!is.na(date)) |>
  rename(deaths = value) |>
  mutate(day_of_week = wday(date, label = TRUE, week_start = 1))

# tweak cause_of_death
CholeraDeaths1849 <- CholeraDeaths1849 |>
  mutate(cause_of_death = as.factor(ifelse(cause_of_death == "Diarrh.", "Diarrhaea", cause_of_death))) 

str(CholeraDeaths1849)

save(CholeraDeaths1849, file = "data/CholeraDeaths1849.RData")

prompt(CholeraDeaths1849, filename = "man/CholeraDeaths1849.Rd")

# plots

CholeraDeaths1849  |>
  ggplot(aes(x = date, y = deaths, colour = cause_of_death)) +
  geom_line(linewidth = 1.2) +
#  geom_area(aes(fill = cause_of_death), alpha = 0.4) +
#  ggthemes::scale_colour_few() +
  theme_bw(base_size = 14) +
  theme(legend.position = "top")

# day of week variation?
CholeraDeaths1849 |>
  mutate(week = week(date)) |>
  group_by(week, cause_of_death) |>
  mutate(avg = mean(deaths)) |>
  ungroup() |>
  mutate(variance = deaths - avg) |>
  group_by(day_of_week, cause_of_death) |>
  summarise(variance = mean(variance)) |>
  ggplot(aes(x = day_of_week, fill = cause_of_death, y = variance)) +
    geom_col(position = "dodge") +
    labs(y = "Deviation from average daily deaths") +
    geom_hline(yintercept = 0) +
    geom_text(aes(x = day_of_week, 
                  y = variance/2, 
                  label = round(variance,1))) +
    theme_bw(base_size = 14) +
    theme(legend.position = "top")
