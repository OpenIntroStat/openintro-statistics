require(openintro)
data(COL)
data(possum)
set.seed(1)

myPDF('scattHeadLTotalLLine.pdf', 5.5, 3.2,
      mar = c(3, 3.2, 0.1, 1),
      mgp = c(1.9, 0.45, 0))
plot(possum$totalL, possum$headL,
     pch = 20,
     col = COL[1, 2],
     cex = 1.7,
     xlab = 'Total Length (cm)',
     ylab = 'Head Length (mm)')
abline(41, 0.59, col = COL[5])
dev.off()


myPDF('scattHeadLTotalLLineResiduals.pdf', 5.5, 3.2,
      mar = c(3, 3.2, 0.1, 1),
      mgp = c(1.9, 0.45, 0))
these <- c(48, 42, 3)
plot(possum$totalL[-these], possum$headL[-these],
     pch = 20,
     col = COL[1, 2],
     cex = 1.7,
     xlab = 'Total Length (cm)',
     ylab = 'Head Length (mm)')
points(possum$totalL[these] + rnorm(3,0,0.02),
       possum$headL[these] + rnorm(3,0,0.02),
       pch = c(3, 4, 2),
       col = COL[4],
       cex = 1.5,
       lwd = 2.5)
abline(41, 0.59, col = COL[5])
for(i in 1:3){
  y2 <- 41 + 0.59 * possum$totalL[these[i]]
  lines(rep(possum$totalL[these[i]], 2),
        c(possum$headL[these[i]], y2),
        lty = 2,
        lwd = 1,
        col = COL[4])
}
dev.off()
