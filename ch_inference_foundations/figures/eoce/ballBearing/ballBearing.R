library(openintro)
data(ballBearing)

oiB = "#3E9BC0"

###

pdf("ballBearing.pdf", height = 3, width = 6)

par(mar=c(3.7,2,1,1), las=1, mgp=c(2.5,0.7,0), mfrow = c(1,1), cex.lab = 1.25)

histPlot(ballBearing[,1], col = oiB, xlab = "Number of hours", ylab = "")

dev.off()

###

pdf("ballBearing_pval.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 7
s = 1.25/sqrt(75)
l = 6.85
u = 7.15

normTail(m = m, s = s, L = l, U = u, axes = FALSE, col = oiB)
axis(1, at = c(m - 3*s,l,m,u,m + 3*s), label = c(NA,l,m,u,NA), cex.axis = 1.25)

dev.off()