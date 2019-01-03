library(openintro)
data(COL)

d <- subset(simulated_scatter, group == 5)

myPDF('notGoodAtAllForALinearModel.pdf', 6.4, 2.743,
      mar = c(3, 4, 1, 2))
PlotWLine(d$x, d$y,
          xlab = 'Angle of Incline (Degrees)',
          ylab = 'Distance Traveled (m)',
          axes = FALSE, col = COL[1])
axis(1, at = seq(0, 90, length.out = 7), rep("", 7), tcl = -0.1)
axis(1, at = seq(0, 90, length.out = 4))
axis(2, at = seq(0, 15, 5))
abline(h = 0)
text(mean(d$x), mean(d$y),
     'Best fitting straight line is flat (!)',
     pos = 1,
     col = COL[4])
abline(h = 0)
dev.off()
