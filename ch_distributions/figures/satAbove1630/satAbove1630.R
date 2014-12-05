library(openintro)
data(COL)

myPDF("satAbove1630.pdf", 2.5, 1.3,
      mar = c(1.2, 0, 0.5, 0),
      mgp = c(3, 0.17, 0))
normTail(1500, 300,
         U = 1630,
         axes = FALSE,
         col = COL[1])
axis(1, at = c(900, 1500, 2100),
     cex.axis = 0.8)
dev.off()
