set.seed(1)
library(openintro)
data(COL)

n.sim <- 10000
samp.size <- 1000

samples <- matrix(sample(0:1, n.sim * samp.size, TRUE, c(0.44, 0.56)), n.sim)
results <- apply(samples, 1, mean)
mean(results)
sd(results)

myPDF('sampling_10k_prop_56p.pdf', 6.5, 3.2,
    mar = c(3.5, 3.5, 0.7, 0.7),
    mgp = c(2.3, 0.6, 0),
    yaxs = "i")
histPlot(results,
    col = COL[1], breaks = 25,
    xlab = "Sample Proportions",
    ylab = "",
    axes = FALSE)
at <- seq(0, 1, 0.05)
axis(1, at = seq(0, 1, 0.01), labels = rep("", 101))
axis(1, at = at)
# axis(2, at = seq(0, 1200, 100), label = rep("", 13))
axis(2, at = seq(0, 1200, 200))
# abline(v = 0.56, col = COL[4])

dev.off()
