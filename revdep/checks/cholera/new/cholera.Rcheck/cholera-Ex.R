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
### Title: Add observed cases by neighborhood.
### Aliases: addNeighborhoodCases

### ** Examples

## Not run: 
##D snowMap(add.cases = FALSE)
##D addNeighborhoodCases(pump.subset = c(6, 10))
##D 
##D snowMap(add.cases = FALSE)
##D addNeighborhoodCases(pump.select = c(6, 10))
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
##D streetNameLocator("marshall street", zoom = 0.5, highlight = FALSE,
##D   add.subtitle = FALSE)
##D addNeighborhoodEuclidean(type = "area.points")
## End(Not run)



cleanEx()
nameEx("addNeighborhoodWalking")
### * addNeighborhoodWalking

flush(stderr()); flush(stdout())

### Name: addNeighborhoodWalking
### Title: Add expected walking neighborhoods.
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
nameEx("addSnow")
### * addSnow

flush(stderr()); flush(stdout())

### Name: addSnow
### Title: Adds Snow's graphical annotation of the Broad Street pump
###   walking neighborhood.
### Aliases: addSnow

### ** Examples

## Not run: 
##D plot(neighborhoodVoronoi())
##D addSnow()
## End(Not run)



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
nameEx("addWalkingPath")
### * addWalkingPath

flush(stderr()); flush(stdout())

### Name: addWalkingPath
### Title: Add the shortest walking path between a selected cases or pumps.
### Aliases: addWalkingPath

### ** Examples

streetNameLocator("broad street", zoom = TRUE, highlight = FALSE,
  add.subtitle = FALSE)
addWalkingPath(447)



cleanEx()
nameEx("addWhitehead")
### * addWhitehead

flush(stderr()); flush(stdout())

### Name: addWhitehead
### Title: Add Rev. Henry Whitehead's Broad Street pump neighborhood.
### Aliases: addWhitehead

### ** Examples

snowMap(add.landmarks = FALSE)
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



cleanEx()
nameEx("euclideanPath")
### * euclideanPath

flush(stderr()); flush(stdout())

### Name: euclideanPath
### Title: Compute path of the Euclidean distance between cases and/or
###   pumps.
### Aliases: euclideanPath

### ** Examples

# path from case 1 to nearest pump.
euclideanPath(1)

# path from pump 1 to nearest case.
euclideanPath(NULL, 1)

# path from case 1 to pump 6.
euclideanPath(1, 6)

# exclude pump 7 from consideration.
euclideanPath(1, -7)

# path from case 1 to case 6.
euclideanPath(1, 6, type = "cases")

# path from pump 1 to pump 6.
euclideanPath(1, 6, type = "pumps")

# compute multiple cases.
lapply(1:3, euclideanPath)

# plot path
plot(euclideanPath(1))



cleanEx()
nameEx("latlongVoronoi")
### * latlongVoronoi

flush(stderr()); flush(stdout())

### Name: latlongVoronoi
### Title: Compute Georeferenced Latitude and Longitude of vertices of
###   Voronoi polygons.
### Aliases: latlongVoronoi

### ** Examples

snowMap(latlong = TRUE)
cells <- latlongVoronoi()
invisible(lapply(cells, function(x) polygon(x[, c("lon", "lat")])))



cleanEx()
nameEx("neighborhoodEuclidean")
### * neighborhoodEuclidean

flush(stderr()); flush(stdout())

### Name: neighborhoodEuclidean
### Title: Compute Euclidean path pump neighborhoods.
### Aliases: neighborhoodEuclidean

### ** Examples

## Not run: 
##D neighborhoodEuclidean()
##D neighborhoodEuclidean(-6)
##D neighborhoodEuclidean(pump.select = 6:7)
## End(Not run)



cleanEx()
nameEx("neighborhoodVoronoi")
### * neighborhoodVoronoi

flush(stderr()); flush(stdout())

### Name: neighborhoodVoronoi
### Title: Compute Voronoi pump neighborhoods.
### Aliases: neighborhoodVoronoi

### ** Examples

neighborhoodVoronoi()
neighborhoodVoronoi(vestry = TRUE)
neighborhoodVoronoi(pump.select = 6:7)
neighborhoodVoronoi(pump.select = -6)
neighborhoodVoronoi(pump.select = -6, polygon.vertices = TRUE)

# coordinates for vertices also available in the returned object.
dat <- neighborhoodVoronoi(pump.select = -6)
dat$coordinates



cleanEx()
nameEx("neighborhoodWalking")
### * neighborhoodWalking

flush(stderr()); flush(stdout())

### Name: neighborhoodWalking
### Title: Compute walking path pump neighborhoods.
### Aliases: neighborhoodWalking

### ** Examples

## Not run: 
##D neighborhoodWalking()
##D neighborhoodWalking(pump.select = -6)
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
nameEx("plot.euclidean_path")
### * plot.euclidean_path

flush(stderr()); flush(stdout())

### Name: plot.euclidean_path
### Title: Plot the path of the Euclidean distance between cases and/or
###   pumps.
### Aliases: plot.euclidean_path

### ** Examples

plot(euclideanPath(15))
plot(euclideanPath(15), unit.posts = "time")



cleanEx()
nameEx("plot.neighborhood_data")
### * plot.neighborhood_data

flush(stderr()); flush(stdout())

### Name: plot.neighborhood_data
### Title: Plot method for neighborhoodData().
### Aliases: plot.neighborhood_data

### ** Examples




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
nameEx("plot.voronoi")
### * plot.voronoi

flush(stderr()); flush(stdout())

### Name: plot.voronoi
### Title: Plot Voronoi neighborhoods.
### Aliases: plot.voronoi

### ** Examples

plot(neighborhoodVoronoi())



cleanEx()
nameEx("plot.walking")
### * plot.walking

flush(stderr()); flush(stdout())

### Name: plot.walking
### Title: Plot method for neighborhoodWalking().
### Aliases: plot.walking

### ** Examples

## Not run: 
##D plot(neighborhoodWalking())
##D plot(neighborhoodWalking(case.set = "expected"))
##D plot(neighborhoodWalking(case.set = "expected"), type = "area.points")
##D plot(neighborhoodWalking(case.set = "expected"), type = "area.polygons")
## End(Not run)



cleanEx()
nameEx("plot.walking_path")
### * plot.walking_path

flush(stderr()); flush(stdout())

### Name: plot.walking_path
### Title: Plot the walking path between selected cases and/or pumps.
### Aliases: plot.walking_path

### ** Examples

## Not run: 
##D plot(walkingPath(15))
##D plot(walkingPath(15), unit.posts = "time")
## End(Not run)



cleanEx()
nameEx("plot.winterTemperatures")
### * plot.winterTemperatures

flush(stderr()); flush(stdout())

### Name: plot.winterTemperatures
### Title: Plot method for winterTemperatures().
### Aliases: plot.winterTemperatures

### ** Examples

plot(winterTemperatures())



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
nameEx("print.euclidean_path")
### * print.euclidean_path

flush(stderr()); flush(stdout())

### Name: print.euclidean_path
### Title: Print method for euclideanPath().
### Aliases: print.euclidean_path

### ** Examples

euclideanPath(1)
print(euclideanPath(1))



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
nameEx("print.voronoi")
### * print.voronoi

flush(stderr()); flush(stdout())

### Name: print.voronoi
### Title: Print method for neighborhoodVoronoi().
### Aliases: print.voronoi

### ** Examples

neighborhoodVoronoi()
print(neighborhoodVoronoi())



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
nameEx("print.walking_path")
### * print.walking_path

flush(stderr()); flush(stdout())

### Name: print.walking_path
### Title: Print method for walkingPath().
### Aliases: print.walking_path

### ** Examples

## Not run: 
##D walkingPath()
##D print(walkingPath())
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
##D profile2D(angle = 30, type = "ggplot2")
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
##D pumpFatalities(metric = "euclidean")
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
nameEx("segmentLength")
### * segmentLength

flush(stderr()); flush(stdout())

### Name: segmentLength
### Title: Compute length of road segment.
### Aliases: segmentLength

### ** Examples

segmentLength("242-1")
segmentLength("242-1", distance.unit = "yard")



cleanEx()
nameEx("segmentLocator")
### * segmentLocator

flush(stderr()); flush(stdout())

### Name: segmentLocator
### Title: Locate road segment by ID.
### Aliases: segmentLocator

### ** Examples

segmentLocator("190-1")
segmentLocator("216-1")
segmentLocator("216-1", distance.unit = "yard")



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
### Title: Locate road by name.
### Aliases: streetNameLocator

### ** Examples

streetNameLocator("Oxford Street")
streetNameLocator("oxford street")
streetNameLocator("Cambridge Street", zoom = TRUE)
streetNameLocator("Cambridge Street", zoom = 0.5)



cleanEx()
nameEx("streetNumberLocator")
### * streetNumberLocator

flush(stderr()); flush(stdout())

### Name: streetNumberLocator
### Title: Locate road by numerical ID.
### Aliases: streetNumberLocator

### ** Examples

streetNumberLocator(243)
streetNumberLocator(243, zoom = TRUE)
streetNumberLocator(243, zoom = 0.5)



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
nameEx("summary.voronoi")
### * summary.voronoi

flush(stderr()); flush(stdout())

### Name: summary.voronoi
### Title: Summary method for neighborhoodVoronoi().
### Aliases: summary.voronoi

### ** Examples

summary(neighborhoodVoronoi())



cleanEx()
nameEx("summary.walking")
### * summary.walking

flush(stderr()); flush(stdout())

### Name: summary.walking
### Title: Summary method for neighborhoodWalking().
### Aliases: summary.walking

### ** Examples

## Not run: 
##D summary(neighborhoodWalking())
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



cleanEx()
nameEx("walkingPath")
### * walkingPath

flush(stderr()); flush(stdout())

### Name: walkingPath
### Title: Compute the shortest walking path between cases and/or pumps.
### Aliases: walkingPath

### ** Examples

## Not run: 
##D # path from case 1 to nearest pump.
##D walkingPath(1)
##D 
##D # path from pump 1 to nearest case.
##D walkingPath(NULL, 1)
##D 
##D # path from case 1 to pump 6.
##D walkingPath(1, 6)
##D 
##D # exclude pump 7 from consideration.
##D walkingPath(1, -7)
##D 
##D # path from case 1 to case 6.
##D walkingPath(1, 6, type = "cases")
##D 
##D # path from pump 1 to pump 6.
##D walkingPath(1, 6, type = "pumps")
##D 
##D # for multiple cases.
##D lapply(1:3, walkingPath)
##D 
##D # path from case 1 to nearest pump.
##D plot(walkingPath(1))
##D 
##D # path from John Snow's residence to Broad Street pump.
##D plot(walkingPath("John Snow", 7))
## End(Not run)



cleanEx()
nameEx("winterTemperatures")
### * winterTemperatures

flush(stderr()); flush(stdout())

### Name: winterTemperatures
### Title: Average Winter Temperatures.
### Aliases: winterTemperatures

### ** Examples

plot(winterTemperatures(), "1859-6-1")



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
