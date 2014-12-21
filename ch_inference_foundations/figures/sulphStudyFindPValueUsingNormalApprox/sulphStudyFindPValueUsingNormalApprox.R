library(openintro)
data(COL)

myPDF('sulphStudyFindPValueUsingNormalApprox.pdf', 6, 2.2,
      mar = c(2, 0, 0.5, 0),
      mgp = c(3, 0.65, 0))
normTail(U = 1.9,
         df = 20,
         col = COL[1],
         axes = FALSE,
         xlim = c(-3.5, 3.5))
at <- c(-5, 0, 1.9, 5)
labels <- expression(0, 'null diff. = 0   ',
                     '   obs. diff. = 0.025', 0)
axis(1, at, labels, cex.axis = 0.8)
yMax <- 0.4

text(0, yMax * 0.4, '0.973', cex = 1.2)

arrows(2.3, yMax / 2,
       2.3, yMax / 9,
       length = 0.1,
       col = COL[1],
       lwd = 1.5)
text(2.3, yMax / 2, 'p-value\n 0.027',
     pos = 3,
     cex = 1.2,
     col = COL[1])
dev.off()
