# HistData downloads
# from: Guillaume NOBLET, https://github.com/gnoblet/30DayChartChallenge/blob/main/2025/day_08.R

library(HistData)
library(dplyr)
library(extrafont)
library(cranlogs)

package_name <- "HistData"
downloads <- cran_downloads(package_name, from = "2021-01-01", to = Sys.Date())
str(downloads)
# 'data.frame':	1560 obs. of  3 variables:
# $ date   : Date, format: "2021-01-01" "2021-01-02" "2021-01-03" ...
# $ count  : num  98 199 142 251 272 291 163 207 115 122 ...
# $ package: chr  "HistData" "HistData" "HistData" "HistData" ...

Q1 <- quantile(downloads$count, 0.25)
Q3 <- quantile(downloads$count, 0.75)
IQR <- Q3 - Q1
lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR
downloads <- downloads |> 
  dplyr::filter(count >= lower_bound & count <= upper_bound)

ggplot(downloads, aes(count)) +
  geom_histogram(aes(y = after_stat(density)),binwidth = 10, color = "#F5F5DC", fill = "#D4AF37") +
  geom_density(color = "#8B4513") +
  scale_y_continuous(
    name = "Density",
    sec.axis = sec_axis(
      trans = ~ . * nrow(downloads) * 10, 
      name = "Counts"
    )
  ) +
  labs(
    title = "A True Hist-ogram",
    subtitle = "Weekly downloads of HistData Package from CRAN",
    x = NULL,
    y = NULL,
    caption = "1.5 IQR Outliers removed | Data: CRAN | Plot: @gnoblet"
  ) +
  #scales_x_
  theme_minimal() +
  theme(
    plot.background = element_rect(fill = "#F5F5DC"),
    panel.grid.major = element_blank(),
    panel.background = element_rect(fill = "#F5F5DC"), 
    panel.border = element_rect(color = "#8B4513", linewidth = 2, fill = NA),
    plot.title = element_text(hjust = 0.5, family = "Old English Text MT", size = 24, color = "#8B4513"),
    plot.subtitle = element_text(hjust = 0.5, family = "Old English Text MT", size = 18, color = "#8B4513"),
    axis.title.x = element_text(family = "Old English Text MT", size = 16, color = "#8B4513"),
    axis.title.y = element_text(family = "Old English Text MT", size = 16, color = "#8B4513"),
    axis.text = element_text(family = "Old English Text MT", size=14, color = "#8B4513"),
    plot.caption = element_text(family = "Old English Text MT", size = 10, color = "#8B4513")
  )

# Save
ggsave("2025/day_08.png", width = 8, height = 6, dpi = 300)
