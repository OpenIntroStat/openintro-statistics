# load packages -----------------------------------------------------
library(openintro)

# set number of simulations -----------------------------------------
N = 10^4

# randomize ---------------------------------------------------------

pHatObs = 0.04

set.seed(29)

gr <- c(rep("trtmt", 34), rep("ctrl",16))
yawn <- c(rep(c("y", "n"), c(10, 24)), rep(c("y", "n"), c(4, 12)))

d <- rep(NA, N)
for(i in 1:N){
  grf  <- sample(gr)
  p1   <- sum(yawn[grf == "trtmt"] == "y") / 34
  p2   <- sum(yawn[grf == "ctrl"] == "y") / 16
  d[i] <- p2 - p1
}
sum((d) >= pHatObs) / N

# plot randomization dist for question ------------------------------

pdf("yawning_two_sample_randomization.pdf", height = 3.5, width = 6.7)

par(mar=c(4,2,0,0), las=1, mgp=c(2.8,0.55,0))

histPlot(d, breaks=seq(-0.6, 0.7, 0.02), col=COL[7,4], 
         main="", xlab=expression(hat(p)[trtmt] - hat(p)[ctrl]*"    "), 
         ylab="", axes=FALSE)
axis(1)
axis(2, at=(0:5)*N/20, labels=c(0, NA, 2, NA, 4, NA)/20)
abline(h = 0)

abline(h = c((1:5)*N/20), lty = 3, lwd = 2, col = COL[7])

dev.off()

# plot randomization dist for solution ------------------------------

pdf("yawning_two_sample_randomization_soln.pdf", height = 3.5, width = 6.7)

par(mar=c(4,2,0,0), las=1, mgp=c(2.8,0.55,0))

histPlot(d, breaks=seq(-0.6, 0.7, 0.02), col=COL[7,4], 
         main="", xlab=expression(hat(p)[trtmt] - hat(p)[ctrl]*"    "), 
         ylab="", axes=FALSE)
axis(1)
axis(2, at=(0:5)*N/20, labels=c(0, NA, 2, NA, 4, NA)/20)
abline(h = 0)

histPlot(d[d >= pHatObs], breaks=seq(-0.6, 0.7, 0.02), col=COL[1], add=TRUE)
abline(h=0)
lines(rep(pHatObs, 2), c(0, 6.1)*N/25, lty=3, lwd=1.7)
text(pHatObs, 6*N/25, as.character(pHatObs), pos=3, cex=1.25)

dev.off()