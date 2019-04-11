library(openintro)
data(COL)

source("QQNorm.R")

obs1 <- simulated_dist$d5
obs2 <- simulated_dist$d6


myPDF("normalQuantileExerAdditional.pdf", 7.2, 3.18,
      mfrow = c(1, 2),
      mgp = c(2.4, 0.55, 0),
      mar = c(3.5, 3.45, 1, 1),
      cex.lab = 1.1)

QQNorm(obs1, 0:2, lwd = 2)
QQNorm(obs2, seq(5, 15, 5), lwd = 2)
dev.off()
