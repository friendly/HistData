pkgname <- "ibawds"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('ibawds')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("cluster_with_centers")
### * cluster_with_centers

flush(stderr()); flush(stdout())

### Name: cluster_with_centers
### Title: Cluster Data According to Centres and Recompute Centres
### Aliases: cluster_with_centers init_rand_centers

### ** Examples

# demonstrate k-means with iris data
# keep the relevant columns
iris2 <- iris[, c("Sepal.Length", "Petal.Length")]

# initialise the cluster centres
clust <- init_rand_centers(iris2, n = 3, seed = 2435)

# plot the data with the cluster centres
library(ggplot2)
ggplot(iris2, aes(x = Sepal.Length, y = Petal.Length)) +
 geom_point(data = clust$centers, aes(colour = factor(1:3)),
            shape = 18, size = 6) +
 geom_point() +
 scale_colour_brewer(palette = "Set1")

# assign clusters and compute new centres
clust_new <- cluster_with_centers(iris2, clust$centers)

# plot the data with clustering
clust$cluster <- clust_new$cluster
voronoi_diagram(clust, x = "Sepal.Length", y = "Petal.Length",
                data = iris2)

# plot the data with new cluster centres
clust$centers <- clust_new$centers
voronoi_diagram(clust, x = "Sepal.Length", y = "Petal.Length",
                data = iris2, colour_data = FALSE)

# this procedure may be repeated until the algorithm converges




cleanEx()
nameEx("cran_history")
### * cran_history

flush(stderr()); flush(stdout())

### Name: cran_history
### Title: History of the Number of Available CRAN Packages
### Aliases: cran_history
### Keywords: datasets

### ** Examples

library(ggplot2)
ggplot(cran_history, aes(x = date, y = n_packages)) +
  geom_point()




cleanEx()
nameEx("define_latex_stats")
### * define_latex_stats

flush(stderr()); flush(stdout())

### Name: define_latex_stats
### Title: Define LaTeX commands for statistical symbols
### Aliases: define_latex_stats

### ** Examples

## Not run: 
##D # add this code chunk to a RMarkdown document
##D ```{r results = "asis", echo = FALSE}
##D   define_latex_stats()
##D ```
## End(Not run)




cleanEx()
nameEx("dice_data")
### * dice_data

flush(stderr()); flush(stdout())

### Name: dice_data
### Title: Simulated Dice Throws
### Aliases: dice_data
### Keywords: datasets

### ** Examples

# the numeric vectors differ in length
lengths(dice_data)

# compute the mean for each dice
sapply(dice_data, mean)

# look at the contingency table for dice 3
table(dice_data$d3)




cleanEx()
nameEx("distribution_plot")
### * distribution_plot

flush(stderr()); flush(stdout())

### Name: distribution_plot
### Title: Plot Density and Distribution Function With Markings
### Aliases: distribution_plot density_plot

### ** Examples

# plot density of the normal distribution
density_plot(dnorm, c(-5, 7),
             mean = 1, sd = 2,
             to = 3)

# plot distribution function of the Poisson distribution
distribution_plot(ppois, c(0, 12),
                  lambda = 4,
                  points = c(2, 6, 10),
                  var = "y")




cleanEx()
nameEx("find_similar_colour")
### * find_similar_colour

flush(stderr()); flush(stdout())

### Name: find_similar_colour
### Title: Find a Named Colour that is Similar to Any Given Colour
### Aliases: find_similar_colour

### ** Examples

find_similar_colour("#d339da")
find_similar_colour(c(124, 34, 201))

# suppress additional output
find_similar_colour("#85d3a1", verbose = FALSE)

# use Manhattan distance
find_similar_colour(c(124, 34, 201), distance = "manhattan")




cleanEx()
nameEx("rand_with_cor")
### * rand_with_cor

flush(stderr()); flush(stdout())

### Name: rand_with_cor
### Title: Create a Random Vector With Fixed Correlation With Another
###   Vector
### Aliases: rand_with_cor

### ** Examples

x <- runif(1000, 5, 8)

# create a random vector with positive correlation
y1 <- rand_with_cor(x, 0.8)
all.equal(cor(x, y1), 0.8)

# create a random vector with negative correlation
# and fixed mean and standard deviation
y2 <- rand_with_cor(x, -0.3, 2, 3)
all.equal(cor(x, y2), -0.3)
all.equal(mean(y2), 2)
all.equal(sd(y2), 3)




cleanEx()
nameEx("rescale")
### * rescale

flush(stderr()); flush(stdout())

### Name: rescale
### Title: Rescale Mean And/Or Standard Deviation of a Vector
### Aliases: rescale

### ** Examples

x <- runif(1000, 5, 8)

# calling rescale without specifying mu and sigma doesn't change anything
all.equal(x, rescale(x))

# change the mean without changing the standard deviation
x1 <- rescale(x, mu = 3)
all.equal(mean(x1), 3)
all.equal(sd(x1), sd(x))

# rescale mean and standard deviation
x2 <- rescale(x, mu = 3, sigma = 2)
all.equal(mean(x2), 3)
all.equal(sd(x2), 2)




cleanEx()
nameEx("throw_dice")
### * throw_dice

flush(stderr()); flush(stdout())

### Name: throw_dice
### Title: Simulate Throws With One Or More Fair Dice
### Aliases: throw_dice

### ** Examples

# throw a single 6-sided dice 5 times
throw_dice(5)

# throw a single 20-sided dice 7 times
throw_dice(7, faces = 20)

# throw two 6-sided dice 9 times
throw_dice(9, dice = 2)




cleanEx()
nameEx("voronoi_diagram")
### * voronoi_diagram

flush(stderr()); flush(stdout())

### Name: voronoi_diagram
### Title: Create a Voronoi Diagram for a Clustering
### Aliases: voronoi_diagram

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
