library(openintro)
data(COL)

k <- 0:400
p <- 0.2
n <- 400

myPDF('normApproxToBinomFail.pdf', 7.5, 2.6,
      mar = c(1.9, 1, 0.3, 1),
      mgp = c(2.2, 0.6, 0),
      tcl = -0.35)

X <- seq(40, 120, 0.01)
Y <- dnorm(X, 80, 8)
plot(X, Y,
     type = "l",
     xlim = c(60, 100),
     axes = FALSE,
     xlab = "",
     ylab = "")
polygon(c(69, 69, 71, 71),
        dnorm(c(-1000, 69, 71, -1000), 80, 8),
        col = COL[1])
polygon(rep(c(67.9, 69, 70, 71.1), rep(2, 4)) + 0.5,
        dbinom(c(-1000, 69, 69, 70, 70, 71, 71, -1000), 400, .2),
        border = COL[4],
        lwd = 2)
axis(1)
axis(1,
     1:200,
     rep("", 200),
     tcl = -0.12)
abline(h = 0)

dev.off()
