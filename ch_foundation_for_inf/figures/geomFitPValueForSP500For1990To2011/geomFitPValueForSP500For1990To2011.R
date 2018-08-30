library(openintro)
data(COL)

myPDF('geomFitPValueForSP500For1990To2011.pdf', 6.6, 2.387,
      mar = c(2, 1, 1, 1),
      mgp = c(2.1, 0.5, 0))
ChiSquareTail(15.08,
              6,
              c(0, 30),
              col = COL[1])
arrows(15.1, max(y) / 3,
       15.5, max(y) / 10,
       length = 0.1,
       col = COL[1])
text(15.1, max(y)/3, 'Area representing\nthe p-value',
     pos = 3,
     col = COL[1])
dev.off()
