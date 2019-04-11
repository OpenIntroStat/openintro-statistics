library(openintro)
data(COL)
data(possum)

myPDF('scattHeadLTotalL.pdf', 6, 4,
      mar = c(3.7, 3.7, 0.5, 0.5),
      mgp = c(2.6, 0.55, 0))
plot(possum$totalL, possum$headL,
     pch = 19,
     col = COL[1, 2],
     cex = 1.2,
     xlab = 'Total Length (cm)',
     ylab = 'Head Length (mm)')
points(89, 94.1, col = COL[4], cex = 1.7)
lines(rep(89, 2), c(0, 93.8), lty = 2, col = COL[4])
lines(c(0, 88.7), rep(94.1, 2), lty = 2, col = COL[4])
dev.off()
