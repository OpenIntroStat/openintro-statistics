# load openintro package for colors ---------------------------------
library(openintro)

# generate data -----------------------------------------------------
set.seed(7365)

sym = rnorm(1000, mean = 60, sd = 3)
uni = runif(1000, min = 0, max = 100)
rs = rgamma(1000, shape = 3, rate = 2)

# histograms and box plots ------------------------------------------
pdf("hist_box_match.pdf", width = 10, height = 3)
par(mar=c(4, 3.6, 0, 0), las = 1, mgp = c(2.7, 0.7, 0), 
    mfrow = c(1,6), 
    cex.lab = 1.5, cex.axis = 1.5)

histPlot(sym, xlab = "(a)", ylab = "", col = COL[1], axes = FALSE)
axis(1, seq(50,70,10))

histPlot(uni, xlab = "(b)", ylab = "", col = COL[1], axes = FALSE)
axis(1, seq(0,100,50))

histPlot(rs, xlab = "(c)", ylab = "", col = COL[1], axes = FALSE)
axis(1, seq(0,6,2))

boxPlot(rs, xlab = "(1)", ylab = "", col = COL[1,3])
boxPlot(sym, xlab = "(2)", ylab = "", col = COL[1,3])
boxPlot(uni, xlab = "(3)", ylab = "", col = COL[1,3])

dev.off()
