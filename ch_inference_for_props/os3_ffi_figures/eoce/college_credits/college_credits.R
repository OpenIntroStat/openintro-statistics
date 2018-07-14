# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------
data(credits)

# histogram of college credits --------------------------------------

myPDF("college_credits_hist.pdf", 6, 3,
    mar = c(3.2,2.2,0.5,0.5), las=1, mgp=c(2,0.55,0))
histPlot(credits[,1], col = COL[1], xlab = "Number of credits", ylab = "")
dev.off()
