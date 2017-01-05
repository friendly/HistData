# function SnowMap and subfunctions, designed to make other explorations
# of Snow's cholera data possible

# draw the map with the pieces
SnowMap <- function(xlim=c(3,20), ylim=c(3,20), axis.labels=FALSE, 
                    main="Snow's Cholera Map of London",
                    scale=TRUE, polygons=FALSE, density=FALSE,
                    streets.args=list(col="grey", lwd=1),
                    deaths.args=list(col="red", pch=15, cex=0.6),
                    pumps.args=list(col="blue", pch=17, cex=1.5, cex.lab=0.9),
                    scale.args=list(xs=3.5, ys=19.7),
                    polygons.args=list(col=NA, border="brown", lwd=2, lty=1),
                    density.args=list(bandwidth=c(0.5,0.5), 
                                      col1=rgb(0,1,0,0),    # green
                                      col2=rgb(1,0,0,.8))
) {
	Splot(xlim=xlim, ylim=ylim, axis.labels=axis.labels, main=main)
	do.call("Sstreets", streets.args)
	if (density) do.call("Sdensity", density.args) 
	do.call("Sdeaths", deaths.args)
	do.call("Spumps", pumps.args)
	if (scale) do.call("Sscale", scale.args) #mapscale()
	if (polygons) do.call("Spolygons", polygons.args) #Spolygons()
}


# define some funtions to make the pieces re-usable

# setup basic Snow map plot
Splot <- function(xlim=c(3,20), ylim=c(3,20), 
				xlab="", ylab="", axis.labels=FALSE,
				main="Snow's Cholera Map of London") {
	# make CRAN checks happy
  Snow.deaths <- NULL   #immediately replaced on next line
  data(Snow.deaths, package = 'HistData', envir = environment())
	plot(Snow.deaths[,c("x","y")], type="n", asp=1,
		 	xlab=xlab, ylab=ylab, xlim=xlim, ylim=ylim,
		 	xaxt = if (axis.labels) "s" else "n",
		 	yaxt = if (axis.labels) "s" else "n",
		 	main=main)
}

# draw points for deaths
Sdeaths <- function(col="red", pch=15, cex=0.6) {
  # make CRAN checks happy
  Snow.deaths <- NULL   #immediately replaced on next line
  data(Snow.deaths, package = 'HistData', envir = environment())
  points(Snow.deaths[,c("x","y")], col=col, pch=pch, cex=cex)
	}

# function to plot and label the pump locations
Spumps <- function(col="blue", pch=17, cex=1.5, cex.lab=0.9)  {
  # make CRAN checks happy
  Snow.pumps <- NULL   #immediately replaced on next line
  data(Snow.pumps, package = 'HistData', envir = environment())
   points(Snow.pumps[,c("x","y")], col=col, pch=pch, cex=cex)
   text(Snow.pumps[,c("x","y")], labels=Snow.pumps$label, pos=1, cex=cex.lab)
}

# function to draw the streets 
Sstreets <- function(col="gray", lwd=1) {
  Snow.streets <- NULL   #immediately replaced on next line
  data(Snow.streets, package = 'HistData', envir = environment())
	slist <- split(Snow.streets[,c("x","y")],as.factor(Snow.streets[,"street"]))
	invisible(lapply(slist, lines, col=col, lwd=lwd))
}

# draw a scale showing distance in meters in upper left
Sscale <- function(xs=3.5, ys=19.7) {
   scale <- matrix(c(0,0, 4,0, NA, NA), nrow=3, ncol=2, byrow=TRUE)
   colnames(scale)<- c("x","y")
	# tick marks
   scale <- rbind(scale, expand.grid(y=c(-.1, .1, NA), x=0:4)[,2:1])
   lines(xs+scale[,1], ys+scale[,2])
	# value and axis labels
   stext <- matrix(c(0,0, 2,0, 4,0, 4, 0.1), nrow=4, ncol=2, byrow=TRUE)
   text(xs+stext[,1], ys+stext[,2], labels=c("0", "2", "4", "100 m."), pos=c(1,1,1,4), cex=0.8)
}

# draw the Thiessen polygon boundaries
# Spolygons <- function(col="brown", lwd=2, lty=1) {
#   # make CRAN checks happy
#   Snow.polygons <- NULL   #immediately replaced on next line
#   data(Snow.polygons, package = 'HistData', envir = environment())
# 	starts <- which(Snow.polygons$start==0)
# 	for(i in 1:length(starts)) {
# 		this <- starts[i]:(starts[i]+1)
# 		lines(Snow.polygons[this,2:3], col=col, lwd=lwd, lty=lty)
# 		}
# }

Spolygons <- function(col=NA, border="brown", lwd=2, lty=1) {
  #  Snow.polygons2 <- NULL   #immediately replaced on next line
  #  data(Snow.polygons2, package = 'HistData', envir = environment())
  polygons <- HistData::Snow.polygons
  np <- length(polygons)
  if (length(col) < np) col <- rep(col, length.out=np) 
  if (length(border) < np) border <- rep(border, length.out=np) 
  for(i in seq_along(polygons)) {
    coord <- polygons[[i]]
    polygon(coord$x, coord$y, col=col[i], border=border[i], lwd=lwd, lty=lty)
  }
}


# Plot a bivariate density estimate of deaths
Sdensity <- function(bandwidth=c(0.5,0.5), 
                     col1=rgb(0,1,0,0),    # green
                     col2=rgb(1,0,0,.8)    # red
                     ) {
	# require(KernSmooth)
  Snow.deaths <- NULL   #immediately replaced on next line
  data(Snow.deaths, package = 'HistData', envir = environment())
	kde2d <- KernSmooth::bkde2D(Snow.deaths[,2:3], bandwidth=bandwidth)	
	clrs <- grDevices::colorRampPalette(c(col1, col2), alpha = TRUE)(20)	
	graphics::contour(x=kde2d$x1, y=kde2d$x2,z=kde2d$fhat, add=TRUE)
	graphics::image(x=kde2d$x1, y=kde2d$x2,z=kde2d$fhat, add=TRUE, col=clrs)
}

TESTME <- FALSE
if (TESTME) {
library(HistData)
SnowMap()
SnowMap(axis.labels=TRUE)
SnowMap(deaths.args=list(col="darkgreen"))

SnowMap(polygons=TRUE, main="Snow's Cholera Map with Pump Polygons")

SnowMap(density=TRUE)


# zoom in a bit and add annotations
op <- par(mar=c(1,1,3,1)+.1)
SnowMap(xlim=c(7.5,16.5), ylim=c(7,16), polygons=TRUE,
        main="Snow's Cholera Map, Enhanced")
Sdensity()
Spumps()   # replot pumps to make them more visible
par(op)

# create documentation
obj <- c("SnowMap", "Splot", "Sdeaths", "Spumps", "Sstreets", "Sscale", "Spolygons", "Sdensity")

SoDA::promptAll(obj)

}


