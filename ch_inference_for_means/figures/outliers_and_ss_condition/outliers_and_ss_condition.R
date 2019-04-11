library(openintro)
set.seed(2)

d1 <- rnorm(15, 3, 2)
d2 <- c(exp(rnorm(49, 0, 0.7)), 22)

myPDF('outliers_and_ss_condition.pdf', 8, 2.5,
      mar = c(3, 3, 0.5, 2),
      mgp = c(1.8, 0.5, 0),
      mfrow = c(1, 2))

histPlot(d1, axes = FALSE, # breaks = 20,
         xlab = "Sample 1 Observations (n = 15)",
         ylab = "",
         col = COL[1])
axis(1, at = seq(-10, 10, 2))
axis(2)
par(las = 0)
mtext("Frequency", 2, 1.8)

par(las = 1, mar = c(3, 4, 0.5, 0.5))
histPlot(d2, axes = FALSE, breaks = 20,
         xlab = "Sample 2 Observations (n = 50)",
         ylab = "",
         col = COL[1])
axis(1, at = seq(-10, 30, 10))
axis(2)
par(las = 0)
mtext("Frequency", 2, 2)

dev.off()
