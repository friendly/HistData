# Draw John Snow's Map of Cholera in London

The main function `SnowMap` draws versions of John Snow's map of cholera
deaths in the South London area surrounding the Borad Street pump.
during the 1854 outbreak.

It is a wrapper for the various subfunctions also listed here:  
`Splot` sets up the basic plot  
`Sstreets` draws the streets  
`Sdeaths` plots the deaths  
`Sdeaths` plots the pump locations  
`Sscale` draws the scale  
`Spolygons` draws the boundaries of the Voronoi polygons separating the
pumps  
`Sdensity` draws and fills contours of the 2D density of deaths

## Usage

``` r
SnowMap(xlim = c(3, 20), ylim = c(3, 20), 
        axis.labels = FALSE, main = "Snow's Cholera Map of London", 
        scale = TRUE, polygons = FALSE, density=FALSE,
        streets.args = list(col = "grey", lwd = 1), 
        deaths.args = list(col = "red", pch = 15, cex = 0.6), 
        pumps.args = list(col = "blue", pch = 17, cex = 1.5, cex.lab = 0.9), 
        scale.args = list(xs = 3.5, ys = 19.7), 
        polygons.args = list(col=NA, border="brown", lwd=2, lty=1),
        density.args=list(bandwidth=c(0.5,0.5), 
                  col1=rgb(0,1,0,0),
                  col2=rgb(1,0,0,.8))
)

Splot(xlim = c(3, 20), ylim = c(3, 20), 
      xlab = "", ylab = "", 
      axis.labels = FALSE, 
      main = "Snow's Cholera Map of London")

Sdeaths(col = "red", pch = 15, cex = 0.6)

Spumps(col = "blue", pch = 17, cex = 1.5, cex.lab = 0.9)

Sstreets(col = "gray", lwd = 1)

Sscale(xs = 3.5, ys = 19.7)

Spolygons(col=NA, border="brown", lwd=2, lty=1)

Sdensity(bandwidth = c(0.5, 0.5), col1 = rgb(0, 1, 0, 0), col2 = rgb(1, 0, 0, 0.8))
```

## Arguments

- xlim:

  Limit for the horizontal axis. Specify ranges smaller than the
  defaults to zoom the plot.

- ylim:

  Limit for the vertical axis.

- axis.labels:

  Logical. Show axis tick mark labels?

- main:

  Plot title

- scale:

  Logical; draw a scale (in meters) on the plot

- polygons:

  Logical; Use `Spolygons` to draw the `Snow.polygons` on the plot?

- density:

  Logical; Use `Sdensity` to draw the 2D bivariate density of deaths on
  the plot?

- streets.args:

  List of arguments passed to `Sstreets`

- deaths.args:

  List of arguments passed to `Sdeaths`

- pumps.args:

  List of arguments passed to `Spumps`

- scale.args:

  List of arguments passed to `Sscale`

- polygons.args:

  List of arguments passed to `Spolygons`. Note that `col` here now
  refers to the fill colors, passed to
  [`polygon`](https://rdrr.io/r/graphics/polygon.html). The `col`
  argument here can be a vector of up to 13 colors, one for each pump
  region.

- density.args:

  List of arguments passed to `Sdensity`

- xlab:

  Label for horizontal axis

- ylab:

  Label for vertical axis

- col:

  Color of points and lines used by various functions

- pch:

  Point character used by by various functions

- cex:

  Character size used by by various functions

- cex.lab:

  Character size for labels used by `Spumps`

- lwd:

  Line width used by by various functions

- border:

  Color of border lines used by `Spolygons`

- xs:

  x location of the scale used by `Sscale`

- ys:

  y location of the scale used by `Sscale`

- lty:

  Line type used by by various functions

- bandwidth:

  Bandwidth used by
  [`bkde2D`](https://rdrr.io/pkg/KernSmooth/man/bkde2D.html) in
  `Sdensity`

- col1:

  Lower level of color range used by
  [`colorRampPalette`](https://rdrr.io/r/grDevices/colorRamp.html) in
  `Sdensity`

- col2:

  Upper level of color range used by
  [`colorRampPalette`](https://rdrr.io/r/grDevices/colorRamp.html) in
  `Sdensity`

## Value

None

## References

Snow, J. (1885). *On the Mode of Communication of Cholera*. London: John
Churchill

Thomas Coleman, "John Snow Research project",
`https://www.hilerun.org/econ/papers/snow/index.html` gives extensive
analyses of Snow's data with R notebooks on Github.

## Author

Michael Friendly

## See also

[`Snow`](https://friendly.github.io/HistData/reference/Snow.md) for
description of the data sets

[`bkde2D`](https://rdrr.io/pkg/KernSmooth/man/bkde2D.html),
[`colorRampPalette`](https://rdrr.io/r/grDevices/colorRamp.html)

## Examples

``` r
SnowMap()

SnowMap(axis.labels=TRUE)

SnowMap(deaths.args=list(col="darkgreen"))


SnowMap(polygons=TRUE, main="Snow's Cholera Map with Pump Polygons")


SnowMap(density=TRUE)

```
