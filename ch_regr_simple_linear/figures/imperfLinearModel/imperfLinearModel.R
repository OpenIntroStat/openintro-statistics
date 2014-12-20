library(openintro)
data(COL)

n <- c(75, 49, 376)

set.seed(3)
myPDF('imperfLinearModel.pdf', 5.814, 1.875,
      mfrow = c(1, 3),
      mar = c(2, 2.5, 1, 2),
      mgp = c(1.9, 0.6, 0),
      las = 0)
x <- rnorm(n[1], 16, 33)
y <- 14 - 0.8 * x + rnorm(n[1], sd = 12)
par(mar = c(2, 2.25, 0.5, 0.8))
PlotWLine(x, y)
x <- rnorm(n[2], 1052, 300)
y <- 1400 + 7 * x + rnorm(n[2], sd = 4020)
par(mar = c(2, 2.9, 0.5, 0.4))
PlotWLine(x, y)
x <- c(rnorm(100, 20, 8), runif(n[3] - 100, -10, 52))
y <- 140 - 0.15 * x + rnorm(n[3], sd = 102)
par(mar = c(2, 3.3, 0.5, 0))
PlotWLine(x, y)
dev.off()
