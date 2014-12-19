library(openintro)
data(COL)

myPDF('chiSquareAreaAbove10WithDF4.pdf', 5, 3,
      mar = c(2, 1, 1, 1),
      mgp = c(2.1, 0.6, 0))
ChiSquareTail(10,
              4,
              c(0, 18),
              col = COL[1])
dev.off()
