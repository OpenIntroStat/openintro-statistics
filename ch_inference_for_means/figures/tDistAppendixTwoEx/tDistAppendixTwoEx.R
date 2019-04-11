library(openintro)
data(COL)

myPDF('tDistAppendixTwoEx.pdf', 6.8, 1.9,
      mar = c(1.6, 1, 0.05, 1),
      mgp = c(5, 0.45, 0),
      mfrow = c(1, 2))
normTail(U = 1.65,
         df = 12,
         xlim = c(-4, 4),
         col = COL[1],
         axes = FALSE)
axis(1)
normTail(L = -2,
         U = 2,
         df = 475,
         xlim = c(-4.5, 4.5),
         col = COL[1],
         axes = FALSE)
axis(1)
dev.off()
