## ---- echo = FALSE, message = FALSE-------------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>")


## ---- warning=FALSE-----------------------------------------------------------
library(HistData)

duplicates <- Snow.deaths[(duplicated(Snow.deaths[, c("x", "y")])), ]

duplicates.id <- lapply(duplicates$x, function(i) {
   Snow.deaths[Snow.deaths$x == i, "case"]
})

Snow.deaths[unlist(duplicates.id), ]

## -----------------------------------------------------------------------------
Snow.deaths2 <- Snow.deaths

fix <- data.frame(x = c(12.56974, 12.53617, 12.33145), y = c(11.51226, 11.58107, 14.80316)) 
                          
Snow.deaths2[c(91, 93, 209), c("x", "y")] <- fix


## ---- fig.width = 7, fig.height = 7, echo = FALSE-----------------------------
street.list <- split(Snow.streets[, c("x", "y")], 
  as.factor(Snow.streets$street))

plot(Snow.deaths[, c("x", "y")], xlim = c(12, 13), ylim = c(10.9, 11.9), 
  pch = NA, cex = 0.5, col = "blue", asp = 1)
invisible(lapply(street.list, lines, col = "lightgray"))
points(Snow.pumps[, c("x", "y")], col = "blue", pch = 2, cex = 1)
text(Snow.pumps[, c("x", "y")], col = "blue", labels = Snow.pumps$label, 
  pos = 3)
points(Snow.deaths[-unlist(duplicates.id), c("x", "y")])
title(main = "The Three Pairs of Duplicate Cases in Snow.deaths")

invisible(lapply(duplicates.id, function(x) {
  points(Snow.deaths[c(x[1], x[2]), c("x", "y")], pch = 1:0, cex = c(1, 1.75), 
    col = c("black", "red"))
}))

id.data <- do.call(rbind, duplicates.id)
top.data <- Snow.deaths[id.data[, 1], c("x", "y")]
bottom.data <- Snow.deaths[id.data[, 2], c("x", "y")]
text(top.data, labels = rownames(top.data), pos = c(3, 2), cex = 0.9, 
     col = "red")
text(bottom.data[1:2, ], labels = rownames(bottom.data)[1:2], pos = 1, 
     cex = 0.9)
text(bottom.data[3, c("x", "y")] + c(0.03, -0.03), 
     labels = rownames(bottom.data)[3], cex = 0.9)
legend(x = "bottomleft",
       legend = c("Well", "Duplicate", "Case"),
       col = c("blue", "red", "black"),
       pch = c(2, 0, 1),
       bg = "white",
       cex = 0.8,
       title = "Key")

## ---- fig.width = 7, fig.height = 7, echo = FALSE-----------------------------

broad.40 <- c(32, 122)

plot(Snow.deaths[, c("x", "y")], xlim = c(12, 13), ylim = c(10.9, 11.9), 
     pch = NA, cex = 0.5, col = "blue", asp = 1)
invisible(lapply(street.list, lines, col = "lightgray"))
points(Snow.pumps[, c("x", "y")], col = "blue", pch = 2, cex = 1)
text(Snow.pumps[, c("x", "y")], col = "blue", labels = Snow.pumps$label, 
     pos = 3)
points(Snow.deaths[-unlist(duplicates.id), c("x", "y")])
text(Snow.deaths[broad.40, c("x", "y")], labels = Snow.deaths$case[broad.40],
     cex = 0.9, pos = 4)
title(main = "40 Broad Street:\nTwo (32 & 122) Rather than Four Cases Recorded")

invisible(lapply(duplicates.id, function(x) {
  points(Snow.deaths[c(x[1], x[2]), c("x", "y")], pch = 1:0, cex = c(1, 1.75), 
         col = c("black", "red"))
}))

id.data <- do.call(rbind, duplicates.id)
top.data <- Snow.deaths[id.data[, 1], c("x", "y")]
bottom.data <- Snow.deaths[id.data[, 2], c("x", "y")]
text(top.data, labels = rownames(top.data), pos = c(3, 2), cex = 0.9, 
  col = "red")
text(bottom.data[1:2, ], labels = rownames(bottom.data)[1:2], pos = 1, 
  cex = 0.9)
text(bottom.data[3, c("x", "y")] + c(0.03, -0.03), 
     labels = rownames(bottom.data)[3], cex = 0.9)

legend(x = "bottomleft",
       legend = c("Well", "Duplicate", "Case"),
       col = c("blue", "red", "black"),
       pch = c(2, 0, 1),
       bg = "white",
       cex = 0.8,
       title = "Key")

## ---- fig.width = 7, fig.height = 7, echo = FALSE-----------------------------

noel.street <- c(282, 422)

plot(Snow.deaths[, c("x", "y")], xlim = c(11.75, 12.75), ylim = c(14.25, 15.25), 
     asp = 1)
invisible(lapply(street.list, lines, col = "lightgray"))
points(Snow.pumps[-noel.street, c("x", "y")], col = "blue", pch = 2, cex = 1)
text(Snow.pumps[ c("x", "y")], col = "blue", labels = Snow.pumps$label, pos = 3)
text(Snow.deaths[noel.street, c("x", "y")], cex = 0.9, pos = 4, 
     labels = Snow.deaths$case[noel.street])
title(main = "End of Noel Street:\nTwo Rather than Three Cases Listed")

## -----------------------------------------------------------------------------
quadratic <- function(a, b, c) {
  root1 <- (-b + sqrt(b^2 - 4 * a * c)) / (2 * a)
  root2 <- (-b - sqrt(b^2 - 4 * a * c)) / (2 * a)
  c(root1, root2)
}

interpolatedPoints <- function(case, radius.multiplier = 0.5, orthogonal.intercept) {
  p <- Snow.deaths[case, "x"]
  q <- Snow.deaths[case, "y"]
  # extant.point.distance is the Euclidean distance between observed points
  r <- radius.multiplier * extant.point.distance
  m <- orthogonal.slope
  b <- orthogonal.intercept
  A <- (m^2 + 1)
  B <- 2 * (m * b - m * q - p)
  C <- (q^2 - r^2 + p^2 - 2 * b * q + b^2)
  quadratic(A, B, C) 
}


## ---- fig.width = 7, fig.height = 7, echo = FALSE-----------------------------

orthogonalIntercept <- function(case) {
  Snow.deaths[case, "y"] - orthogonal.slope * Snow.deaths[case, "x"]
}

plot(Snow.deaths[, c("x", "y")], xlim = c(12, 13), ylim = c(10.9, 11.9), 
     pch = NA, cex = 0.5, col = "blue", asp = 1)
title(main = "Use Two Duplicate Cases (91 & 93)\nas Substitutes for Two Missing Cases at 40 Broad Street")
invisible(lapply(street.list, lines, col = "lightgray"))
points(Snow.pumps[, c("x", "y")], col = "blue", pch = 2, cex = 1)
text(Snow.pumps[, c("x", "y")], col = "blue", labels = Snow.pumps$label, 
     pos = 3)
points(Snow.deaths[-c(unlist(duplicates.id)), c("x", "y")])

points(bottom.data)

points(top.data[3, ], col = "red", pch = 0, cex = 1.75)
text(Snow.deaths[broad.40, c("x", "y")], labels = Snow.deaths$case[broad.40],
     cex = 0.9, pos = 4)
text(bottom.data[1:2, ], labels = rownames(bottom.data)[1:2], pos = 1, cex = 0.9)

text(bottom.data[3, c("x", "y")] + c(0.03, -0.03), cex = 0.9,
     labels = rownames(bottom.data)[3])
text(top.data[3, ], labels = rownames(top.data)[3], pos = 3, cex = 0.9, 
     col = "red")

seg.data <- unlist(street.list$'216') 
segments(seg.data["x1"], seg.data["y1"], seg.data["x2"], seg.data["y2"], 
         col = "green")

seg.df <- data.frame(street.list$'216')

ols <- lm(y ~ x, data = seg.df)
segment.slope <- coef(ols)[2]
segment.intercept <- coef(ols)[1]
orthogonal.slope <- -1 / segment.slope

orthogonal.intercept.32 <- orthogonalIntercept(32)
orthogonal.intercept.122 <- orthogonalIntercept(122)

move.candidates <- c(91, 93, 209)
stay.in.place <- c(214, 241, 429)
candidates <- c(move.candidates, stay.in.place)

extant.point.distance <- dist(Snow.deaths[c(32, 122), c("x", "y")])
x.out1 <- max(interpolatedPoints(32, orthogonal.intercept = orthogonal.intercept.32)) 
x.out2 <- max(interpolatedPoints(32, radius.multiplier = 1.5, 
  orthogonal.intercept = orthogonal.intercept.122))
y.out1 <- orthogonal.slope * x.out1 + orthogonal.intercept.32 
y.out2 <- orthogonal.slope * x.out2 + orthogonal.intercept.32 

broad40.32 <- Snow.deaths[32, c("x", "y")]
broad40.122 <- Snow.deaths[122, c("x", "y")]
broad.df <- data.frame(x = c(broad40.32$x, broad40.122$x), 
                       y = c(broad40.32$y, broad40.122$y))

r <- dist(broad.df) / 2  # radius
unit.base <- 100
unit.radians <- 2 * pi / unit.base
circumference.x <- Snow.deaths[32, "x"] + r * cos(0:unit.base * unit.radians)
circumference.y <- Snow.deaths[32, "y"] + r * sin(0:unit.base * unit.radians)
lines(circumference.x, circumference.y, col = "green")

r <- dist(broad.df) * 1.5  # radius
unit.base <- 100
unit.radians <- 2 * pi / unit.base
circumference.x <- Snow.deaths[32, "x"] + r * cos(0:unit.base * unit.radians)
circumference.y <- Snow.deaths[32, "y"] + r * sin(0:unit.base * unit.radians)
lines(circumference.x, circumference.y, col = "green")

x.pt <- (orthogonal.intercept.32 - segment.intercept) / 
  (segment.slope - orthogonal.slope)
y.pt <- segment.slope * x.pt + segment.intercept
segments(x.pt, y.pt, x.out2, y.out2, col = "green")

points(x.out1, y.out1, pch = 0, col = "red")
points(x.out2, y.out2, pch = 0, col = "red")
text(x.out1, y.out1, pos = 2, cex = 0.9, col = "red", 
  labels = move.candidates[2])
text(x.out2, y.out2, pos = 2, cex = 0.9, col = "red", 
     labels = move.candidates[1])

ordered.pair1 <- paste0("(", round(x.out1[1], 3), ", ", round(y.out1[1], 3),
  ")")
ordered.pair2 <- paste0("(", round(x.out2[1], 3), ", ", round(y.out2[1], 3),
  ")")     

arrows(Snow.deaths[93, "x"], Snow.deaths[93, "y"], x.out1, y.out1, 
       col = "gray", length = 1/8)
arrows(Snow.deaths[91, "x"], Snow.deaths[91, "y"], x.out2, y.out2, 
       col = "gray", length = 1/8)

text(x.out1, y.out1, pos = 4, cex = 0.8, col = "red", labels = ordered.pair1)
text(x.out2, y.out2, pos = 4, cex = 0.8, col = "red", labels = ordered.pair2)

legend(x = "bottomleft",
       legend = c("Well", "Duplicate", "Case"),
       col = c("blue", "red", "black"),
       pch = c(2, 0, 1),
       bg = "white",
       cex = 0.8,
       title = "Key")


## ---- fig.width = 7, fig.height = 7, echo = FALSE-----------------------------

noel.street <- c(282, 422)

plot(Snow.deaths[, c("x", "y")], xlim = c(12.25, 12.5), ylim = c(14.5, 15.25), 
     asp = 1)
invisible(lapply(street.list, lines, col = "lightgray"))
points(Snow.pumps[-noel.street, c("x", "y")], col = "blue", pch = 2, cex = 1)
text(Snow.pumps[ c("x", "y")], col = "blue", labels = Snow.pumps$label, pos = 3)
text(Snow.deaths[noel.street, c("x", "y")], cex = 0.9, pos = 4, 
     labels = Snow.deaths$case[noel.street])
title(main = "Use Duplicate Observation (209)\n as Substitute for Missing Case on Noel Street")

seg.data <- unlist(street.list$'118')
segments(seg.data["x1"], seg.data["y1"], seg.data["x2"], seg.data["y2"], 
         col = "green")

seg.df <- data.frame(street.list$'118')

ols <- lm(y ~ x, data = seg.df)
segment.slope <- coef(ols)[2]
segment.intercept <- coef(ols)[1]
orthogonal.slope <- -1 / segment.slope

orthogonal.intercept.282 <- orthogonalIntercept(noel.street[1])
orthogonal.intercept.422 <- orthogonalIntercept(noel.street[2])

extant.point.distance <- dist(Snow.deaths[noel.street, c("x", "y")])

x.out <- interpolatedPoints(noel.street[1], 0.5, orthogonal.intercept.282)
y.out <- orthogonal.slope * x.out + orthogonal.intercept.282 

noel.282 <- Snow.deaths[282, c("x", "y")]
noel.422 <- Snow.deaths[422, c("x", "y")]
noel.df <- data.frame(x = c(noel.282$x, noel.422$x), 
                      y = c(noel.282$y, noel.422$y))

r <- dist(noel.df) * 0.5  # radius
unit.base <- 100
unit.radians <- 2 * pi / unit.base
circumference.x <- Snow.deaths[282, "x"] + r * cos(0:unit.base * unit.radians)
circumference.y <- Snow.deaths[282, "y"] + r * sin(0:unit.base * unit.radians)
lines(circumference.x, circumference.y, col = "green")

x.pt <- (orthogonal.intercept.282 - segment.intercept) /
  (segment.slope - orthogonal.slope)
y.pt <- segment.slope * x.pt + segment.intercept
segments(x.pt, y.pt, x.out, y.out, col = "green")

ordered.pair <- paste0("(", round(x.out[1], 3), ", ", round(y.out[1], 3), ")")

points(x.out[1], y.out[1], pch = 0, col = "red")
text(x.out[1], y.out[1], labels = 209, col = "red", cex = 0.9, pos = 2)
text(x.out[1], y.out[1], labels = ordered.pair, col = "red", cex = 0.8, 
  pos = 4)

arrows(Snow.deaths[209, "x"], Snow.deaths[209, "y"], x.out[1], y.out[1], 
       col = "gray", length = 1/8)

legend(x = "bottomleft",
       legend = c("Duplicate", "Case"),
       col = c("red", "black"),
       pch = c(0, 1),
       bg = "white",
       cex = 0.8,
       title = "Key")
       

