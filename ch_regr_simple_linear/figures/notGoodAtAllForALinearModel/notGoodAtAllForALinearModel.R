library(openintro)
data(COL)

set.seed(3)
myPDF('notGoodAtAllForALinearModel.pdf', 6.4, 2.743,
      mar = c(3, 4, 1, 2))
theta <- seq(0, pi / 2, length.out = 25)
v <- 12
noise <- rnorm(length(theta), sd = 0)
x <- 2 * v^2 * sin(theta) * cos(theta) / 9.8 + noise
PlotWLine(theta / pi * 2 * 90, x,
          xlab = 'Angle of incline (degrees)',
          ylab = 'Distance traveled (m)',
          axes = FALSE)
axis(1, at = seq(0, 90, length.out = 7), rep("", 7), tcl = -0.1)
axis(1, at = seq(0, 90, length.out = 4))
axis(2, at = seq(0, 15, 5))
abline(h = 0)
text(mean(theta / pi * 2 * 90), mean(x),
     'Best fitting straight line is flat (!)',
     pos = 1,
     col = COL[4])
abline(h = 0)
dev.off()
