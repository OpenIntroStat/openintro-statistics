
QQNorm <- function(x, M, SD, col) {
  qqnorm(x,
         cex = 0.7,
         main = '',
         axes = FALSE,
         ylab = 'Observed',
         col = col)
  axis(1)
  axis(2)
  qqline(x)
}

NormalHist <- function(obs, hold, M, SD, col) {
  x <- seq(min(obs) - 2, max(obs) + 2, 0.01)
  y <- dnorm(x, M, SD)
  plot(0, 0,
       type = 'n',
       xlab = 'Height (inches)',
       ylab = '',
       axes = FALSE,
       main = '',
       xlim = M + c(-3, 3) * SD,
       ylim = c(0, max(hold$density, y)))
  for (i in 1:length(hold$counts)) {
    rect(hold$breaks[i], 0,
         hold$breaks[i + 1], hold$density[i],
         col = col)
  }
  axis(1)
  lines(x, y, lwd = 1.5)
}