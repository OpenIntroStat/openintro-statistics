# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------
data(bdims)

# histogram of heights ----------------------------------------------

pdf("adult_heights_hist.pdf", height = 3, width = 6)
par(mar=c(3.7,2.5,0.5,0.5), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.5)
histPlot(bdims$hgt, col = COL[1], xlab = "Height", ylab = "")
dev.off()