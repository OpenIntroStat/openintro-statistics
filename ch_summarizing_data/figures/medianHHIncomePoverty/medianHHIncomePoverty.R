library(openintro)
library(splines)

ind <- 1088

myPDF("medianHHIncomePoverty.pdf", 6, 3.5,
      mar = c(3, 4.7, 0.5, 1),
      mgp = c(2.4, 0.5, 0))
x <- county$poverty
y <- county$median_hh_income
plot(x, y, type = "n",
     xlim = c(0, max(x, na.rm = TRUE)),
     ylim = c(0, max(y, na.rm = TRUE)),
     xlab = "",
     ylab = "",
     axes = FALSE)
abline(h = pretty(c(0, y)), v = pretty(c(0, x)), col = COL[7, 3])
points(x, y, pch = 20, cex = 0.7, col = COL[1, 3])
AxisInPercent(1, pretty(c(0, x)))
AxisInDollars(2, pretty(c(0, y)))
box()
points(x, y, pch = ".", col = COL[5, 4])
mtext("Poverty Rate (Percent)", 1, 1.9)
par(las = 0)
mtext("Median Household Income", 2, 3.5)
t1 <- x[ind]
t2 <- y[ind]
# lines(c(t1, t1), c(-1e5, t2), lty = 2, col = COL[4])
# lines(c(-1e5, t1), c(t2, t2), lty = 2, col = COL[4])
# points(t1, t2, col = COL[4])
my_exp <- 1.2
(m <- lm(y ~ I(1 / x^my_exp) + I(x^0.3)))
(m <- lm(y ~ x + I(x^2) + I(x^3)))
x. <- seq(0.1, 100, 0.1)
y. <- m$coef[1] + m$coef[2] / x.^my_exp + m$coef[3] * x.^0.3
y. <- m$coef[1] + m$coef[2] * x. + m$coef[3] * x.^2 + m$coef[4] * x.^3
i <- 350
m. <- (y.[i] - y.[i-1]) / 0.1
b. <- y.[i] - m. * i / 10
y.[i:1000] <- m. * x.[i:1000] + b.
y. <- y.[x. > 1.8]
x. <- x.[x. > 1.8]
lines(x., y., lwd = 1.5, col = COL[7, 1])
lines(x., y., lty = 2, lwd = 1.5, col = COL[5])

dev.off()

county[ind, ]
