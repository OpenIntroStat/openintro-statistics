library(openintro)
data(COL)


data(run10Samp)
d <- run10Samp

myPDF("run10SampTimeHistogram.pdf", 5, 2.8,
      mar = c(3.5, 3.5, 0.5, 1),
      mgp = c(2.2, 0.55, 0))
histPlot(d$time,
         main = "",
         xlab = "Time (Minutes)",
         ylab = "Frequency",
         col = COL[1])
dev.off()


set.seed(1)
run17 <- subset(run17, event == "10 Mile")
mean(run17$net_sec / 60)
d <- run17[sample(nrow(run17), 100), ]
myPDF("run17SampTimeHistogram.pdf", 5, 2.8,
      mar = c(3.5, 3.5, 0.5, 1),
      mgp = c(2.2, 0.55, 0))
histPlot(d$net_sec / 60,
         main = "",
         xlab = "Time (Minutes)",
         ylab = "Frequency",
         col = COL[1])
dev.off()
t.test(d$net_sec / 60, mu = 93.29)
mean(d$net_sec / 60)
sd(d$net_sec / 60)

