library(openintro)
data(county)
data(COL)

ind <- 1088

myPDF("pop_change_v_per_capita_income.pdf", 6, 3.5,
      mar = c(3, 5.1, 0.5, 1),
      mgp = c(2.4, 0.5, 0))
x <- county$per_capita_income
y <- county$pop_change
ylim <- c(-15, 25) # range(y, na.rm = TRUE)
plot(x, y,
     pch = 20,
     cex = 0.7,
     type = "n",
     xlim = c(0, max(x, na.rm = TRUE)),
     ylim = ylim,
     xlab = "",
     ylab = "",
     axes = FALSE)
AxisInDollars(1, pretty(c(0, x)))
AxisInPercent(2, pretty(ylim))
abline(h = pretty(ylim), v = pretty(c(0, x)), col = COL[7, 2])
box()
points(x, y, pch = 20, cex = 0.7, col = COL[1, 3])
points(x, y, pch = ".")
mtext("Per Capita Income", 1, 1.9)
par(las = 0)
mtext("Population Change\nover 7 Years (Percent)", 2, 3)
t1 <- x[ind]
t2 <- y[ind]
lines(c(t1, t1), c(-1e5, t2),
      lty = 2,
      col = COL[4])
lines(c(-1e5, t1), c(t2, t2),
      lty = 2,
      col = COL[4])
points(t1, t2,
       col = COL[4])
dev.off()

county[ind, ]
