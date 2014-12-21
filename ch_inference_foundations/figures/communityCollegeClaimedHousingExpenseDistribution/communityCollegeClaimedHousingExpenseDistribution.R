library(openintro)
data(COL)
data(ccHousing)

x <- ccHousing$price
t.test(x, mu = 650)
mean(x)
sd(x)
length(x)

myPDF('communityCollegeClaimedHousingExpenseDistribution.pdf',
      6.5, 3.9,
      mar = c(3.2, 3.5, 1, 1),
      mgp = c(1.9, 0.7, 0))
histPlot(x,
         breaks = 10,
         xlab = 'Housing expense (dollars)',
         ylab = '',
         col = COL[1],
         axes = FALSE)
axis(1, at = seq(400, 1000, 200))
axis(2, at = seq(0, 15, 5))
mtext('Freqency', side = 2, line = 2.3, las = 0)
dev.off()
