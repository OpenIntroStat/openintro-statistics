library(openintro)
data(COL)

set.seed(1)

pdf('satActNormals.pdf', 6, 3.5)
par(mfrow = c(2, 1),
    las = 1,
    mar = c(2.5, 0, 0.5, 0))

# _____ Curve 1 _____ #
m <- 1100
s <- 200
X <- m + s * seq(-6, 6, 0.01)
Y <- dnorm(X, m, s)
plot(X, Y,
     type = 'l',
     axes = FALSE,
     xlim = m + s * 2.7 * c(-1, 1))
axis(1, at = m + s * (-3:3))
abline(h = 0)
lines(c(m, m),
      dnorm(m, m, s) * c(0.01, 0.99),
      lty = 2,
      col = '#EEEEEE')
lines(c(m, m) + s,
      dnorm(m + s, m, s) * c(0.01, 1.25),
      lty = 2, col = COL[1])
text(m + s,
     dnorm(m + s, m, s) * 1.25,
     'Ann',
     pos = 3,
     col = COL[1])


# _____ Curve 2 _____ #
par(mar = c(2, 0, 1, 0))
m <- 21
s <- 6
X <- m + s * seq(-6, 6, 0.01)
Y <- dnorm(X, m, s)
plot(X, Y,
     type = 'l',
     axes = FALSE,
     xlim = m + s * 2.7 * c(-1, 1))
axis(1, at = m + s * (-3:3))
abline(h = 0)
lines(c(m, m),
      dnorm(m, m, s) * c(0.01, 0.99),
      lty = 2,
      col = '#EEEEEE')
lines(c(m, m) + 3,
      dnorm(m + 3, m, s) * c(0.01, 1.2),
      lty = 2,
      col = COL[1])
text(m + 3,
     dnorm(m + 3, m, s) * 1.05,
     'Tom',
     pos = 4,
     col = COL[1])

dev.off()
