library(openintro)
data(ageAtMar)

oiB = "#3E9BC0"

pdf("ageAtMar_hist.pdf", height = 3, width = 6)

par(mar=c(3.7,2.2,1,1), las=1, mgp=c(2.5,0.7,0), mfrow = c(1,1), cex.lab = 1.25)

histPlot(ageAtMar$age, col = oiB, xlab = "Age at first marriage", ylab = "")

dev.off()










