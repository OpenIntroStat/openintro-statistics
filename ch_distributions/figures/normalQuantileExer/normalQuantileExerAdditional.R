library(openintro)
data(COL)

source("QQNorm.R")

set.seed(1)
obs1 <- 0.3 * rchisq(25, 1.4)

set.seed(5)
obs2 <- 16 - 2 * rlnorm(50, sdlog = 0.8)

myPDF("normalQuantileExerAdditional.pdf", 7.2, 3.18,
      mfrow = c(1, 2),
      mgp = c(2.4, 0.55, 0),
      mar = c(3.5, 3.45, 1, 1),
      cex.lab = 1.1)

QQNorm(obs1, 0:2, lwd = 2)
QQNorm(obs2, seq(5, 15, 5), lwd = 2)
dev.off()
