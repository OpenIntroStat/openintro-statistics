library(openintro)
data(tgSpending)

oiB = "#3E9BC0"

#

pdf("tgSpending.pdf", height = 3, width = 6)

par(mar=c(3.7,2,1,1), las=1, mgp=c(2.5,0.7,0), mfrow = c(1,1), cex.lab = 1.25)

histPlot(tgSpending$spending, col = oiB, xlab = "Spending", ylab = "")

dev.off()