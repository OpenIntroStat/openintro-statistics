library(openintro)
data(COL)
data(possum)
data(cars)
myPDF('scattHeadLTotalLTube.pdf', 7.3, 3,
      mar = c(3.2, 3.8, 1, 2),
      mgp = c(2.4, 0.55, 0),
      mfrow = 1:2)
plot(possum$totalL, possum$headL,
     pch = 20,
     col = COL[1, 2],
     cex = 1.7,
     xlab = '',
     ylab = 'Head length (mm)',
     type = "n")
mtext("Total length (cm)", 1, line = 2.1)
g <- lm(headL ~ totalL, possum)
x <- c(0, 200, 200, 0, 0)
y <- 42.71 + c(-5, 0.5729 * 200 - 5, 0.5729 * 200 + 5, 5, -5)
polygon(x, y,
        col = COL[7],
        border = '#00000000')
points(possum$totalL, possum$headL,
       pch = 20,
       col = COL[1, 2],
       cex = 1.7)


set.seed(5)
par(mar = c(3.2, 4.8, 1, 1))
n <- 50
x <- sample(150:420, n, prob = (150:420)^2)
y <- 87 - 0.35 * x + 5.4e-4 * x^2 + rnorm(n, sd = 2)
simulated_scatter <- rbind.data.frame(simulated_scatter,
    data.frame(group = 30, x, y))

plot(x, y,
     pch = 20,
     col = COL[1, 2],
     cex = 1.7,
     xlab = '',
     ylab = 'y',
     type = "n")
mtext("x", 1, line = 2.1)
g <- lm(y ~ x + I(x^2), cars)
x1 <- seq(100, 500, 10)
x2 <- c(x1, rev(x1), 100)
nx1 <- length(x1)
y2 <- g$coef[1] + g$coef[2] * x2 + g$coef[3] * x2^2 +
     2 * sd(g$residuals) * c(rep(-1, nx1), rep(1, nx1), -1)
polygon(x2, y2,
        col = COL[7],
        border = '#00000000')
points(x, y,
       pch = 20,
       col = COL[1, 2],
       cex = 1.7)
dev.off()
