library(openintro)
data(COL)

myPDF('jurorHTPValueShown.pdf', 4.4, 1.87,
      mar = c(1.5, 1, 0.2, 1),
      mgp = c(2.1, 0.45, 0))
ChiSquareTail(5.89,
              3,
              c(0, 16),
              col = COL[1])
dev.off()
