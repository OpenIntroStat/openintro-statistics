# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------
data(bdims)

# histogram of heights ----------------------------------------------

myPDF("adult_heights_hist.pdf", 6, 3,
    mar = c(3.2,2.2,0.5,0.5), las=1, mgp=c(2,0.55,0))
histPlot(bdims$hgt, col = COL[1], xlab = "Height", ylab = "")
dev.off()