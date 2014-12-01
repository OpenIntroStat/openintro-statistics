library(openintro)
data(COL)
set.seed(2)

myPDF("nullDistForPHatIfLiverTransplantConsultantIsNotHelpful.pdf", 6.6, 3.5, mgp=c(2, 0.5, 0), mar=c(3.1, 4.6, 0.5, 0.5))
pHat <- rbinom(10^4, 62, 0.1)/62
M    <- max(pHat)*62

histPlot(pHat, breaks=(-1:(2*M)+0.75)/2/62, xlab=expression(hat(p)[sim]*"    "), col=COL[7,3], ylab="")

histPlot(pHat[pHat < 0.05], breaks=(-1:(2*M)+0.75)/2/62, col=COL[1], add=TRUE)

par(las=0)
mtext("Number of simulations", 2, 3.3)

sum(pHat<0.05)/10^4
dev.off()