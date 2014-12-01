library(openintro)
data(COL)

#===> data <===#
obs <- c(-110, -9, -60, 316, -200, -196, 320, -160, 31, 331, 1731, 21, -926, -475, 914, -300, -15, 1, -29, 829, 761, 227, -141, -672, 352, 385, 24, 103, -826, 95, 115, 39, -9, -1000, -35, -200, -200, 235, 70, 307, 135, 60, -100, -295, -1000, 361, -95, 337, 3712, -255)

M  <- mean(obs)
SD <- sd(obs)
x <- seq(min(obs)-3000, max(obs)+3000, 1)
y <- dnorm(x, M, SD)
myPDF("pokerNormal.pdf", 6.5, 2.7, mfrow=c(1,2), las=1, mgp=c(2,.5,0), mar=c(3,0.5, 0.5, 2))
histPlot(obs, xlab='Poker earnings (US$)', ylab='', axes=FALSE, main='', xlim=c(-2000,4000), probability=TRUE, col=COL[1])
axis(1, cex.axis=0.7, mgp=c(2, 0.35, 0))
lines(x, y, lwd=1.5)

par(mar=c(3, 2, 0.5, 0.5), mgp=c(2.8, 0.5, 0), cex.axis=0.8)
qqnorm(obs, cex=0.5, main='', axes=F, ylab='', xlab='')
mtext('Theoretical quantiles', line=2, side=1)
axis(1)
axis(2)
# abline(M, SD)
dev.off()