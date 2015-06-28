library(openintro)
data(COL)

myPDF('pValueOfTwoTailAreaOfExamVersionsWhereDFIs26.pdf',
      4.8, 1.7,
      mar = c(1.6, 1, 0, 1),
      mgp = c(0, 0.45, 0))
normTail(0, 1,
         L = -1.15,
         U = 1.15,
         df = 26,
         col = COL[1])
lines(c(1.16, 1.16),
      c(dt(1.16, 26), 0.25),
      lty = 3,
      cex = 2)
text(1.55, 0.24, "T = 1.15",
     pos = 3)
dev.off()
