library(openintro)
data(COL)

x <- student.housing$price
t.test(x, mu = 650)
mean(x)
sd(x)
length(x)

myPDF('communityCollegeClaimedHousingExpenseDistribution.pdf',
      6.5, 3.4,
      mar = c(3.2, 3.5, 1, 1),
      mgp = c(1.9, 0.7, 0))
histPlot(x,
         breaks = 20,
         xlab = 'Housing Expense (dollars)',
         ylab = '',
         col = COL[1],
         axes = FALSE)
axis(1, at = seq(400, 1200, 200))
axis(2, at = seq(0, 30, 5))
mtext('Freqency', side = 2, line = 2.3, las = 0)
dev.off()
