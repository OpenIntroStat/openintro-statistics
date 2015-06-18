library(openintro)
data(COL)

data(run10Samp)
d <- run10Samp

myPDF("run10SampTimeHistogram.pdf", 5, 2.8,
      mar = c(3.5, 3.5, 0.5, 1),
      mgp = c(2.2, 0.55, 0))
histPlot(d$time,
         main = "",
         xlab = "Time (minutes)",
         ylab = "Frequency",
         col = COL[1])
dev.off()
