library(openintro)
dim(nba_players_19)
head(nba_players_19)

source("nbaNormal-helpers.R")

obs <- nba_players_19$height
M  <- mean(obs)
SD <- sd(obs)
hold <- hist(obs, plot = FALSE)

myPDF("nbaNormal.pdf", 6, 2.5,
      mfrow = c(1, 2),
      mgp = c(2, 0.5, 0),
      mar = c(3, 0.5, 0.5, 2),
      cex.axis = 0.8)
NormalHist(obs, hold, M, SD, COL[1])
par(mar = c(3, 4, 0.5, 0.5))
QQNorm(obs, M, SD, COL[1])
dev.off()
