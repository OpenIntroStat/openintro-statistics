rm(list = ls())
library(openintro)

X <- seq(0, 8, len = 300)
Y <- df(X, 2.00001, 423)

myPDF("fDist2And423.pdf", 5, 2.4,
      mar = c(2.8, 0.5, 0, 0.5),
      mgp = c(1.8, 0.4, 0))
plot(X, Y,
     type = "l",
     xlab = "F",
     ylab = "",
     axes = FALSE,
     lwd = 1.5)
lines(c(0, 8), rep(0, 2))
axis(1)
dev.off()


myPDF("fDist2And423Shaded.pdf", 5, 1.8,
      mar = c(1.6, 3.1, 0.5, 0.5),
      mgp = c(2, 0.5, 0))
plot(X, Y,
     type = "l",
     xlab = "F",
     ylab = "",
     axes = FALSE)
lines(c(0, 8), rep(0, 2))
axis(1)
temp <- which(X > 5.077)
x    <- X[c(temp, rev(temp), temp[1])]
y    <- c(Y[temp], rep(0, length(temp)), Y[temp[1]])
polygon(x, y, col = COL[4], border = COL[4], lwd = 2)
arrows(6.3, 0.3, 6.5, 0.05, length = 0.05)
text(6.3, 0.3, "Small tail area", pos = 3)
dev.off()
