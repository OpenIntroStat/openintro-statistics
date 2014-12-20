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
x <- c(runif(n[1] - 2, 0, 4), 2, 2.1)
y <- 0.8 * x + rnorm(n[1], sd = 5)
CorrelationPlot(x, y, xlim = c(-0.2, 4.2), ylim = c(-9, 17))

CorrelationPlot(possum$totalL, possum$headL)

x <- c(runif(n[1] - 2, 0, 4), 2, 2.1)
y <- 2 * x + rnorm(n[1], sd = 0.5)
CorrelationPlot(x, y, xlim = c(-0.2, 4.2), ylim = c(-2, 9.6))

x <- runif(n[1])
y <- x
y[y < -2] <- -1.5
CorrelationPlot(x, y, xlim = c(-0.03, 1.03), ylim = c(-.1, 1.1))


# _____ Line 2 _____ #
par(mar = c(2.1,0.5,1.1,0.5))

x <- c(runif(n[1]-2, 0, 4), 2, 2.1)
y <- -0.5 * x + rnorm(n[1], sd = 5)
CorrelationPlot(x, y, xlim = c(-0.2, 4.2), ylim = c(-17, 14))

x <- runif(n[1], -4.8, 4.8)
y <- -x + rnorm(n[1], sd = 3)
CorrelationPlot(x, y, xlim = c(-5.2, 5.2), ylim = c(-12, 10))

x <- runif(n[1])
y <- -9 * x + rnorm(n[1])
CorrelationPlot(x, y, xlim = c(-0.03, 1.03), ylim = c(-10, 2))

x <- runif(n[1])
y <- -x
y[y < -2] <- -1.5
CorrelationPlot(x, y, xlim = c(-0.03, 1.03), ylim = c(-1.2, .2))

dev.off()
