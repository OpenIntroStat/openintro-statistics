library(openintro)
data(COL)

data(run10Samp)
xBars <- cumsum(run10Samp$time) / (1:100)

myPDF('netTimeRunningMean.pdf', 5.225, 2.66,
      mar=c(3.3, 4, 1, 1))

plot(xBars,
     type = "l",
     axes = FALSE,
     xlab = "",
     ylab = "Running mean (minutes)",
     col = COL[1],
     lwd = 2,
     ylim = c(85, 100))
axis(1, at = seq(0, 100, 25))
axis(2, at = seq(80, 110, 5))
mtext("Sample size", 1, 2)
dev.off()

mean(run10Samp$time)
sd(run10Samp$time)
