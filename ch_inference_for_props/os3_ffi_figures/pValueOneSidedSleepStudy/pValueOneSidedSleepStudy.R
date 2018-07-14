library(openintro)
data(COL)

myPDF('pValueOneSidedSleepStudy.pdf', 6.75, 2.64,
      mar = c(2, 0, 0.5, 0),
      mgp = c(3, 0.65, 0))
normTail(U = 2.18,
         col = COL[1],
         xlim = c(-3, 4),
         axes  =  FALSE,
         lwd  =  2)
at <- c(-5, 0, 0.37 / 0.17, 5)
labels <- expression(0, H[0]*': '*mu*' = 7  ',
                     bar(x)*' = 7.42', 0)
axis(1, at, labels, cex.axis = 1)
yMax <- 0.4

text(0, yMax * 0.4, '0.993', cex = 1.2)
arrows(2.5, yMax / 2,
       2.5, yMax / 10,
       length = 0.1,
       col = COL[1],
       lwd = 1.5)
text(2.5, yMax / 2, 'p-value\n 0.007',
     pos = 3,
     cex = 1.2,
     col = COL[1])
dev.off()
