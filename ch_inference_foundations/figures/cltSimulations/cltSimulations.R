library(openintro)
data(COL)

set.seed(50)
n  <- c(2,5,12,30) #c(2,6,15,50)
ss <- 4*10^5
cex.axis <- 1.3
roof <- 1.03
bw <- 1.4

addNormal <- function(m, s, lty = 2,col = COL[4], ...){
  X <- seq(m-5*s, m+5*s, s/9.8)
  Y <- dnorm(X, m, s)
  lines(X, Y, lty = lty, col = col, ...)
}

myPDF('cltSimulations.pdf', 6.8, 8,
      mar = rep(0, 4),
      mgp = c(4, 0.9, 0))

layout(matrix(1:20, 5, byrow = TRUE),
       widths = c(0.85, 2, 2, 2),
       heights = rep(2, 5))


# _____ Create The Originals _____ #
X <- sort(c(-3, 1 - sqrt(3) - 0.001,
            1 - sqrt(3) + 0.001, -0.00001, 0, 0.00001,
            seq(0.05, 7.3, 0.025)))
Yu <- dunif(X, 1 - sqrt(3), 1 + sqrt(3))
Ye <- dexp(X)
Yl <- dlnorm(X, log(1 / sqrt(2)), sqrt(log(2)) + 0.2)

plot(0:1, 0:1,
     axes = FALSE,
     type = 'n')
text(0.5, 0.47, 'population\ndistributions', cex = 1.4)

par(mar = c(3, 1, 0, 1))
plot(X, Yu,
     type = 's',
     xlab = '',
     ylab = '',
     xlim = c(-2, 6),
     ylim = c(0, 0.75),
     axes = FALSE,
     col = COL[1],
     lwd = 2)
text(1, 0.77, 'uniform', pos = 1, cex = 1.7)
axis(1, at = seq(-2, 6, 2), cex.axis = cex.axis)
abline(h = 0)

plot(X, Ye,
     type = 'l',
     xlab = '',
     ylab = '',
     xlim = c(-2, 6),
     ylim = c(0, 83 / 60),
     axes = FALSE,
     col = COL[1],
     lwd = 2)
text(1, 86 / 60, 'exponential', pos = 1, cex = 1.7)
axis(1, at = seq(-2, 6, 2), cex.axis = cex.axis)
abline(h = 0)

plot(X, Yl,
     type = 'l',
     xlab = '',
     ylab = '',
     xlim = c(-2, 6),
     ylim = c(0, 83 / 60),
     axes = FALSE,
     col = COL[1],
     lwd = 2)
text(1, 86 / 60, 'log-normal', pos = 1, cex = 1.7)
axis(1, at = seq(-2, 6, 2), cex.axis = cex.axis)
abline(h = 0)

# _____ Create Loop For Plots _____ #
par(mar = c(3, 1, 0.2, 1))
set.seed(50)

at <- list()
at[[1]] <- seq(-2,4,2)
at[[2]] <- -1:3
at[[3]] <- 0:2
at[[4]] <- seq(0.5, 1.5, 0.5)
for (i in 1:length(n)) {
  plot(0:1, 0:1, axes = FALSE, type = 'n')
  text(0.5, 0.3, paste('n =', n[i]), cex = 1.9)
  xlim <- 1 + 3.8 * c(-1, 1) / sqrt(n[i])
  if (n[i] != 2) {
    x <- rep(NA, ss)
    for (j in 1:ss) {
      x[j] <- mean(runif(n[i], 1 - sqrt(3), 1 + sqrt(3)))
    }
    d <- density(x, adjust = bw)
    R <- range(c(0, d$y)) * 1.1
    plot(d,
         main = '',
         xlab = '',
         ylab = '',
         axes = FALSE,
         xlim = xlim,
         ylim = R,
         col = COL[1],
         lwd = 1.5)
    abline(h = 0)
    axis(1, at = at[[i]], cex.axis = cex.axis)
  } else {
    X <- c(-3, 1 - sqrt(3), 1, 1 + sqrt(3), 5)
    Y <- c(0, 0, 1 / sqrt(3), 0, 0)
    plot(X, Y,
         axes = FALSE,
         type = 'l',
         xlab = '',
         ylab = '',
         col = COL[1],
         lwd = 1.5)
    axis(1, at = at[[i]], cex.axis = cex.axis)
  }
  addNormal(1, 1 / sqrt(n[i]), lwd = 2)

  x <- rep(NA, ss)
  for (j in 1:ss) {
    x[j] <- mean(rexp(n[i]))
  }
  d <- density(x, adjust = bw)
  R <- range(c(0, d$y)) * roof
  plot(d$x, d$y,
       type = 'l',
       main = '',
       xlab = '',
       ylab = '',
       axes = FALSE,
       xlim = xlim,
       ylim = R,
       col = COL[1],
       lwd = 1.5)
  abline(h = 0)
  axis(1, at = at[[i]], cex.axis = cex.axis)
  addNormal(1, 1 / sqrt(n[i]), lwd = 2)

  x <- rep(NA, ss)
  for (j in 1:ss) {
    x[j] <- mean(rlnorm(n[i], log(1 / sqrt(2)),
                 sqrt(log(2))) + 0.15 / i^3)
  }
  d <- density(x, adjust = bw)
  R <- range(c(0, d$y)) * roof
  plot(d$x, d$y,
       type = 'l',
       main = '',
       xlab = '',
       ylab = '',
       axes = FALSE,
       xlim = xlim,
       ylim = R,
       col = COL[1],
       lwd = 1.5)
  abline(h = 0)
  axis(1, at = at[[i]], cex.axis = cex.axis)
  addNormal(1, 1 / sqrt(n[i]), lwd = 2)

  cat(1 / sqrt(n[i]), sd(x), n[i], '\n')
}
dev.off()
