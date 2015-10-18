library(openintro)
data(COL)

myPDF("twoSampleNormalsStacked.pdf", 4.65, 2,
      mar = c(1.7,1,0.1,1))

# curve 1
X <- seq(-4,4,0.01)
Y <- dnorm(X)
plot(X, Y,
     type = 'l',
     col = COL[1],
     axes = FALSE,
     xlim = c(-5, 35))
axis(1, at = seq(-10, 40, 10))
lines(X, Y, col = COL[1], lwd = 3)
abline(h = 0)

# curve 2
X <- seq(4, 35, 0.01)
Y <- dnorm(X, 19, 4)
lines(X, Y, col = COL[2], lwd = 3)

dev.off()
