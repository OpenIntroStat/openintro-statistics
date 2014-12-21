library(openintro)
data(COL)

myPDF('2ndSchSleepHTExample.pdf', 6, 2.4,
      mar = c(2, 0, 0.5, 0),
      mgp = c(3, 0.65, 0))
normTail(L = -0.81,
         U = 0.81,
         col = COL[1],
         axes = FALSE)
labels <- expression(bar(x)*'  =  6.83')
axis(1, at = -0.81, labels = labels, cex.axis = 0.87)

par(mgp = c(3, 0.77, 0))
at <- c(-15, 0, 5)
labels <- expression(0, H[0]*': '*mu*'  =  7', 0)
axis(1, at, labels, cex.axis = 0.87)

yMax <- max(Y)
arrows(-2, yMax / 2,
       -1.6, yMax / 3,
       length = 0.1,
       col = COL[1],
       lwd = 1.5)
text(-1.75, yMax * 0.6, 'left tail',
     pos = 2,
     cex = 1,
     col = COL[1])

arrows(1.7, yMax / 2,
       1.6, yMax / 3,
       length = 0.1,
       col = COL[1],
       lwd = 1.5)
text(1.35, yMax * 0.75, expression('observations just as'),
     pos = 4,
     cex = 1,
     col = COL[1])
text(1.35, yMax * 0.62,
     expression('unusual as '*bar(x)*' under '*H[0]),
     pos = 4,
     cex = 1,
     col = COL[1])
dev.off()
