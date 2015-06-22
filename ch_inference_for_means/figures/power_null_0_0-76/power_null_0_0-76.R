library(openintro)
data(COL)

BuildNull <- function() {
  normTail(0, 0.8, L = -1000, U = 1000,
           df = 50, lwd = 2.5, axes = FALSE,
           curveColor = COL[1],
           xlim = c(-10, 10))
  axis(1, at = seq(-15, 15, 3))
  mtext(expression(bar(x)[trmt] - bar(x)[ctrl]),
        side = 1, line = 1.5)
  text(0.6, 0.4, "Null distribution", col = COL[1], pos = 4)
  lines(rep(0, 2), c(0, dnorm(0, 0, 0.8)),
        col = COL[1,4], lwd = 0.5)
}

# _____ Null Distribution + Alternative At -3 _____ #
myPDF('power_null_0_0-76_with_alt_at_3_and_shaded.pdf',
      7, 1.4,
      mar = c(2.5, 0, 0, 0),
      mgp = c(0, 0.45, 0))
BuildNull()
normTail(-3, 0.8, L = -1.49, U = 1000,
         df = 50, lwd = 2.5, add = TRUE,
         curveColor = COL[2],
         col = COL[2, 3], border = COL[2])
lines(rep(-3, 2), c(0, dnorm(0, 0, 0.8)),
      col = COL[2,4], lwd = 0.5)
segments(1.5 * c(-1, 1), rep(0, 2), y1 = rep(0.3, 2),
         col = COL[4], lty = 3, lwd = 3)
segments(1.5 * c(-1, 1), rep(0, 2), y1 = rep(0.3, 2),
         col = COL[4], lty = 3, lwd = 1.5)
text(rep(-5.8, 2), 2 * c(0.21, 0.15),
     c("Distribution with",
       expression(mu[trmt] - mu[ctrl]*" = -3")),
     col = COL[2])
dev.off()


