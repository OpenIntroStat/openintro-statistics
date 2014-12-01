library(openintro)
data(COL)
oiB = "#3E9BC0"

###

pdf("penniesWeights_pop.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 2.5
s = 0.03
l = 2.4

normTail(m = m, s = s, L = l, xlim = c(2.35,2.65), axes = FALSE, col = oiB)
axis(1, at = c(m - 3*s,l,m,m + 3*s), label = c(NA,l,m,NA), cex.axis = 1.25)

dev.off()

###

pdf("penniesWeights_n10.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 2.5
s = 0.03/sqrt(10)
l = 2.4

normTail(m = m, s = s, L = l, xlim = c(2.35,2.65), axes = FALSE, col = oiB)
axis(1, at = c(m - 3*s,l,m,m + 3*s), label = c(NA,l,m,NA), cex.axis = 1.25)

dev.off()

###

pdf("penniesWeights_sketch.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1))

# population

m = 2.5
s = 0.03

X <- seq((m - 3 * s),(m + 3 * s),0.001)
Y <- dnorm(X, m, s)

plot(X, Y, type='l', axes=FALSE, xlim=c(min(X), max(X)), ylim=c(0, 42), ylab = "", lwd=2.5)
lines(X, rep(0,length(X)), lwd=1.5)
axis(1, at = seq((m - 3 * s),(m + 3 * s),s), cex.axis = 1.25)

# sampling

m = 2.5
s = 0.03 / sqrt(10)

X <- seq((m - 5 * s),(m + 5 * s),0.001)
Y <- dnorm(X, m, s)

lines(X, Y, type='l', lty = 2, lwd=2.5, col = oiB)

legend("topright", c("Population","Sampling (n = 10)"), lty = c(1,2), col = c("black",oiB), inset = 0.03, cex = 1.25, lwd=c(2.5,2.5))

dev.off()