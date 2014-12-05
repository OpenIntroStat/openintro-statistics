library(openintro)
data(COL)

#===> plot <===#
myPDF("satBelow1800.pdf", 2.5, 1.3,
      mar = c(1.2, 0, 0.5, 0),
      mgp = c(3, 0.17, 0))
normTail(1500, 300,
         L = 1800,
         col = COL[1],
         cex.axis = 0.6)
dev.off()
