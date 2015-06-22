library(openintro)
data(COL)

BuildNull <- function() {
  normTail(0, 1.07, L = -1000, U = 1000,
           df = 50, lwd = 2.5, axes = FALSE,
           curveColor = COL[1],
           xlim = c(-10, 10))
  axis(1, at = seq(-15, 15, 3))
  mtext(expression(bar(x)[trmt] - bar(x)[ctrl]),
        side = 1, line = 1.5)
  text(0.6, 0.3, "Null distribution", col = COL[1], pos = 4)
  lines(rep(0, 2), c(0, dnorm(0, 0, 1.07)),
        col = COL[1,4], lwd = 0.5)
}

# _____ Null Distribution + Alternative At -3 _____ #
myPDF('power_best_sample_size.pdf',
      7, 1.5,
      mar = c(2.5, 0, 0, 0),
      mgp = c(0, 0.45, 0))
BuildNull()
normTail(-3, 1.07, L = -2.10, U = 1000,
         df = 50, lwd = 2, add = TRUE,
         curveColor = COL[2, 2],
         col = COL[2, 2], border = COL[2])
lines(rep(-3, 2), c(0, dnorm(0, 0, 1.07)),
      col = COL[2,4], lwd = 0.5)
segments(2.1 * c(-1, 1), rep(0, 2), y1 = rep(0.2, 2),
         col = COL[4, 4], lty = 3, lwd = 3)
segments(2.1 * c(-1, 1), rep(0, 2), y1 = rep(0.2, 2),
         col = COL[4, 4], lty = 3, lwd = 1.5)
text(rep(-6, 2), 1.5 * c(0.21, 0.15),
     c("Distribution with",
       expression(mu[trmt] - mu[ctrl]*" = -3")),
     col = COL[2])
arrows(-3, 0.02, -2.15, 0.02,
       col = COL[3], lwd = 2,
       length = 0.05, code = 3)
text(-2.85, 0.01, "0.84 SE", pos = 3, col = COL[3], cex = 0.75)
rect(-1.5, 0.005, 0.5, 0.1, col = "#ffffffAA", border = "#00000000")
arrows(-2.05, 0.02, 0, 0.02,
       col = COL[4], lwd = 2,
       length = 0.05, code = 3)
text(-1, 0.007, "1.96 SE", pos = 3, col = COL[4], cex = 0.75)
dev.off()


