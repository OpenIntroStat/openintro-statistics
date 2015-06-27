library(openintro)
data(COL)

myPDF('height40Perc.pdf', 2.15, 0.95,
      mar = c(1.31, 0, 0.01, 0),
      mgp = c(3, 0.45, 0))
X <- seq(-4, 4, 0.01)
Y <- dnorm(X)
plot(X, Y,
     type = 'l',
     axes = FALSE,
     xlim = c(-3.1, 3.1))
axis(1,
     at = c(-2, 0, 2),
     labels = round(70 + 3.3 * c(-2, 0, 2), 2),
     cex.axis = 0.8)
these <- which(X <= -0.25)
polygon(c(X[these[1]], X[these], X[rev(these)[1]]),
        c(0, Y[these], 0),
        col = COL[1])

text(-2, 0.24, '  40%\n(0.40)', cex = 0.8, col = COL[1])

lines(X, Y)
abline(h = 0)

dev.off()
