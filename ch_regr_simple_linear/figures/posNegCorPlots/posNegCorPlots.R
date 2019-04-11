library(openintro)
data(COL)
data(possum)
source("CorrelationPlot.R")
set.seed(1)

n <- 50

myPDF('posNegCorPlots.pdf', 6, 3.6,
      mfrow = c(2, 4),
      mar = c(2.7, rep(0.5, 3)),
      mgp = c(1, 0, 0))


# _____ Line 1 _____ #
these <- simulated_scatter$group == 9
x <- simulated_scatter$x[these]
y <- simulated_scatter$y[these]
CorrelationPlot(x, y, xlim = c(-0.2, 4.2), ylim = c(-9, 17))

these <- simulated_scatter$group == 10
x <- simulated_scatter$x[these]
y <- simulated_scatter$y[these]
CorrelationPlot(x, y)

these <- simulated_scatter$group == 11
x <- simulated_scatter$x[these]
y <- simulated_scatter$y[these]
CorrelationPlot(x, y, xlim = c(-0.2, 4.2), ylim = c(-2, 9.6))

these <- simulated_scatter$group == 12
x <- simulated_scatter$x[these]
y <- simulated_scatter$y[these]
CorrelationPlot(x, y, xlim = c(-0.03, 1.03), ylim = c(-.1, 1.1))


# _____ Line 2 _____ #
par(mar = c(2.1,0.5,1.1,0.5))

these <- simulated_scatter$group == 13
x <- simulated_scatter$x[these]
y <- simulated_scatter$y[these]
CorrelationPlot(x, y, xlim = c(-0.2, 4.2), ylim = c(-17, 14))

these <- simulated_scatter$group == 14
x <- simulated_scatter$x[these]
y <- simulated_scatter$y[these]
CorrelationPlot(x, y, xlim = c(-5.2, 5.2), ylim = c(-12, 10))

these <- simulated_scatter$group == 15
x <- simulated_scatter$x[these]
y <- simulated_scatter$y[these]
CorrelationPlot(x, y, xlim = c(-0.03, 1.03), ylim = c(-10, 2))

these <- simulated_scatter$group == 16
x <- simulated_scatter$x[these]
y <- simulated_scatter$y[these]
CorrelationPlot(x, y, xlim = c(-0.03, 1.03), ylim = c(-1.2, .2))

dev.off()
