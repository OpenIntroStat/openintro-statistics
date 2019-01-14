library(openintro)
data(COL)

#===> plot <===#
myPDF("satBelow1300.pdf", 2.25, 1,
      mar = c(1.2, 0, 0, 0),
      mgp = c(3, 0.17, 0))
normTail(1100, 200,
         L = 1300,
         col = COL[1],
         cex.axis = 0.6)
dev.off()
