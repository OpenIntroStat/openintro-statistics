library(openintro)
data(COL)

source("fcidMHeights-data.R")
source("fcidMHeights-helpers.R")

hold <- hist(obs, plot = FALSE)

myPDF("fcidMHeights.pdf", 6, 2.7,
      mfrow = c(1, 2),
      mgp = c(2, 0.7, 0),
      mar = c(3, 0.2, 1, 0.8))
NormalHist(obs, hold, mean(obs), sd(obs), COL[1])

par(mar = c(3,4,1,0))
QQNorm(obs, mean(obs), sd(obs), COL[1])
dev.off()
