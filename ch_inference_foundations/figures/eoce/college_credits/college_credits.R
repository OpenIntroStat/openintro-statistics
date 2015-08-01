# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------
data(credits)

# histogram of college credits --------------------------------------

pdf("college_credits_hist.pdf", height = 3, width = 6)
par(mar=c(3.7,2.2,0.5,0.5), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.5)
histPlot(credits[,1], col = COL[1], xlab = "Number of credits", ylab = "")
dev.off()