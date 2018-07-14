library(openintro)
data(COL)

data(yrbss.samp)
d <- yrbss.samp

myPDF("yrbssSampHistograms.pdf", 5.7, 3.9,
      mfrow = c(2, 2),
      mar = c(3.5, 3.5, 0.5, 1.5),
      mgp = c(2.2, 0.55, 0))
histPlot(d$height,
         main = "",
         xlab = "Height (meters)",
         ylab = "Frequency",
         col = COL[1])
par(mar = c(3.5, 4.5, 0.5, 0.5))
histPlot(d$weight,
         main = "",
         xlab = "Weight (kilograms)",
         ylab = "Frequency",
         col = COL[1])
par(mar = c(3.5, 3.5, 0.5, 1.5))
histPlot(d$physically_active_7d,
         breaks = 0:8 - 0.5,
         main = "",
         xlab = "Days Physically Activity in Past Week",
         ylab = "Frequency",
         col = COL[1],
         axes = FALSE)
axis(1, at = 0:7)
axis(2)
par(mar = c(3.5, 4.5, 0.5, 0.5))
histPlot(d$strength_training_7d,
         breaks = 0:8 - 0.5,
         main = "",
         xlab = "Days Lifting Weights in Past Week",
         ylab = "Frequency",
         col = COL[1],
         axes = FALSE)
axis(1, at = 0:7)
axis(2, at = seq(0, 30, 10))
dev.off()
