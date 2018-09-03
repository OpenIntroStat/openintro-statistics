require(openintro)
data(COL)

fn <- 'nuclearArmsReductionPValue.pdf'
myPDF(fn, 3.5, 1,
      mar = c(1.55, 0, 0.1, 0),
      mgp = c(3, 0.5, 0))
normTail(U = 3.75, col = COL[1], axes = FALSE,
         xlim = c(-6, 6))
at <- c(-10, 0, 3.75, 10)
labels <- expression(0, 0.50, 0.56, 0)
axis(1, at, labels, cex.axis = 0.9)
lines(c(3.75, 10), rep(0, 2), lwd = 5, col = COL[1])
lines(c(-3.75, -10), rep(0, 2), lwd = 5, col = COL[1])
arrows(4.3, 0.1, 4.5, 0.03,
       length = 0.1,
       lwd = 2,
       col = COL[1])
text(4.3, 0.1, "upper tail", pos = 3, col = COL[1], font = 2)
arrows(-4.3, 0.1, -4.5, 0.03,
       length = 0.1,
       lwd = 2,
       col = COL[1])
text(-4.3, 0.1, "lower tail", pos = 3, col = COL[1], font = 2)
dev.off()
