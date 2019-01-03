library(openintro)
data(COL)

these <- simulated_scatter$group == 4
x <- simulated_scatter$x[these]
y <- simulated_scatter$y[these]

myPDF('perfLinearModel.pdf', 4.5, 3.1,
      mar = c(3, 4, 1, 1),
      mgp = c(1.9, 0.55, 0))
plot(x, y,
     ylim = c(0, max(y)),
     axes = FALSE,
     xlab = 'Number of Target Corporation Stocks to Purchase',
     ylab = '',
     pch = 20,
     cex = 1.7,
     col = COL[1])
buildAxis(1, x, 4, nMax = 4)
AxisInDollars(2, c(-1000, pretty(y, 2)))
abline(5, 64.96, col = COL[5])
par(las = 0)
mtext('Total Cost of the Share Purchase', 2, 2.8)
dev.off()
