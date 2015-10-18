
QQNorm <- function(obs, at  =  pretty(obs), lwd = 2) {
  qqnorm(obs,
         cex = 0.9,
         main = '',
         axes = FALSE,
         ylab = 'Observed',
         xlab = "",
         col = COL[1],
         lwd = lwd)
  mtext("Theoretical quantiles",
        1,
        1.8,
        cex = 0.8)
  axis(1, cex.axis = 1.1)
  axis(2, at = at, cex.axis = 1.1)
}
