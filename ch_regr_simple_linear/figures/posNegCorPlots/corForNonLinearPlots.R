library(openintro)
data(COL)
set.seed(1)
source("CorrelationPlot.R")

n <- 50

myPDF('corForNonLinearPlots.pdf', 6, 2,
      mfrow = c(1, 3),
      mar = c(2.7, rep(0.5, 3)),
      mgp = c(1, 0, 0))
x <- c(runif(n[1] - 2, -2, 2.2), 2, 2.1)
y <- -10 * x^2 + rnorm(n[1], sd = 5)
CorrelationPlot(x, y)

x <- c(runif(n[1] - 2, -20, 10.2), 2, 2.1)
y <- -x^3 - 10 * x^2 + 100 * x + rnorm(n[1], sd = 120)
CorrelationPlot(x, y)

x <- runif(n[1], -1, 4)
y <- 0.25 * (x > 3) - 0.5 * (x > 2) + 1.7 * (x > 1) + (x < 0)
x <- c(x, 0, 0, 1, 1)
noise <- rnorm(n[1] + 4, sd = 0.071)
y <- c(y, rep(0.5, 2), rep(1, 2)) + noise
yR <- range(y) + c(-1, 1) * 0.1 * diff(range(y))
CorrelationPlot(x, y, ylim = yR)

dev.off()