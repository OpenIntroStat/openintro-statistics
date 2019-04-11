library(openintro)

GenerateLmPlot <- function(x, y, xlim, ylim1, ylim2.mult) {
  plot(x, y,
       axes = FALSE,
       pch = 20,
       col = COL[1, 2],
       cex = 1.202,
       xlim = xlim,
       ylim = ylim1)
  box()
  g <- lm(y ~ x)
  abline(g, col = COL[5])
  plot(x, g$residuals,
       pch = 20,
       col = COL[1, 2],
       cex = 1.202,
       xlim = xlim,
       axes = FALSE,
       ylim = ylim2.mult * c(-1, 1) * max(abs(g$residuals)))
  box()
  abline(h = 0, col = COL[5], lty = 2)
}

myPDF('sampleLinesAndResPlots.pdf', 5, 2.5,
      mfrow = 2:3,
      mar = rep(0.5, 4))

MyLayOut <- matrix(1:6, 2)
layout(mat = MyLayOut,
       widths = rep(2, 3),
       heights = c(2, 1),
       respect = TRUE)

these <- simulated_scatter$group == 6
x <- simulated_scatter$x[these]
y <- simulated_scatter$y[these]
GenerateLmPlot(x, y,
               xlim = c(-0.03, 1.03),
               ylim1 = c(-10, 1),
               ylim2.mult = 2.5)

these <- simulated_scatter$group == 7
x <- simulated_scatter$x[these]
y <- simulated_scatter$y[these]
GenerateLmPlot(x, y,
               xlim = c(-0.2, 4.2),
               ylim1 = c(-35, 2),
               ylim2.mult = 1.8)

these <- simulated_scatter$group == 8
x <- simulated_scatter$x[these]
y <- simulated_scatter$y[these]
GenerateLmPlot(x, y,
               xlim = c(-0.03, 1.03),
               ylim1 = c(-2, 2),
               ylim2.mult = 1.2)

dev.off()
