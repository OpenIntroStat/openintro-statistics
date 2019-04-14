# load openintro package for colors ---------------------------------
library(openintro)

# generate data -----------------------------------------------------
set.seed(12345)
bimod = c(rnorm(300, mean = 5, sd = 1), 
          rnorm(300, mean = 12, sd = 1), 
          runif(25, min = 13, max = 28))

# histogram and box plot --------------------------------------------
pdf("hist_vs_box.pdf", height = 2.2, width = 8)
par(mar = c(2, 2.8, 0.2, 0.5), las = 1, mgp = c(2.9, 0.7, 0),
    cex.axis = 1.5, cex.lab = 1.5)
layout(matrix(1:2, 1), 2:1)
histPlot(bimod, xlab = "", ylab = "", yaxt = "n", col = COL[1])
par(mar = c(2, 2.8, 0.2, 0))
boxPlot(bimod, col = COL[1,2], xlim = c(0.4, 1.6))
dev.off()