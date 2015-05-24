
QQNorm <- function(x, M, SD, col) {
  qqnorm(x,
         cex = 0.7,
         main = '',
         axes = FALSE,
         ylab = 'observed',
         col = col)
  axis(1, cex.axis = 1.2)
  axis(2, cex.axis = 1.2)
  qqline(x)
}

NormalHist <- function(obs, hold, M, SD, col) {
  plot(0, 0,
       type = 'n',
       xlab = '',
       ylab = '',
       axes = FALSE,
       main = '',
       xlim = c(-3, 3),
       ylim = c(0, max(hold$density)))
  for (i in 1:length(hold$counts)) {
    rect(hold$breaks[i], 0,
         hold$breaks[i + 1], hold$density[i],
         col = col)
  }
  axis(1, cex.axis = 1.2)
  x <- seq(min(obs) - 2, max(obs) + 2, 0.01)
  y <- dnorm(x, M, SD)
  lines(x, y, lwd = 1.5)
}