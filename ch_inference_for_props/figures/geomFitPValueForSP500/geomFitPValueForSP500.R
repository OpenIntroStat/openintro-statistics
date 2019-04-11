library(openintro)
data(COL)

myPDF('geomFitPValueForSP500.pdf', 6.6, 2.387,
      mar = c(2, 1, 1, 1),
      mgp = c(2.1, 0.5, 0))
ChiSquareTail(4.61,
              6,
              c(0, 25),
              col = COL[1])
arrows(15.1, 0.07,
       10.5, 0.05,
       length = 0.1,
       col = COL[1])
text(15.1, 0.07, 'Area representing\nthe p-value',
     pos = 4,
     col = COL[1])
dev.off()
