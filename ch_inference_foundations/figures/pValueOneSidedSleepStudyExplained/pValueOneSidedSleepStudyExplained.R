library(openintro)
data(COL)

myPDF('pValueOneSidedSleepStudyExplained.pdf', 6.875, 2.75,
      mar=c(2, 0, 0.5, 0),
      mgp=c(3, 0.65, 0))
normTail(U = 2.18,
         col = COL[1],
         df = 15,
         axes = FALSE,
         xlim=c(-3.8, 5.5),
         lwd = 2)
at <- c(-5, 0, 0.37 / 0.17, 15)
labels <- expression(0, 'null value', 'observed '*bar(x), 0)
axis(1, at, labels, cex.axis=1.05)
yMax <- 0.4

arrows(-1.67, yMax * 0.6,
       -1.40, yMax * 0.48,
       length=0.1,
       lwd=1.5)
text(-1.5, yMax * 0.8,
     expression('Distribution of '*bar(x)),
     cex=1,
     pos=2)
text(-1.5, yMax * 0.7,
     expression('if '*H[0]*' is true'),
     cex=1,
     pos=2)

xLoc <- 1.9
arrows(2.56, yMax / 2.3,
       2.562, yMax / 10,
       length=0.1,
       col=COL[1],
       lwd=1.5)
text(xLoc, 0.83 * yMax,
     expression('Chance of observed '*bar(x)),
     pos=4,
     cex=1,
     col=COL[1])
text(xLoc, 0.73 * yMax,
     expression('or another '*bar(x)*' that is even'),
     pos=4,
     cex=1,
     col=COL[1])
text(xLoc, 0.63 * yMax,
     expression('more favorable towards '*H[A]*","),
     pos=4,
     cex=1,
     col=COL[1])
text(xLoc, 0.53 * yMax,
     expression('if '*H[0]*' is true'),
     pos=4,
     cex=1,
     col=COL[1])
abline(h=0)
dev.off()
