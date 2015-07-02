library(openintro)
set.seed(83629)
x = seq(1,50,1)

Pdf <- function(file.name, width = 4, height = 3) {
  pdf(file.name, width, height)
  par(mar = c(2.4, 0.5, 0.2, 0.5),
      las = 1,
      mgp = c(1, 0.7, 0),
      cex.lab = 1.5)
}

y = -2 * x + 20 + rnorm(length(x), mean = 0, sd = 10)

xInf = c(x[1:49], 200)

yLev = c(y[1:49], -370)

yOut = c(y[1:25], y[26]+100, y[27:50])

###

Pdf("outInf1.pdf")

plot(y ~ xInf, pch = 19, col=COL[1,2], xlab = "(a)", ylab = "", xaxt = "n", yaxt = "n", cex.lab = 1.5)

lmInf = lm(y ~ xInf)
abline(lmInf, col = COL[2])

dev.off()

###


Pdf("outLev1.pdf")

plot(yLev ~ xInf, pch = 19, col=COL[1,2], xlab = "(b)", ylab = "", xaxt = "n", yaxt = "n", cex.lab = 1.5)

lmLev = lm(yLev ~ xInf)
abline(lmLev, col = COL[2])

dev.off()

###

Pdf("outOut1.pdf")

plot(yOut ~ x, pch = 19, col=COL[1,2], xlab = "(c)", ylab = "", xaxt = "n", yaxt = "n", cex.lab = 1.5)

lmOut = lm(yOut~ x)
abline(lmOut, col = COL[2])

dev.off()

##
##

x = seq(1,50,1)

y = 3 * x + 3 + rnorm(length(x), mean = 0, sd = 10)

xInf = c(x[1:49], -50)

yInf = c(y[1:49], -300)

yOut = c(y[1:25], y[26]+100, y[27:50])


Pdf("outInf2.pdf")

plot(y ~ xInf, pch = 19, col=COL[1,2], xlab = "(a)", ylab = "", xaxt = "n", yaxt = "n", cex.lab = 1.5)

lmInf = lm(y ~ xInf)
abline(lmInf, col = COL[2])

dev.off()

###

Pdf("outInf3.pdf")

plot(yInf ~ xInf, pch = 19, col=COL[1,2], xlab = "(b)", ylab = "", xaxt = "n", yaxt = "n", cex.lab = 1.5)

abline(lm(yInf ~ xInf), col = COL[2])

dev.off()

###

Pdf("outOut2.pdf")

plot(yOut ~ x, pch = 19, col=COL[1,2], xlab = "(c)", ylab = "", xaxt = "n", yaxt = "n", cex.lab = 1.5)

lmOut = lm(yOut~ x)
abline(lmOut, col = COL[2])

dev.off()

