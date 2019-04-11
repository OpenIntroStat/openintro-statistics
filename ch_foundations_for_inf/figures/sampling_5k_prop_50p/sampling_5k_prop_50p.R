set.seed(3)
library(openintro)
data(COL)

n.sim <- 5000
samp.size <- 1000
prop <- 0.5

samples <- matrix(sample(0:1, n.sim * samp.size, TRUE, c(1 - prop, prop)), n.sim)
results <- apply(samples, 1, mean)
mean(results)
sd(results)

myPDF('sampling_5k_prop_50p.pdf', 6.5, 3.2,
    mar = c(3.5, 3.8, 1.8, 0.7),
    mgp = c(2.3, 0.6, 0),
    yaxs = "i")
histPlot(results,
    col = COL[1], breaks = 50,
    xlab = "Sample Proportions",
    ylab = "",
    axes = FALSE,
    xlim = c(0.35, 0.65))
at <- seq(0, 1, 0.02)
axis(1, at = seq(0, 1, 0.01), labels = rep("", 101))
axis(1, at = seq(0, 1, 0.05))
# axis(1, at = at)
# axis(2, at = seq(0, 1200, 100), label = rep("", 13))
axis(2, at = seq(0, 200, 100))
par(las = 0)
mtext("Frequency", 2, 2.7)
dev.off()
