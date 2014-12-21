library(openintro)
data(COL)
data(poker)

myPDF('pokerProfitsCanApplyNormalToSampMean.pdf', 5, 3,
      mar = c(3.7, 3.7, 0.7, 0.7),
      mgp = c(2.3, 0.6, 0))
histPlot(poker$winnings,
         xlab = 'Poker winnings and losses (US$)',
         ylab = 'Frequency',
         col = COL[1])
dev.off()
