# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------
data(tgSpending)

# population histogram ----------------------------------------------
pdf("thanksgiving_spending_intro_pop_hist.pdf", height = 3, width = 6)
par(mar=c(3.7,2.2,0.5,0.5), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.5)
histPlot(tgSpending$spending, col = COL[1], 
         xlab = "Spending", ylab = "")
dev.off()