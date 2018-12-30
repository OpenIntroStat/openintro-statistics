library(openintro)

col <- COL[1, 3]

myPDF('imperfLinearModel.pdf', 5.814, 1.875,
      mfrow = c(1, 3),
      mar = c(2, 2.5, 1, 2),
      mgp = c(1.9, 0.6, 0),
      las = 0)
par(mar = c(2, 2.25, 0.5, 0.8))
these <- simulated_scatter$group == 1
PlotWLine(simulated_scatter$x[these], simulated_scatter$y[these], col = col)
par(mar = c(2, 2.9, 0.5, 0.4))
these <- simulated_scatter$group == 2
PlotWLine(simulated_scatter$x[these], simulated_scatter$y[these], col = col)
par(mar = c(2, 3.3, 0.5, 0))
these <- simulated_scatter$group == 3
PlotWLine(simulated_scatter$x[these], simulated_scatter$y[these], col = col)
dev.off()
