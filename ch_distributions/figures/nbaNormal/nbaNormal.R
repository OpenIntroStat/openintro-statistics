library(openintro)
data(nba.heights)
data(COL)

source("nbaNormal-helpers.R")

obs <- nba.heights[, 4]
M  <- mean(obs)
SD <- sd(obs)
hold <- hist(obs, plot = FALSE)

myPDF("nbaNormal.pdf", 6, 2.5,
      mfrow = c(1, 2),
      mgp = c(2, 0.5, 0),
      mar = c(3, 0.5, 0.5, 2),
      cex.axis = 0.8)
NormalHist(obs, hold, M, SD, COL[1])
par(mar = c(3, 2, 0.5, 0.5))
QQNorm(obs, M, SD, COL[1])
dev.off()
