CorrelationPlot <- function(x, y, ...) {
  plot(x, y,
       axes = FALSE,
       pch = 20,
       col = COL[1, 2],
       cex = 1.351,
       xlab = '',
       ...)
  box()
  mtext(paste('R =', format(c(round(cor(x,y), 2), 0.01))[1]),
        side = 1,
        line = 1,
        cex = 1.1)
}
