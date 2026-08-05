# Perozzo's Swedish Population Survivorship Data

Data underlying Luigi Perozzo's (1880, 1881) "stereogram" – an early
three-dimensional population pyramid – showing the number of survivors,
by age, of Swedish birth cohorts followed forward through successive
census years, 1750-1875.

## Usage

``` r
data("Perozzo")
```

## Format

A data frame with 546 observations on the following 3 variables, forming
a 26 (Year) x 21 (Age) grid.

- `Year`:

  numeric, census year, 1750-1875 in steps of 5

- `Age`:

  numeric, age in years, 0-100 in steps of 5

- `Survivors`:

  numeric, number of survivors at that age in that census year

## Source

Digitized from Perozzo's original stereogram (source of the digitization
itself not yet identified – see Details). The original is held by
Wikimedia Commons:
<https://commons.wikimedia.org/wiki/File:Stereogram_(three-dimensional_population_pyramid)_modeled_on_actual_data_(Swedish_census,_1750-1875).jpg>

## Details

Perozzo's stereogram plotted `Survivors` as a surface over the `Year` x
`Age` grid, letting a viewer read off both cross-sections (the age
distribution in a given census year) and diagonal cohort lines
(survivorship of a single birth cohort as it ages) from one figure –
widely cited as one of the earliest true 3D statistical graphics.

The digitization source for this tidy grid is currently unknown; see
`issues/TASKS.md` in the GitHub repo for the open item to track it down.

Perozzo's 3D graphic was remarkable in its' time and still is today, for
attention to detail in his hand-drawn graphic. The simple image from
[`graphics::persp`](https://rdrr.io/r/graphics/persp.html) show here is
a very coarse approximation. It remains a `HistData` challenge to do
this (a) closer to Perozzo's graphic or (b) better in someway.

For example: Perozzo showed the trace lines for `age` receding into the
image, with major lines for `year` shown in red at 25 year intervals.
The trace lines for `year` at fixed `age` were also highlighted at 25
year intervals.

More importantly, for demography, he realized that diagonal lines for
combinations of `age` and `year` reflected a **cohort** and these could
be used to compare the life survivorship of people born in various
years.

## References

Perozzo, L. (1880). Della Rappresentazione Graphica di una Collettivita
di Individuinella Successione del Tempo. *Annali di Statistica*, 12,
1-16.

Perozzo, L. (1881). Stereogrammi Demografici – Seconda memoria
dell'Ingegnere Luigi Perozzo. *Annali di Statistica*, 22, 1-20.

## Examples

``` r
data(Perozzo)
str(Perozzo)
#> 'data.frame':    546 obs. of  3 variables:
#>  $ Year     : num  1750 1755 1760 1765 1770 ...
#>  $ Age      : num  0 0 0 0 0 0 0 0 0 0 ...
#>  $ Survivors: num  163000 173012 166233 172982 173367 ...

# reshape to a Year x Age matrix for a surface / contour plot
Pmat <- xtabs(Survivors ~ Year + Age, data = Perozzo)
years <- as.numeric(rownames(Pmat))
ages  <- as.numeric(colnames(Pmat))

# perspective plot: Year horizontal (1750 -> 1875, left to right), Age receding
# in depth (100 in front -> 0 at the back), as in Perozzo's original stereogram.
# persp() requires ascending x/y, so the front-to-back flip is done by negating
# and reversing Age (and matching the matrix columns to it), not by relabeling.
ages_rev <- -rev(ages)
Pmat_rev <- Pmat[, rev(seq_along(ages))]
persp(years, ages_rev, Pmat_rev,
      xlab = "Year", ylab = "Age", zlab = "Survivors",
      theta = 0, phi = 25, expand = 0.6,
      col = adjustcolor("lightblue", alpha.f = 0.5), shade = 0.5)


# contour plot of the same surface
contour(years, ages, Pmat, xlab = "Year", ylab = "Age")


# extract the contour lines themselves, e.g. for further analysis or custom plotting
cl <- contourLines(years, ages, Pmat, levels = seq(20000, 280000, by = 20000))
length(cl)
#> [1] 16
str(cl[[1]])
#> List of 3
#>  $ level: num 20000
#>  $ x    : num [1:32] 1750 1755 1760 1765 1770 ...
#>  $ y    : num [1:32] 73.5 75 73.6 74.4 73.9 ...
```
