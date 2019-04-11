library(openintro)
data(COL)


myPDF('satBelow1030.pdf', 2.875, 1,
      mar = c(1.5, 0, 0, 0),
      mgp = c(3, 0.45, 0))
normTail(1100, 200, 1030,
         axes = FALSE,
         col = COL[1])
axis(1, at = c(700, 1100, 1500))
dev.off()


myPDF('satAbove1030.pdf', 3, 1,
      mar = c(1.5, 4, 0, 0),
      mgp = c(3, 0.45, 0))
normTail(1100, 200,
         U = 1030,
         axes = FALSE,
         col = COL[1])
axis(1, at = c(700, 1100, 1500))
dev.off()
