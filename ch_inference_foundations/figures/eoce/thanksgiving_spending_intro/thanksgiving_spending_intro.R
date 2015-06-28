# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------
data(tgSpending)

# population histogram ----------------------------------------------
pdf("thanksgiving_spending_intro_pop_hist.pdf", height = 2.7, width = 6)
par(mar=c(3.4,2.2,0,0.5), las=1, mgp=c(2.2,0.55,0), tcl = -0.3)
histPlot(tgSpending$spending, col = COL[1], 
         xlab = "Spending", ylab = "")
dev.off()