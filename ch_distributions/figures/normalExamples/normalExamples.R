library(openintro)
data(COL)

source("normalExamples-data.R")
source("normalExamples-helpers.R")

myPDF("normalExamples.pdf", 6.6, 4,
      mfrow = c(2, 3),
      mgp = c(2, 0.7, 0),
      mar = c(3, 0, 1, 1))
NormalHist(obs1, hold1, M1, SD1, COL[1])
NormalHist(obs2, hold2, M2, SD2, COL[2])
NormalHist(obs3, hold3, M3, SD3, COL[3])

par(mar = c(3,2.85,1,2))
QQNorm(obs1, M1, SD1, COL[1])
QQNorm(obs2, M2, SD2, COL[2])
QQNorm(obs3, M3, SD3, "#B09A00")

dev.off()
