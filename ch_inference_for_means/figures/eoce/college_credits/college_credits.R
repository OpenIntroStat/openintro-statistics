# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------
data(credits)

# histogram of college credits --------------------------------------

pdf("college_credits_hist.pdf", height = 2, width = 4)
par(mar=c(3.4,3.4,0.5,0.5), las=1, mgp=c(2.2,0.7,0), cex.lab = 1)
histPlot(credits$credits, col = COL[1],
    xlab = "Number of credits",
    ylab = "Frequency",
    axes = FALSE)
axis(1)
axis(2, seq(0, 30, 10))
dev.off()