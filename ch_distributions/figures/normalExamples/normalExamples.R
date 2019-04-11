library(openintro)
data(COL)

obs1 <- simulated_normal$n40
obs2 <- simulated_normal$n100
obs3 <- simulated_normal$n400

hold1 <- hist(obs1, plot=FALSE)
M1    <- mean(obs1)
SD1   <- sd(obs1)

hold2 <- hist(obs2, breaks=10, plot=FALSE)
M2    <- mean(obs2)
SD2   <- sd(obs2)

hold3 <- hist(obs3, breaks=12, plot=FALSE)
M3    <- mean(obs3)
SD3   <- sd(obs3)

source("normalExamples-helpers.R")

myPDF("normalExamples.pdf", 7.3, 4.4,
      mfrow = c(2, 3),
      mgp = c(2, 0.7, 0),
      mar = c(3, 0, 1, 1))
NormalHist(obs1, hold1, M1, SD1, COL[1])
NormalHist(obs2, hold2, M2, SD2, COL[2])
NormalHist(obs3, hold3, M3, SD3, COL[3])

par(mar = c(3,2.85,1,1.8))
QQNorm(obs1, M1, SD1, COL[1])
QQNorm(obs2, M2, SD2, COL[2])
QQNorm(obs3, M3, SD3, "#B09A00")

dev.off()
