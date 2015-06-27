library(openintro)
data(COL)

myPDF('between59And62.pdf', 2.5, 0.9,
      mar = c(1.4, 0, 0, 0),
      mgp = c(3, 0.45, 0))
normTail(70, 3.3,
         M = c(69, 74),
         col = COL[1],
         axes = FALSE)
labels <- round(70 + 3.3 * c(-2, 0, 2), 2)
axis(1, labels, cex.axis = 0.8)
dev.off()
