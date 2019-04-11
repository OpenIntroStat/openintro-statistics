library(openintro)
data(COL)
data(possum)
set.seed(1)

myPDF('scatthead_ltotal_lLine.pdf', 5.5, 3.2,
      mar = c(3, 3.2, 0.1, 1),
      mgp = c(1.9, 0.45, 0))
plot(possum$total_l, possum$head_l,
     pch = 20,
     col = COL[1, 2],
     cex = 1.7,
     xlab = 'Total Length (cm)',
     ylab = 'Head Length (mm)')
abline(41, 0.59, col = COL[5])
dev.off()


myPDF('scatthead_ltotal_lLineResiduals.pdf', 5.5, 3.2,
      mar = c(3, 3.2, 0.1, 1),
      mgp = c(1.9, 0.45, 0))
these <- c(48, 42, 3)
plot(possum$total_l[-these], possum$head_l[-these],
     pch = 20,
     col = COL[1, 2],
     cex = 1.7,
     xlab = 'Total Length (cm)',
     ylab = 'Head Length (mm)')
points(possum$total_l[these] + rnorm(3,0,0.02),
       possum$head_l[these] + rnorm(3,0,0.02),
       pch = c(3, 4, 2),
       col = COL[4],
       cex = 1.5,
       lwd = 2.5)
abline(41, 0.59, col = COL[5])
for(i in 1:3){
  y2 <- 41 + 0.59 * possum$total_l[these[i]]
  lines(rep(possum$total_l[these[i]], 2),
        c(possum$head_l[these[i]], y2),
        lty = 2,
        lwd = 1,
        col = COL[4])
}
dev.off()
