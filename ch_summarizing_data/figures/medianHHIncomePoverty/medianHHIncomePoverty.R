library(openintro)
data(county)
data(COL)

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
m <- lm(y ~ I(1 / x))
x. <- seq(0.1, 100, 0.1)
y. <- m$coef[1] + m$coef[2] / x.
lines(x., y., lty = 2, lwd = 2, col = "white")
lines(x., y., lty = 2, lwd = 1, col = COL[5])

dev.off()

county[ind, ]
