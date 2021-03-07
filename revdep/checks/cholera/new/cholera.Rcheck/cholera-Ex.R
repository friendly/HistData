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
### Title: Add observed case(s).
### Aliases: addCase

### ** Examples

snowMap(add.cases = FALSE)
addCase(1)

snowMap(add.cases = FALSE)
addCase(100)



cleanEx()
nameEx("addDelauny")
### * addDelauny

flush(stderr()); flush(stdout())

### Name: addDelauny
### Title: Add Delauny triangles.
### Aliases: addDelauny

### ** Examples

snowMap()
addDelauny()



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




cleanEx()
nameEx("addNeighborhoodEuclidean")
### * addNeighborhoodEuclidean

flush(stderr()); flush(stdout())

### Name: addNeighborhoodEuclidean
### Title: Add expected Euclidean pump neighborhoods.
### Aliases: addNeighborhoodEuclidean

### ** Examples




cleanEx()
nameEx("addNeighborhoodWalking")
### * addNeighborhoodWalking

flush(stderr()); flush(stdout())

### Name: addNeighborhoodWalking
### Title: Add expected walking neighborhoods.
### Aliases: addNeighborhoodWalking

### ** Examples




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




cleanEx()
nameEx("addVoronoi")
### * addVoronoi

flush(stderr()); flush(stdout())

### Name: addVoronoi
### Title: Add Voronoi cells.
### Aliases: addVoronoi

### ** Examples

snowMap()
addVoronoi()



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
nameEx("classifierAudit")
### * classifierAudit

flush(stderr()); flush(stdout())

### Name: classifierAudit
### Title: Test if case is orthogonal to segment.
### Aliases: classifierAudit

### ** Examples

classifierAudit(case = 483, segment = "326-2")
plot(classifierAudit(case = 483, segment = "326-2"))



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
nameEx("neighborhoodEuclidean")
### * neighborhoodEuclidean

flush(stderr()); flush(stdout())

### Name: neighborhoodEuclidean
### Title: Compute Euclidean path pump neighborhoods.
### Aliases: neighborhoodEuclidean

### ** Examples




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




cleanEx()
nameEx("pearsonResiduals")
### * pearsonResiduals

flush(stderr()); flush(stdout())

### Name: pearsonResiduals
### Title: Compute Pearson Residuals (prototype)
### Aliases: pearsonResiduals

### ** Examples




cleanEx()
nameEx("plot.classifier_audit")
### * plot.classifier_audit

flush(stderr()); flush(stdout())

### Name: plot.classifier_audit
### Title: Plot result of classifierAudit().
### Aliases: plot.classifier_audit

### ** Examples

plot(classifierAudit(case = 483, segment = "326-2"))



cleanEx()
nameEx("plot.euclidean")
### * plot.euclidean

flush(stderr()); flush(stdout())

### Name: plot.euclidean
### Title: Plot method for neighborhoodEuclidean().
### Aliases: plot.euclidean

### ** Examples




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




cleanEx()
nameEx("plot.walking_path")
### * plot.walking_path

flush(stderr()); flush(stdout())

### Name: plot.walking_path
### Title: Plot the walking path between selected cases and/or pumps.
### Aliases: plot.walking_path

### ** Examples




cleanEx()
nameEx("print.classifier_audit")
### * print.classifier_audit

flush(stderr()); flush(stdout())

### Name: print.classifier_audit
### Title: Return result of classifierAudit().
### Aliases: print.classifier_audit

### ** Examples

classifierAudit(case = 483, segment = "326-2")
print(classifierAudit(case = 483, segment = "326-2"))



cleanEx()
nameEx("print.euclidean")
### * print.euclidean

flush(stderr()); flush(stdout())

### Name: print.euclidean
### Title: Print method for neighborhoodEuclidean().
### Aliases: print.euclidean

### ** Examples




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




cleanEx()
nameEx("print.walking_path")
### * print.walking_path

flush(stderr()); flush(stdout())

### Name: print.walking_path
### Title: Print method for walkingPath().
### Aliases: print.walking_path

### ** Examples




cleanEx()
nameEx("profile2D")
### * profile2D

flush(stderr()); flush(stdout())

### Name: profile2D
### Title: 2D Profile .
### Aliases: profile2D

### ** Examples




cleanEx()
nameEx("profile3D")
### * profile3D

flush(stderr()); flush(stdout())

### Name: profile3D
### Title: 3D Profile.
### Aliases: profile3D

### ** Examples




cleanEx()
nameEx("pumpCase")
### * pumpCase

flush(stderr()); flush(stdout())

### Name: pumpCase
### Title: Extract numeric case IDs by pump neighborhood.
### Aliases: pumpCase

### ** Examples




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

summary(neighborhoodEuclidean())



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
### Title: Extract vertices of Delauny triangles and Dirichelet (Voronoi)
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
