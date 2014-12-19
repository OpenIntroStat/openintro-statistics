library(openintro)
data(COL)

myPDF('stemCellTherapyForHeartsPValue.pdf', 3.9, 2.3,
      mar = c(1.75, 1, 1, 1),
      mgp = c(2, 0.6, 0))

normTail(U = 4.03,
         xlim = c(-3, 5.2),
         df = 3,
         lwd = 1.5,
         border = COL[4],
         col = COL[4],
         axes = FALSE)
text(7.5 - 4, 0.23, "Area representing\np-value", col = COL[4])
arrows(7.5 - 4, 0.17, 4.3, 0.02, length = 0.1, col = COL[4])
axis(1, at = seq(-8,12,2)) #, rep("", 11), tcl = -0.2)
dev.off()
