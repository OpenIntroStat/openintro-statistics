# load packages -----------------------------------------------------
library(openintro)

# set sample size and number of simulations -------------------------
n = 25
N = 10^4

# randomize ---------------------------------------------------------

set.seed(15)

p <- 0.31

pHat <- rbinom(N, n, p)/n
M    <- max(pHat)*n

pHatObs <- 0.4

sum(pHat >= pHatObs)/N

# plot randomization dist for question ------------------------------

pdf("assisted_reproduction_one_sample_randomization.pdf", height = 3, width = 6)

par(mar=c(4,4,0,0), las=1, mgp=c(2.5,1,0))

histPlot(pHat, breaks = (-1:(2*M)+0.75)/2/n, 
         xlab = expression(hat(p)[sim]*"    "), 
         col = COL[7,3], ylab = "", axes = FALSE)
axis(1)
axis(2, at = (0:3)*N/20, labels=c("0","0.05","0.10","0.15"))
abline(h = 0)

abline(h = seq(250, 1500, 250), lty = 3, lwd = 2, col = COL[7])

dev.off()

# plot randomization dist for solution ------------------------------

pdf("assisted_reproduction_one_sample_randomization_soln.pdf", height = 3, width = 6)

par(mar=c(4,4,0,0), las=1, mgp=c(2.5,1,0))

histPlot(pHat, breaks = (-1:(2*M)+0.75)/2/n, 
         xlab = expression(hat(p)[sim]*"    "), 
         col = COL[7,3], ylab = "", axes = FALSE)
axis(1)
axis(2, at = (0:3)*N/20, labels=c("0","0.05","0.10","0.15"))
abline(h = 0)

histPlot(pHat[pHat >= pHatObs], breaks = (-1:(2*M)+0.75)/2/n, 
         col = COL[1], add = TRUE)

lines(rep(pHatObs, 2), c(0, 3)*N/22, lty=3, lwd=1.7)
text(x = pHatObs, y = 3*N/22, as.character(pHatObs), pos=3, cex=1.25)

dev.off()