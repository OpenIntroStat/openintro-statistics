library(openintro)
data(COL)

myPDF('bladesTwoSampleHTPValueQC.pdf', 3.04, 1.56,
      mar = c(2.4, 0, 0.5, 0),
      mgp = c(3, 0.45, 0))
normTail(U = 2.3, col = COL[1], axes = FALSE)
at <- c(-5, 0, 2.3, 5)
labels <- c(0, 0.03, 0.059, 0)
axis(1, at, labels, cex.axis = 0.9)
par(mgp = c(5, 1.3, 0))
axis(1, at = 0, '(null value)', cex.axis = 0.7)
arrows(2.5, 0.19,
       2.5, 0.05,
       length = 0.1,
       col = COL[1])
text(2.5, 0.18, "0.006",
     pos = 3,
     cex = 0.8,
     col = COL[1])
dev.off()
