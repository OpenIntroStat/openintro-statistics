library(openintro)
data(COL)

d <- yrbss.samp$physically_active_7d
xBars <- cumsum(d) / (1:100)
m <- mean(yrbss$physically_active_7d, na.rm = TRUE)

myPDF('yrbssActiveRunningMean.pdf', 5.5, 2.7,
      mar=c(3.3, 4.9, 1, 2))

plot(xBars,
     type = "l",
     axes = FALSE,
     xlab = "",
     ylab = "Running mean of days\nphysically active per week",
     col = COL[1],
     lwd = 2,
     ylim = range(xBars))
axis(1, at = seq(0, 100, 25))
axis(2, at = seq(0, 5, 1))
abline(h = m, lty = 2, col = COL[6,3])
mtext("Sample size", 1, 2)
dev.off()

m
sd(yrbss$physically_active_7d, na.rm = TRUE)
