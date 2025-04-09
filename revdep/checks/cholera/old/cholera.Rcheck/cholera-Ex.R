pkgname <- "cholera"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('cholera')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("addCase")
### * addCase

flush(stderr()); flush(stdout())

### Name: addCase
### Title: Add observed case(s) to plot.
### Aliases: addCase

### ** Examples

snowMap(add.cases = FALSE)
addCase(1)

snowMap(add.cases = FALSE)
addCase(100)



cleanEx()
nameEx("addDelaunay")
### * addDelaunay

flush(stderr()); flush(stdout())

### Name: addDelaunay
### Title: Add Delaunay triangles.
### Aliases: addDelaunay

### ** Examples

snowMap()
addDelaunay()



cleanEx()
nameEx("addIndexCase")
### * addIndexCase

flush(stderr()); flush(stdout())

### Name: addIndexCase
### Title: Highlight index case at 40 Broad Street.
### Aliases: addIndexCase

### ** Examples

segmentLocator("216-1")
addIndexCase()



cleanEx()
nameEx("addKernelDensity")
### * addKernelDensity

flush(stderr()); flush(stdout())

### Name: addKernelDensity
### Title: Add 2D kernel density contours.
### Aliases: addKernelDensity

### ** Examples

## Not run: 
##D snowMap()
##D addKernelDensity()
##D 
##D snowMap()
##D addKernelDensity("individual")
##D 
##D snowMap()
##D addKernelDensity(c(6, 8))
##D 
##D snowMap()
##D addKernelDensity(pump.select = c(6, 8))
## End(Not run)



cleanEx()
nameEx("addLandmarkSquares")
### * addLandmarkSquares

flush(stderr()); flush(stdout())

### Name: addLandmarkSquares
### Title: Add Golden and Soho Squares to plot.
### Aliases: addLandmarkSquares

### ** Examples

snowMap()
addLandmarkSquares()



cleanEx()
nameEx("addLandmarks")
### * addLandmarks

flush(stderr()); flush(stdout())

### Name: addLandmarks
### Title: Add landmarks to plot.
### Aliases: addLandmarks

### ** Examples

snowMap(add.landmarks = FALSE)
addLandmarks()



cleanEx()
nameEx("addNeighborhoodCases")
### * addNeighborhoodCases

flush(stderr()); flush(stdout())

### Name: addNeighborhoodCases
### Title: Add observed neighborhood cases.
### Aliases: addNeighborhoodCases

### ** Examples

## Not run: 
##D snowMap(add.cases = FALSE)
##D addNeighborhoodCases()
##D 
##D snowMap(add.cases = FALSE)
##D addNeighborhoodCases(pump.subset = c(6, 10))
##D 
##D snowMap(add.cases = FALSE)
##D addNeighborhoodCases(pump.select = c(6, 10))
##D 
##D snowMap(add.cases = FALSE, latlong = TRUE)
##D addNeighborhoodCases(latlong = TRUE)
##D 
##D snowMap(add.cases = FALSE, latlong = TRUE)
##D addNeighborhoodCases(pump.subset = c(6, 10), latlong = TRUE)
##D 
##D snowMap(add.cases = FALSE, latlong = TRUE)
##D addNeighborhoodCases(pump.select = c(6, 10), latlong = TRUE)
## End(Not run)



cleanEx()
nameEx("addNeighborhoodEuclidean")
### * addNeighborhoodEuclidean

flush(stderr()); flush(stdout())

### Name: addNeighborhoodEuclidean
### Title: Add expected Euclidean pump neighborhoods.
### Aliases: addNeighborhoodEuclidean

### ** Examples

## Not run: 
##D streetNameLocator("marshall street", zoom = 0.5, highlight = FALSE,
##D   add.subtitle = FALSE)
##D addNeighborhoodEuclidean()
##D 
##D streetNameLocator("marshall street", zoom = -50, highlight = FALSE)
##D addNeighborhoodEuclidean(case.set = "expected", type = "area.polygons")
## End(Not run)



cleanEx()
nameEx("addNeighborhoodSnow")
### * addNeighborhoodSnow

flush(stderr()); flush(stdout())

### Name: addNeighborhoodSnow
### Title: Adds Snow's graphical annotation of the Broad Street pump
###   walking neighborhood.
### Aliases: addNeighborhoodSnow

### ** Examples

## Not run: 
##D plot(neighborhoodVoronoi())
##D addNeighborhoodSnow()
## End(Not run)



cleanEx()
nameEx("addNeighborhoodWalking")
### * addNeighborhoodWalking

flush(stderr()); flush(stdout())

### Name: addNeighborhoodWalking
### Title: Add walking neighborhoods.
### Aliases: addNeighborhoodWalking

### ** Examples

## Not run: 
##D streetNameLocator("marshall street", zoom = 0.5)
##D addNeighborhoodWalking()
## End(Not run)



cleanEx()
nameEx("addPlaguePit")
### * addPlaguePit

flush(stderr()); flush(stdout())

### Name: addPlaguePit
### Title: Add plague pit (Marshall Street).
### Aliases: addPlaguePit

### ** Examples

snowMap(add.landmarks = FALSE)
addPlaguePit()



cleanEx()
nameEx("addVoronoi")
### * addVoronoi

flush(stderr()); flush(stdout())

### Name: addVoronoi
### Title: Add Voronoi cells.
### Aliases: addVoronoi

### ** Examples

snowMap()
# addVoronoi()



cleanEx()
nameEx("addWhitehead")
### * addWhitehead

flush(stderr()); flush(stdout())

### Name: addWhitehead
### Title: Add Rev. Henry Whitehead's Broad Street pump neighborhood.
### Aliases: addWhitehead

### ** Examples

snowMap()
addWhitehead()



cleanEx()
nameEx("caseLocator")
### * caseLocator

flush(stderr()); flush(stdout())

### Name: caseLocator
### Title: Locate case by numerical ID.
### Aliases: caseLocator

### ** Examples

caseLocator(290)
caseLocator(290, zoom = TRUE)
caseLocator(290, observed = FALSE)
caseLocator(290, latlong = TRUE, zoom = TRUE)



cleanEx()
nameEx("neighborhoodVoronoi")
### * neighborhoodVoronoi

flush(stderr()); flush(stdout())

### Name: neighborhoodVoronoi
### Title: Compute Voronoi pump neighborhoods.
### Aliases: neighborhoodVoronoi

### ** Examples

## Not run: 
##D neighborhoodVoronoi()
##D neighborhoodVoronoi(vestry = TRUE)
##D neighborhoodVoronoi(pump.select = 6:7)
##D neighborhoodVoronoi(pump.select = -6)
##D neighborhoodVoronoi(pump.select = -6, polygon.vertices = TRUE)
##D 
##D # coordinates for vertices also available in the returned object.
##D dat <- neighborhoodVoronoi(pump.select = -6)
##D dat$coordinates
## End(Not run)



cleanEx()
nameEx("pearsonResiduals")
### * pearsonResiduals

flush(stderr()); flush(stdout())

### Name: pearsonResiduals
### Title: Compute Pearson Residuals (prototype)
### Aliases: pearsonResiduals

### ** Examples

## Not run: 
##D pearsonResiduals(neighborhoodEuclidean())
##D pearsonResiduals(neighborhoodVoronoi())
##D pearsonResiduals(neighborhoodWalking())
## End(Not run)



cleanEx()
nameEx("plot.euclidean")
### * plot.euclidean

flush(stderr()); flush(stdout())

### Name: plot.euclidean
### Title: Plot method for neighborhoodEuclidean().
### Aliases: plot.euclidean

### ** Examples

## Not run: 
##D plot(neighborhoodEuclidean())
##D plot(neighborhoodEuclidean(-6))
##D plot(neighborhoodEuclidean(pump.select = 6:7))
##D plot(neighborhoodEuclidean(case.set = "expected"), type = "area.points")
##D plot(neighborhoodEuclidean(case.set = "expected"), type = "area.polygons")
## End(Not run)



cleanEx()
nameEx("plot.time_series")
### * plot.time_series

flush(stderr()); flush(stdout())

### Name: plot.time_series
### Title: Plot aggregate time series data from Vestry report.
### Aliases: plot.time_series

### ** Examples

plot(timeSeries())
plot(timeSeries(), statistic = "deaths")
plot(timeSeries(), bty = "n", type = "h", lwd = 4)



cleanEx()
nameEx("print.euclidean")
### * print.euclidean

flush(stderr()); flush(stdout())

### Name: print.euclidean
### Title: Print method for neighborhoodEuclidean().
### Aliases: print.euclidean

### ** Examples

## Not run: 
##D neighborhoodEuclidean()
##D print(neighborhoodEuclidean())
## End(Not run)



cleanEx()
nameEx("print.euclideanLatlong")
### * print.euclideanLatlong

flush(stderr()); flush(stdout())

### Name: print.euclideanLatlong
### Title: Print method for neighborhoodEuclidean(latlong = TRUE).
### Aliases: print.euclideanLatlong

### ** Examples

## Not run: 
##D neighborhoodEuclidean(latlong = TRUE)
##D print(neighborhoodEuclidean(latlong = TRUE))
## End(Not run)



cleanEx()
nameEx("print.time_series")
### * print.time_series

flush(stderr()); flush(stdout())

### Name: print.time_series
### Title: Print summary data for timeSeries().
### Aliases: print.time_series

### ** Examples

timeSeries()
print(timeSeries())



cleanEx()
nameEx("print.walking")
### * print.walking

flush(stderr()); flush(stdout())

### Name: print.walking
### Title: Print method for neighborhoodWalking().
### Aliases: print.walking

### ** Examples

## Not run: 
##D neighborhoodWalking()
##D print(neighborhoodWalking())
## End(Not run)



cleanEx()
nameEx("profile2D")
### * profile2D

flush(stderr()); flush(stdout())

### Name: profile2D
### Title: 2D Profile .
### Aliases: profile2D

### ** Examples

## Not run: 
##D profile2D(angle = 30)
##D profile2D(angle = 30, graphics = "ggplot2")
## End(Not run)



cleanEx()
nameEx("profile3D")
### * profile3D

flush(stderr()); flush(stdout())

### Name: profile3D
### Title: 3D Profile.
### Aliases: profile3D

### ** Examples

## Not run: 
##D profile3D(pump.select = 6:7)
##D profile3D(pump.subset = -7)
##D profile3D(pump.subset = -7, drop.neg.subset = TRUE)
## End(Not run)



cleanEx()
nameEx("pumpCase")
### * pumpCase

flush(stderr()); flush(stdout())

### Name: pumpCase
### Title: Extract numeric case IDs by pump neighborhood.
### Aliases: pumpCase

### ** Examples

## Not run: 
##D pumpCase(neighborhoodEuclidean())
##D pumpCase(neighborhoodVoronoi())
##D pumpCase(neighborhoodWalking())
## End(Not run)



cleanEx()
nameEx("pumpFatalities")
### * pumpFatalities

flush(stderr()); flush(stdout())

### Name: pumpFatalities
### Title: Compute fatalities by pump.
### Aliases: pumpFatalities

### ** Examples

## Not run: 
##D pumpFatalities(pump.select = -7)
##D pumpFatalities(latlong = TRUE)
##D pumpFatalities(metric = "euclidean", vestry = TRUE)
## End(Not run)



cleanEx()
nameEx("pumpLocator")
### * pumpLocator

flush(stderr()); flush(stdout())

### Name: pumpLocator
### Title: Locate water pump by numerical ID.
### Aliases: pumpLocator

### ** Examples

pumpLocator()
pumpLocator(zoom = TRUE)
pumpLocator(14, vestry = TRUE, zoom = TRUE)



cleanEx()
nameEx("segmentHighlight")
### * segmentHighlight

flush(stderr()); flush(stdout())

### Name: segmentHighlight
### Title: Highlight segment by ID.
### Aliases: segmentHighlight

### ** Examples

streetNameLocator("Soho Square", zoom = TRUE, highlight = FALSE)
ids <- road.segments[road.segments$name == "Soho Square", "id"]
invisible(lapply(ids, function(x) segmentHighlight(x, highlight = FALSE)))



cleanEx()
nameEx("segmentLocator")
### * segmentLocator

flush(stderr()); flush(stdout())

### Name: segmentLocator
### Title: Plot/Locate road segment by ID.
### Aliases: segmentLocator

### ** Examples

segmentLocator("216-1")
segmentLocator("216-1", zoom = -10)
segmentLocator("216-1", latlong = TRUE, zoom = -10)
segmentLocator("216-1", distance.unit = "yard")
segmentLocator("216-1", zoom = FALSE)



cleanEx()
nameEx("sim.pump.case")
### * sim.pump.case

flush(stderr()); flush(stdout())

### Name: sim.pump.case
### Title: List of "simulated" fatalities grouped by walking-distance pump
###   neighborhood.
### Aliases: sim.pump.case
### Keywords: datasets

### ** Examples

## Not run: 
##D pumpCase(neighborhoodWalking(case.set = "expected"))
## End(Not run)



cleanEx()
nameEx("snowMap")
### * snowMap

flush(stderr()); flush(stdout())

### Name: snowMap
### Title: Plot John Snow's cholera map.
### Aliases: snowMap

### ** Examples

snowMap()
snowMap(vestry = TRUE, stacked = FALSE)



cleanEx()
nameEx("streetHighlight")
### * streetHighlight

flush(stderr()); flush(stdout())

### Name: streetHighlight
### Title: Highlight road by name.
### Aliases: streetHighlight

### ** Examples

snowMap()
streetHighlight("Broad Street")



cleanEx()
nameEx("streetLength")
### * streetLength

flush(stderr()); flush(stdout())

### Name: streetLength
### Title: Compute length of selected street.
### Aliases: streetLength

### ** Examples

streetLength("Oxford Street")
streetLength("oxford street")
streetLength("oxford street", distance.unit = "yard")



cleanEx()
nameEx("streetNameLocator")
### * streetNameLocator

flush(stderr()); flush(stdout())

### Name: streetNameLocator
### Title: Locate street(s) by name(s).
### Aliases: streetNameLocator

### ** Examples

streetNameLocator("broad street")
streetNameLocator("Broad Street", zoom = -10)
streetNameLocator("Broad Street", latlong = TRUE, zoom = -10)
streetNameLocator("Broad Street", distance.unit = "yard")
streetNameLocator("Broad Street", zoom = FALSE)



cleanEx()
nameEx("streetNumberLocator")
### * streetNumberLocator

flush(stderr()); flush(stdout())

### Name: streetNumberLocator
### Title: Locate street by its numerical ID.
### Aliases: streetNumberLocator

### ** Examples

streetNumberLocator(216)
streetNumberLocator(216, zoom = -10)
streetNumberLocator(216, latlong = TRUE, zoom = -10)
streetNumberLocator(216, distance.unit = "yard")
streetNumberLocator(216, zoom = FALSE)



cleanEx()
nameEx("summary.euclidean")
### * summary.euclidean

flush(stderr()); flush(stdout())

### Name: summary.euclidean
### Title: Summary method for neighborhoodEuclidean().
### Aliases: summary.euclidean

### ** Examples

## Not run: 
##D summary(neighborhoodEuclidean())
## End(Not run)



cleanEx()
nameEx("timeSeries")
### * timeSeries

flush(stderr()); flush(stdout())

### Name: timeSeries
### Title: Aggregate time series fatality data from the Vestry report.
### Aliases: timeSeries

### ** Examples

timeSeries(vestry = TRUE)
plot(timeSeries())



cleanEx()
nameEx("voronoiPolygons")
### * voronoiPolygons

flush(stderr()); flush(stdout())

### Name: voronoiPolygons
### Title: Extract vertices of Delaunay triangles and Dirichelet (Voronoi)
###   tiles.
### Aliases: voronoiPolygons

### ** Examples

snowMap()
voronoiPolygons(pumps, output = "polygons")

snowMap()
voronoiPolygons(pumps, roads, output = "polygons")

snowMap()
voronoiPolygons(pumps, roads, type = "triangles", output = "polygons")

vertices <- voronoiPolygons(pumps, roads)
snow.colors <- grDevices::adjustcolor(snowColors(), alpha.f = 1/3)
snowMap(add.cases = FALSE)
invisible(lapply(seq_along(vertices), function(i) {
  polygon(vertices[[i]], col = snow.colors[[i]])
}))



### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
