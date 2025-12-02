# Load packages -----------------------------------------------------------

library(readxl)
library(sf)
library(terra)
library(tidyterra)
library(tidyverse)
library(emojifont)
library(spatstat.geom)
library(spatstat.explore)
library(ggtext)
library(nrBrand)
library(ggnewscale)
library(showtext)


# Load fonts --------------------------------------------------------------

font_add_google("Rye", "rye")
font_add_google("Quattrocento", "quattrocento")
showtext_auto()


# Load data ---------------------------------------------------------------

cases <- read_xlsx("John Snow Cholera Maps/data/John_Snow_1854_cases.xlsx")
pumps <- read_sf("John Snow Cholera Maps/data/SnowGIS/Pumps.shp")
deaths <- read_sf("John Snow Cholera Maps/data/SnowGIS/Cholera_Deaths.shp")
OSMap <- rast("John Snow Cholera Maps/data/SnowGIS/OSMap_Grayscale.tif")
SnowMap <- rast("John Snow Cholera Maps/data/SnowGIS/SnowMap.tif")


# Styling elements --------------------------------------------------------

# colours
bg_col <- "#fafafa"
text_col <- "grey10"
highlight_col <- "#ec7014"

# text
title <- "<span style='font-size: 54px; font-weight: bold; font-family:\"rye\";'>1854 Broad Street Cholera Outbreak</span><br><br>"
st <- "<span style='font-family:\"quattrocento\";'>John Snow’s iconic 1854 map of the clustering of cholera deaths in 
Soho, London is one of the best and earliest uses of epidemiology and 
geospatial analysis to investigate an outbreak. It led to the identification 
of the probable infection source – a water pump in Broad Street. This remake of 
the classic map uses inverse-distance weighting to perform spatial smoothing of observed Cholera deaths.</span><br><br>"
social <- nrBrand::social_caption(
  bg_colour = bg_col,
  icon_colour = highlight_col,
  font_colour = text_col,
  font_family = "quattrocento"
)
cap <- paste0(title, st, 
              "**Data**: On the Mode of Communication of Cholera. John Snow. 1855. | SnowGIS Dataset. Robin Wilson. <br>**Graphic**: ", social
)


# Data wrangling ----------------------------------------------------------

deaths <- cbind(deaths, st_coordinates(deaths))
pumps <- cbind(pumps, st_coordinates(pumps))
pumps$label <- c("Broad Street", "", "", "", "", "", "", "")
pumps$number <- as.character(1:nrow(pumps))


# Create a smooth raster file ---------------------------------------------

# set resolution
resol <- 150

# raster cropping
bb_vec <- c(xmin = 529100, ymin = 180600, xmax = 529850, ymax = 181310)
bb <- st_bbox(bb_vec, crs = st_crs(27700))
to_crop <- ext(bb_vec["xmin"], bb_vec["xmax"], bb_vec["ymin"], bb_vec["ymax"], xy = FALSE)
OSMap_crop <- crop(OSMap$OSMap_Grayscale, to_crop)

# smoothing
obs_window <- owin(bb[c(1, 3)], bb[c(2, 4)])
ppp_deaths <- ppp(deaths$X,
                  deaths$Y,
                  marks = deaths$Count,
                  window = obs_window
)
idw_deaths <- idw(ppp_deaths, power = 0.05, dimyx = resol, at = "pixels")
sp_idw_deaths <- as.data.frame.im(idw_deaths) |> as_tibble()
obj_raster <- rast(sp_idw_deaths)
plot(obj_raster)

# make a grid
data_grid <- as.data.frame(obj_raster, xy = TRUE) |> 
  as_tibble()

# pumps distances
pumps_wide <- pumps |> 
  st_drop_geometry() |> 
  as_tibble() |> 
  select(-c(Id, label)) |> 
  pivot_wider(names_from = number, values_from = c(X, Y))

# dist to each point
p <- 0.5
min_dist <- numeric(length = nrow(data_grid))
for (i in 1:nrow(data_grid)) {
  all_dist <- numeric(length = nrow(deaths))
  for (j in 1:nrow(deaths)) {
    all_dist[j] <- ((deaths$X[j] - data_grid$x[i])^2 + (deaths$Y[j] - data_grid$y[i])^2)^(p)
  }
  min_dist[i] <- min(all_dist)
}
dist_grid <- data_grid
dist_grid$min_dist <- min_dist
dist_rast <- as_spatraster(dist_grid)

# rescale raster function
rescale_raster <- function(r){
  minmax_r <- range(values(r), na.rm = TRUE) 
  rast_out <- (r - minmax_r[1]) / (diff(minmax_r))
  return(rast_out)
}

# weight value by average distance from data
plot_rast <- log10(rescale_raster(dist_rast[["value"]]) / 
                     rescale_raster(dist_rast[["min_dist"]]))
minmax_rast <- range(as.vector(plot_rast$value), finite = TRUE)
plot_rast <- clamp(plot_rast, lower = minmax_rast[1],
                   upper = minmax_rast[2], values = TRUE)
plot(plot_rast)


# Plot --------------------------------------------------------------------

# set colour limits
lower <- round(minmax(plot_rast)[1], 3) - 0.001
upper <- round(minmax(plot_rast)[2], 3) + 0.001

# plot bg street map
bg_map <- ggplot() +
  geom_spatraster(data = OSMap_crop, alpha = 0.6) +
  scale_fill_gradient(low = text_col, high = bg_col, guide = "none")

# plot smoothed raster file
smooth_map <- bg_map +
  new_scale_fill() +
  geom_spatraster(data = plot_rast,
                  mapping = aes(alpha = after_stat(value)),
                  interpolate = TRUE,
                  ) +
  scale_alpha(guide = "none", range = c(0.5, 1), na.value = 0.5) +
  scale_fill_distiller(palette = "YlOrBr",
                       direction = 1,
                       na.value = "transparent",
                       name = "",
                       limits = c(lower, upper),
                       breaks = c(lower + 0.35, upper - 0.35),
                       labels = c("Fewer deaths", "More deaths"),
                       guide = guide_colourbar(
                         barwidth = 30,
                         title.position = "top",
                         frame.colour = text_col, 
                         label.hjust = 0.5,
                         barheight = 0.7, 
                         ticks = FALSE)) 

# add pump locations and labels
pumps_map <- smooth_map +
  geom_text(
    data = pumps,
    mapping = aes(
      x = X, y = Y, label = fontawesome("fa-map-marker")
    ),
    size = 20,
    colour = text_col,
    family = "fontawesome-webfont"
  ) +
  geom_text(
    data = pumps,
    mapping = aes(
      x = X, y = Y, label = str_wrap(label, 8)
    ),
    size = 13,
    hjust = 0,
    nudge_x = 25,
    colour = text_col,
    lineheight = 0.3,
    family = "quattrocento"
  )

# styling
pumps_map +
  labs(caption = cap) +
  theme_void(base_size = 38, base_family = "quattrocento") +
  coord_sf(expand = FALSE) +
  theme(legend.position = "bottom",
        plot.background = element_rect(fill = bg_col, colour = bg_col),
        panel.background = element_rect(fill = bg_col, colour = bg_col),
        legend.title = element_text(margin = margin(t = -35)),
        legend.text = element_text(margin = margin(t = -10, b = 10)),
        plot.caption = element_textbox_simple(
          colour = text_col,
          lineheight = 0.5,
          size = 28,
          family = "quattrocento",
          margin = margin(l = 8, r = 5, t = 15, b = 5),
        ),
        plot.margin = margin(t = -26))


# Save high resolution image ----------------------------------------------

ggsave("John Snow Cholera Maps/images/john-snow-cholera-map-nrennie.png",
       height = 8,
       width = 6,
       unit = "in")

