library(openintro)
data(COL)

myPDF('googleHTForDiffAlgPerformancePValue.pdf', 5, 2.25,
    mar = c(2, 1, 1, 1), mgp = c(2.1, 0.7, 0))
ChiSquareTail(6.12,
              2,
              c(0, 16),
              col = COL[1])
dev.off()
