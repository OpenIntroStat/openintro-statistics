library(openintro)
data(COL)

myPDF("mikeAndJosePercentiles.pdf", 7, 1.3,
      mar = c(2, 0.2, 0.2, 0.2),
      mgp = c(3, 0.8, 0),
      tcl = -0.4)
layout(matrix(0:2, 1), c(0.5, 2, 2), 1)

normTail(70, 3.3,
         L = 67,
         axes = FALSE,
         col = COL[1])
axis(1,
     at = c(-100, 67, 70, 1000),
     cex.axis = 1.7)
text(62, 0.07, "Mike", cex = 2)

normTail(70, 3.3,
         L = 76,
         axes = FALSE,
         col = COL[1])
axis(1,
     at = c(-100, 70, 76, 1000),
     cex.axis = 1.7)
text(62, 0.07, "Jose", cex = 2)

dev.off()