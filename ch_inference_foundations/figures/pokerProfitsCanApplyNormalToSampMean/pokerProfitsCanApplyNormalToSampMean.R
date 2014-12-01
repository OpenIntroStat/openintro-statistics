
library(openintro)
data(COL)

d <- read.delim('poker.txt', FALSE)
profit <- d$V1

pdf('pokerProfitsCanApplyNormalToSampMean.pdf', 5, 3)
par(mar=c(4,4,1,1), mgp=c(2.6, 0.7, 0), las=1)
histPlot(profit, xlab='Poker winnings and losses (US$)', ylab='Frequency', col=COL[1])
dev.off()
