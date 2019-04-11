set.seed(3)
library(openintro)
data(COL)

n.sim <- 10000
samp.size <- 10  # 2541
prop <- 0.25
width <- 0.025

samples <- matrix(sample(0:1, n.sim * samp.size, TRUE, c(1 - prop, prop)), n.sim)
results <- apply(samples, 1, mean)
mean(results)
sd(results)

myPDF('sampling_10_prop_25p.pdf', 9, 2.4,
    mar = c(3.5, 4, 0.7, 0.2),
    mgp = c(2.3, 0.6, 0),
    yaxs = "i",
    mfrow = c(1, 2))
histPlot(results,
    col = COL[1], breaks = seq(0, max(results) + 2 * width, width) - width / 2,
    xlab = "Sample Proportions",
    ylab = "",
    axes = FALSE)
at <- seq(0, 1, 0.1)
axis(1, at = seq(0, 1, 0.1), labels = rep("", 11))
axis(1, at = at)
axis(2, at = seq(0, 2000, 1000))
abline(h = 0, lwd = 2)
par(las = 0)
mtext("Frequency", 2, 2.9)
par(las = 1)
# x <- seq(-1, 2, 0.001)
# y <- dnorm(x, prop, sd(results))
# bin.max <- max(table(results))
# y <- y * bin.max / max(y)
# lines(x, y)

par(yaxs = "r", mar = c(3.5, 2.5, 0.4, 0.2))
normTail(prop, sd(results), L = -1000, lwd = 2, axes = FALSE)
axis(1, seq(-1, 2, 0.2))
abline(v = 0, lty = 2)

dev.off()
