library(openintro)
data(COL)

myPDF('tDistCompareToNormalDist.pdf', 5, 2.3,
      mar = c(2, 1, 1, 1),
      mgp = c(5, 0.6, 0))
plot(c(-5, 5),
     c(0, dnorm(0)),
     type = 'n',
     axes = FALSE)
axis(1, seq(-6, 6, 2))
abline(h = 0)

xleg <- 2
yleg <- 0.35
yleg.line.offset <- -0.07
line.leg.width <- 0.55
lines(
    c(xleg, xleg + line.leg.width),
    rep(yleg, 2),
    col = COL[4], lty = 3, lwd = 2.5)
lines(
    c(xleg, xleg + line.leg.width),
    rep(yleg + yleg.line.offset, 2),
    col = COL[1], lty = 1, lwd = 1.8)
text(xleg + line.leg.width, yleg,
    "Normal",
    col = COL[4], pos = 4)
text(xleg + line.leg.width, yleg + yleg.line.offset,
    "t-distribution",
    col = COL[1], pos = 4)

X <- seq(-6, 6, 0.01)
Y <- dnorm(X)
lines(X, Y, lty = 3, lwd = 2.5, col = COL[4])

Y <- dt(X, 2)
lines(X, Y, lwd = 1.8, col = COL[1])

dev.off()
