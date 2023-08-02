library(vdiffr)
library(dplyr, warn.conflicts = FALSE)

set.seed(3125)
clust <- kmeans(iris[, 1:4], centers = 3)

test_that("test voronoi_diagram()", {
  expect_doppelganger(
    "voronoi default",
    voronoi_diagram(clust, "Sepal.Width", "Sepal.Length")
  )
  expect_doppelganger(
    "voronoi with data",
    voronoi_diagram(clust, "Petal.Width", "Sepal.Length", data = iris)
  )
  expect_doppelganger(
    "voronoi suppress data",
    voronoi_diagram(clust, "Petal.Width", "Petal.Length",
                    data = iris, show_data = FALSE)
  )
  expect_doppelganger(
    "voronoi uncoloured data",
    voronoi_diagram(clust, "Petal.Width", "Petal.Length",
                    data = iris, colour_data = FALSE)
  )
  expect_doppelganger(
    "voronoi with options",
    voronoi_diagram(clust, "Sepal.Width", "Petal.Length",
                 data = iris, legend = FALSE,
                 point_size = 3, linewidth = 1.2)
  )
})

test_that("test voronoi_diagram() with invalid inputs", {
  expect_error(voronoi_diagram(iris, "Sepal.Width", "Sepal.Length"),
               "cluster must contain the fields 'cluster' and 'centers'.")
  expect_error(voronoi_diagram(clust, "Sepal.Width", "something"),
               "variable \"something\" does not exist in clust")
  expect_error(voronoi_diagram(clust, "something", "Sepal.Length"),
               "variable \"something\" does not exist in clust")
  iris_bad <- rename(iris, something = Sepal.Width)
  expect_error(
    voronoi_diagram(clust, "Sepal.Width", "Sepal.Length", data = iris_bad),
    "variable \"Sepal.Width\" does not exist in iris_bad"
  )
  expect_error(
    voronoi_diagram(clust, "Sepal.Length", "Sepal.Width", data = iris_bad),
    "variable \"Sepal.Width\" does not exist in iris_bad"
  )
})


test_that("test init_rand_centers() for two dimensions", {
  iris2 <- iris[, 1:2]
  centers <- init_rand_centers(iris2, 2, seed = 1234)
  expect_named(centers, c("centers", "cluster"))
  expect_named(centers$centers, names(iris2))
  expect_equal(nrow(centers$centers), 2)
  expect_equal(length(centers$cluster), nrow(iris2))
  expect_s3_class(centers$cluster, "factor")
  expect_equal(levels(centers$cluster), as.character(1:2))
  centers_ref <- dplyr::tibble(
    Sepal.Length = c(4.7093322, 6.5402779),
    Sepal.Width  = c(3.4622594, 3.4961107)
  )
  expect_equal(centers$center, centers_ref)
})


test_that("test init_rand_centers() for three dimensions", {
  iris2 <- iris[, 1:3]
  centers <- init_rand_centers(iris2, 5, seed = 1234)
  expect_named(centers, c("centers", "cluster"))
  expect_named(centers$centers, names(iris2))
  expect_equal(nrow(centers$centers), 5)
  expect_equal(length(centers$cluster), nrow(iris2))
  expect_s3_class(centers$cluster, "factor")
  expect_equal(levels(centers$cluster), as.character(1:5))
  centers_ref <- dplyr::tibble(
    Sepal.Length = c(4.7093322, 6.5402779, 6.4933890, 6.5441660, 7.3992954),
    Sepal.Width  = c(3.5367455, 2.0227898, 2.5581212, 3.5986010, 3.2342027),
    Petal.Length = c(5.0921886, 4.2153515, 2.6681281, 6.4482576, 2.7246635)
  )
  expect_equal(centers$center, centers_ref)
})


test_that("test init_rand_centers() with invalid input", {
  expect_error(init_rand_centers(iris, 1), "n must be at least 2")
})


test_that("test clusters_with_centers()", {
  iris2 <- iris[, 1:2]
  clust <- init_rand_centers(iris2, 3, seed = 2543)
  clust_new <- cluster_with_centers(iris2, clust$centers)
  expect_named(clust_new, c("centers", "cluster"))
  expect_named(clust_new$centers, names(iris2))
  expect_equal(nrow(clust_new$centers), 3)
  expect_equal(length(clust_new$cluster), nrow(iris2))
  expect_s3_class(clust_new$cluster, "factor")
  expect_equal(levels(clust_new$cluster), as.character(1:3))
  cluster_ref <- c(2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
                   2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
                   2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 2, 3, 2, 3, 2, 2, 2, 3, 2, 2, 2,
                   2, 2, 2, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 2, 2, 2, 2, 2,
                   2, 2, 2, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 2,
                   2, 3, 2, 3, 3, 1, 2, 2, 3, 2, 2, 2, 2, 1, 3, 2, 3, 2, 3, 2, 2,
                   3, 2, 2, 2, 3, 3, 1, 2, 2, 2, 3, 2, 2, 2, 3, 3, 3, 2, 3, 2, 3,
                   2, 2, 2, 2) %>% factor()
  expect_equal(clust_new$cluster, cluster_ref)
  centers_ref <- dplyr::tibble(
    Sepal.Length = c(7.6     , 5.5466667, 6.9666667),
    Sepal.Width = c(3.7333333, 3.0633333, 2.9555556)
  )
  expect_equal(clust_new$center, centers_ref)
})


test_that("test clusters_with_centers() with invalid input", {
  centers <- init_rand_centers(iris[, 1:2], 3)
  expect_error(cluster_with_centers(iris[, 1:3], centers$centers),
               "data and centers must have the same number of columns")
})
