library(openintro)
data(COL)

myPDF("simpleNormal.pdf", 4.3, 1.5,
      mar = 0.1 * rep(1, 4))

X <- seq(-5,5,0.01)
Y <- dnorm(X)
plot(X, Y,
     type = 'l',
     axes = FALSE,
     xlim = c(-4, 4),
     lwd = 2,
     col = COL[5])
#axis(1, at = -3:3)
abline(h = -0.002, col = COL[5])

dev.off()
