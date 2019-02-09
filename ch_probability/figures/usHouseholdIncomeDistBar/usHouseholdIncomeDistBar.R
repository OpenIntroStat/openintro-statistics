library(openintro)
data(COL)

myPDF('usHouseholdIncomeDistBar.pdf', 5.2, 3,
      mar = c(3.4, 4.2, 0.8, 1))
p <- c(0.28, 0.27, 0.29, 0.16)
names(p) <- c('$0-25k', '$25k-50k', '$50k-100k', '$100k+')
barplot(p, xlab = '', col = COL[1])
par(las = 0)
mtext('US Household Incomes', side = 1, line = 2.3)
mtext('Probability', side = 2, line = 3)
abline(h = 0)
dev.off()
