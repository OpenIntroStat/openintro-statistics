library(openintro)
data(COL)

myPDF('pValueShownForSATHTOfOver100PtGain.pdf', 4, 2,
      mar = c(1.5, 1, 0.2, 1),
      mgp = c(0, 0.45, 0))
normTail(0, 1,
         U = 2.39,
         df = 20,
         col = COL[1])
lines(c(2.4, 2.4),
      c(dt(2.4, 20), 0.1),
      lty = 3,
      lwd = 2)
text(2.73, 0.088, "T = 2.39",
     pos = 3,
     cex = 0.8)
dev.off()
