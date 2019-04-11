library(openintro)
data(COL)

k <- 0:400
p <- 0.15
n <- 400
x1 <- 49
x2 <- 51
m <- n * p
s <- sqrt(n * p * (1 - p))

myPDF('normApproxToBinomFail.pdf', 7.5, 2.6,
      mar = c(1.9, 1, 0.3, 1),
      mgp = c(2.2, 0.6, 0),
      tcl = -0.35)

X <- seq(0, 100, 0.01)
Y <- dnorm(X, m, s)
plot(X, Y,
     type = "l",
     xlim = c(37, 83),
     axes = FALSE,
     xlab = "",
     ylab = "")
polygon(c(x1, x1, x2, x2),
        dnorm(c(-1000, x1, x2, -1000), m, s),
        col = COL[1])
polygon(rep(c(x1 - 1.1, x1, x1 + 1, x2 + 0.1), rep(2, 4)) + 0.5,
        dbinom(c(-1000, x1, x1, x1 + 1, x1 + 1, x2, x2, -1000),
            n, p),
        border = COL[4],
        lwd = 2)
axis(1)
axis(1,
     1:200,
     rep("", 200),
     tcl = -0.12)
abline(h = 0)

dev.off()
