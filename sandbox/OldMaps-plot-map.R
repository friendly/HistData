# OldMaps -- on a map
# From: https://github.com/drjohnrussell/30DayChartChallenge/blob/main/2025/Challenge10.R

library(tidyverse)
library(HistData)
library(geosphere)
options(scipen = 999)

data(OldMaps)

OldMaps <- OldMaps |> 
  mutate(lat=abs(lat),
         long=-abs(long))

OldMapsdistance <- OldMaps |> 
  filter(name!= "Actual") |> 
  left_join(OldMaps |> 
              filter(name== "Actual") |> 
              select(point,lat,long) |> 
              rename(Actuallat=lat,
                     Actuallong=long))

# Calculate the distance between the actual and estimated points
OldMapsdistance <- OldMapsdistance |> 
  mutate(distance = distHaversine(cbind(long, lat), cbind(Actuallong, Actuallat)))

OldMapsdistance |> 
  ggplot(aes(x=distance)) +
  geom_density(aes(color=name)) +
  geom_density(color="black", 
               linewidth=2) +
  theme_minimal() +
  labs(title="Errors of latitude and longitude in Maps from 1688-1818",
       subtitle="Distance from actual point to estimated point on maps of the Great lakes",
       x="Distance from Actual Point to point on old map",
       y="Density",
       color="Mapmaker")

# move legend; maybe direct labels?
last_plot() + 
  theme(legend.position = "inside",
        legend.position.inside = c(.8, .6))

# maybe better: a ggridges plot?

## Extra - let's make a map!!!

library(rnaturalearth)
library(sf)
library(metR)

states=ne_states(country=c("United States of America","Canada"),returnclass="sf")

OldMapsdistance |>
  filter(name %in% c("Melish","D'Anville")) |> 
  ggplot() +
  geom_segment(aes(x=long,xend=Actuallong,
                   y=lat,yend=Actuallat,
                   color=name),arrow=arrow(length=unit(0.2,"cm")),size=1) +
  geom_sf(data=states,aes(geometry=geometry),fill=NA) +
  scale_x_longitude(limits=c(-100,-70),ticks=5) +
  scale_y_latitude(limits=c(40,50),ticks=2) +
  theme_minimal() +
  labs(title="Estimated Point on Maps to Actual Point on the Great Lakes",
       subtitle="Maps from 1688-1818",
       x="Longitude",
       y="Latitude",
       color="Mapmaker")
