library(openintro)
data(COL)
set.seed(1)
source("CorrelationPlot.R")

n <- 50

myPDF('corForNonLinearPlots.pdf', 6, 2,
      mfrow = c(1, 3),
      mar = c(2.7, rep(0.5, 3)),
      mgp = c(1, 0, 0))
these <- simulated_scatter$group == 17
x <- simulated_scatter$x[these]
y <- simulated_scatter$y[these]
CorrelationPlot(x, y)

these <- simulated_scatter$group == 18
x <- simulated_scatter$x[these]
y <- simulated_scatter$y[these]
CorrelationPlot(x, y)

these <- simulated_scatter$group == 19
x <- simulated_scatter$x[these]
y <- simulated_scatter$y[these]
yR <- range(y) + c(-1, 1) * 0.1 * diff(range(y))
CorrelationPlot(x, y, ylim = yR)

dev.off()