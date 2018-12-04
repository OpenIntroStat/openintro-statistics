library(openintro)
data(COL)

myPDF("pValueMidtermUnemp.pdf", 6.325, 2.7,
      mar = c(1.8, 0.5, 0.2, 0.5))
normTail(0, 0.8350,
         L = -0.8897,
         U = 0.8897,
         df = 27,
         col = COL[1])
dev.off()
