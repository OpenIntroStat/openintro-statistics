library(openintro)
data(COL)

myPDF("satAbove1190.pdf", 3, 1.4,
      mar = c(1.2, 0, 0, 0),
      mgp = c(3, 0.17, 0))
normTail(1100, 200,
         U = 1190,
         axes = FALSE,
         col = COL[1])
axis(1, at = c(700, 1100, 1500),
     cex.axis = 0.8)
dev.off()
