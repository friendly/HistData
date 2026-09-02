# Compare the pre-computed contour segments in perozzo-contours.json against contours
# recomputed directly from the Perozzo grid, to check how closely they agree before deciding
# whether perozzo-contours.json is worth shipping as its own dataset (see issues/TASKS.md).

library(jsonlite)
library(dplyr)
library(ggplot2)

load("data/Perozzo.RData")
Pmat <- xtabs(Survivors ~ Year + Age, data = Perozzo)
years <- as.numeric(rownames(Pmat))
ages  <- as.numeric(colnames(Pmat))

## ---- digitized contours (from JSON) --------------------------------------

raw <- fromJSON("data-raw/Perozzo/perozzo-contours.json", simplifyVector = FALSE)

digitized <- bind_rows(lapply(seq_along(raw), function(i) {
  pts <- bind_rows(lapply(raw[[i]]$points, as.data.frame))
  data.frame(
    source  = "digitized",
    level   = raw[[i]]$level,
    segment = i,
    year    = pts$year,
    age     = pts$age
  )
}))

## ---- recomputed contours (base R, same levels) ----------------------------

levels_used <- sort(unique(digitized$level))
cl <- contourLines(years, ages, Pmat, levels = levels_used)

computed <- bind_rows(lapply(seq_along(cl), function(i) {
  data.frame(
    source  = "computed",
    level   = cl[[i]]$level,
    segment = i,
    year    = cl[[i]]$x,
    age     = cl[[i]]$y
  )
}))

both <- bind_rows(digitized, computed) |>
  mutate(group = paste(source, level, segment))

cat("digitized: ", length(unique(digitized$level)), "levels,",
    length(unique(digitized$segment)), "segments\n")
cat("computed:  ", length(unique(computed$level)), "levels,",
    length(unique(computed$segment)), "segments\n")

## ---- overlay plot ----------------------------------------------------------

p <- ggplot(both, aes(year, age, group = group, color = source)) +
  geom_path(linewidth = 0.6) +
  scale_color_manual(values = c(digitized = "firebrick", computed = "steelblue")) +
  scale_y_reverse() +
  labs(title = "Perozzo survivorship contours: digitized vs. recomputed",
       x = "Year", y = "Age", color = "Source") +
  theme_minimal()

ggsave("data-raw/Perozzo/Perozzo-contours-compare.png", p, width = 8, height = 6, dpi = 150)
print(p)

## ---- numeric comparison ----------------------------------------------------
## For each level, interpolate the computed contour's age onto the digitized contour's
## year values (per digitized segment) and summarize the age discrepancy.

compare_level <- function(lev) {
  dig <- filter(digitized, level == lev)
  comp <- filter(computed, level == lev)
  if (nrow(comp) == 0 || nrow(dig) == 0) {
    return(data.frame(level = lev, n_dig_pts = nrow(dig), n_comp_pts = nrow(comp),
                       mean_abs_diff = NA, max_abs_diff = NA))
  }
  # pool all computed segments at this level into one interpolation function
  comp_ord <- comp[order(comp$year), ]
  age_hat <- approx(comp_ord$year, comp_ord$age, xout = dig$year, rule = 1)$y
  diffs <- abs(dig$age - age_hat)
  data.frame(level = lev, n_dig_pts = nrow(dig), n_comp_pts = nrow(comp),
             mean_abs_diff = mean(diffs, na.rm = TRUE),
             max_abs_diff = max(diffs, na.rm = TRUE))
}

comparison <- bind_rows(lapply(levels_used, compare_level))
print(comparison, row.names = FALSE)

write.csv(comparison, "data-raw/Perozzo/Perozzo-contours-compare.csv", row.names = FALSE)
