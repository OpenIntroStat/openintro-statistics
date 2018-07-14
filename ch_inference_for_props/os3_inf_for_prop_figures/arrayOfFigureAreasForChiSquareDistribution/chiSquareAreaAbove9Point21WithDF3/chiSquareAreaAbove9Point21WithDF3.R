library(openintro)
data(COL)

myPDF('chiSquareAreaAbove9Point21WithDF3.pdf', 5, 3,
      mar = c(2, 1, 1, 1),
      mgp = c(2.1, 0.6, 0))
ChiSquareTail(9.21,
              3,
              c(0, 15),
              col = COL[1])
dev.off()
