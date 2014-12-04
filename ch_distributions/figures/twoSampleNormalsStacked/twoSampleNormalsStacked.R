library(openintro)
data(COL)

myPDF("twoSampleNormalsStacked.pdf", 4.65, 2.24,
      mar = c(2,1,0.5,1))

# curve 1
X <- seq(-4,4,0.01)
Y <- dnorm(X)
plot(X, Y,
     type = 'l',
     axes = FALSE,
     xlim = c(-5, 35))
axis(1, at = seq(-10, 40, 10))
lines(X, Y)
abline(h = 0)

# curve 2
X <- seq(3,35, 0.01)
Y <- dnorm(X, 19, 4)
lines(X, Y)

dev.off()
