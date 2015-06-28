library(openintro)
data(COL)

BuildNull <- function(xlim = c(-10, 10)) {
  normTail(0, 1.70, L = -1000, U = 1000,
           df = 50, lwd = 2.5, axes = FALSE,
           curveColor = COL[1],
           xlim = xlim)
  axis(1, at = seq(-15, 15, 3))
  mtext(expression(bar(x)[trmt] - bar(x)[ctrl]),
        side = 1, line = 1.8)
  text(1.2, 0.2, "Null distribution", col = COL[1], pos = 4)
  lines(rep(0, 2), c(0, dnorm(0, 0, 1.70)),
        col = COL[1,4], lwd = 0.5)
}

# _____ Null Distribution Only _____ #
myPDF('power_null_A_0_1-7.pdf',
      7, 1.9,
      mar = c(2.8, 0, 0, 0),
      mgp = c(0, 0.45, 0))
BuildNull()
dev.off()



# _____ Null Distribution + Rejection Regions _____ #
myPDF('power_null_B_0_1-7_with_rejection_region.pdf',
      7, 1.9,
      mar = c(2.8, 0, 0, 0),
      mgp = c(0, 0.45, 0))
BuildNull()
segments(3.3 * c(-1, 1), rep(0, 2), y1 = rep(0.15, 2),
         col = COL[4], lty = 3, lwd = 3)
segments(3.3 * c(-1, 1), rep(0, 2), y1 = rep(0.15, 2),
         col = COL[4], lty = 3, lwd = 1.5)
text(c(-6, 0, 0, 6), c(0.07, 0.09, 0.05, 0.07),
     c(expression("Reject " * H[0]),
       "Do not",
       expression("reject " * H[0]),
       expression("Reject " * H[0])),
     col = COL[4])
dev.off()



# _____ Null Distribution + Alternative At -3 _____ #
myPDF('power_null_C_0_1-7_with_alt_at_3.pdf',
      7, 1.9,
      mar = c(2.8, 0, 0, 0),
      mgp = c(0, 0.45, 0))
BuildNull(xlim = c(-8.8, 10))
normTail(-3, 1.70, L = -1000, U = 1000,
         df = 50, lwd = 2.5, add = TRUE,
         curveColor = COL[2])
lines(rep(-3, 2), c(0, dnorm(0, 0, 1.70)),
      col = COL[2,4], lwd = 0.5)
segments(3.3 * c(-1, 1), rep(0, 2), y1 = rep(0.15, 2),
         col = COL[4], lty = 3, lwd = 3)
segments(3.3 * c(-1, 1), rep(0, 2), y1 = rep(0.15, 2),
         col = COL[4], lty = 3, lwd = 1.5)
text(rep(-6.5, 2), c(0.21, 0.175),
     c("Distribution with",
       expression(mu[trmt] - mu[ctrl]*" = -3")),
     col = COL[2])
dev.off()



# _____ Null Distribution + Alternative At -3 + Shaded _____ #
myPDF('power_null_D_0_1-7_with_alt_at_3_and_shaded.pdf',
      7, 1.9,
      mar = c(2.8, 0, 0, 0),
      mgp = c(0, 0.45, 0))
BuildNull()
normTail(-3, 1.70, L = -3.332, U = 1000,
         df = 50, lwd = 2.5, add = TRUE,
         curveColor = COL[2],
         border = COL[2],
         col = COL[2,3])
lines(rep(-3, 2), c(0, dnorm(0, 0, 1.70)),
      col = COL[2,4], lwd = 0.5)
segments(3.3 * c(-1, 1), rep(0, 2), y1 = rep(0.15, 2),
         col = COL[4], lty = 3, lwd = 3)
segments(3.3 * c(-1, 1), rep(0, 2), y1 = rep(0.15, 2),
         col = COL[4], lty = 3, lwd = 1.5)
text(rep(-6.5, 2), c(0.21, 0.175),
     c("Distribution with",
       expression(mu[trmt] - mu[ctrl]*" = -3")),
     col = COL[2])
dev.off()

