library(ggplot2)
data(Pollen, package = "HistData")

gp <- ggplot(data=Pollen,
       aes(x = ridge, y = nub)) +
  geom_point()
gp

# zoom in
gp +
  xlim(2, -3) +
  ylim(-1, 2)

# use plot

plot(nub ~ ridge, data = Pollen, pch = 16)

plot(nub ~ ridge, data = Pollen, pch = 16,
     xlim = c(2, -3),
     ylim = c(-1, 2))
