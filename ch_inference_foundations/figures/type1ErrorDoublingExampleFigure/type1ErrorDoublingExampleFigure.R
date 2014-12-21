library(openintro)
data(COL)

myPDF('type1ErrorDoublingExampleFigure.pdf', 5.5, 2,
      mar = c(2, 0, 0.5, 0),
      mgp = c(3, 0.9, 0))
normTail(L = -1.65,
         U = 1.65,
         col = COL[1],
         axes = FALSE,
         xlim = c(-3.4, 3.4))
at <- c(-5, 0, 5)
labels <- expression(0, mu*' = '*mu[0], 0)
axis(1, at, labels, cex.axis = 1.2)

arrows(-2, 0.17,
       -1.9, 0.08,
       length = 0.07,
       col = COL[1],
       lwd = 1.5)
text(-1.92, 0.21, '5%', cex = 1.2, col = COL[1])
arrows(2, 0.17,
       1.9, 0.08,
       length = 0.07,
       col = COL[1],
       lwd = 1.5)
text(2.08, 0.21, '5%', cex = 1.2, col = COL[1])
dev.off()
