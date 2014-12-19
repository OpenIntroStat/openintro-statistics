library(openintro)
data(COL)

myPDF('chiSquareAreaAbove5Point1WithDF5.pdf', 5, 3,
      mar = c(2, 1, 1, 1),
      mgp = c(2.1, 0.6, 0))
ChiSquareTail(5.1,
              5,
              c(0, 25),
              col = COL[1])
dev.off()
