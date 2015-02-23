library(openintro)
data(COL)

myPDF('cardsDiamondFaceVenn.pdf', 1.2 * 4.2, 1.2 * 1.7,
      mar = c(0.2, 0.2, 0.2, 0.2))
plot(c(0.2, 2.5),
     c(-0.13, 1.15),
     type = 'n',
     axes = FALSE)

z <- seq(0,2 * pi, len = 99)
x2 <- cos(z) / 2 + 1.3
y2 <- sin(z) / 3 + 0.5
polygon(c(x2, x2[1]), c(y2, y2[1]), col = COL[3,3])

x1 <- cos(z) / 2 + 0.7
y1 <- sin(z) / 3 + 0.5
polygon(c(x1, x1[1]),c(y1, y1[1]), col = COL[1,3])

text(c(0.55, 1, 1.45),
     rep(0.57, 3),
     c(10, 3, 9),
     cex = c(1.3, 1.2, 1.3))
text(c(0.55, 1, 1.45),
     c(0.41, 0.43, 0.41),
     c('0.1923', '0.0577', '0.1731'),
	 cex = c(1, 0.9, 1))
# text(0.5, -0.25, 'Other cards: 30', cex = 0.8)
# text(0.98, -0.26, '(0.5769)', cex = 0.8)
text(2.25, 0.55, cex = 0.8,
     paste("There are also", "30 cards that are",
           "neither diamonds", "nor face cards", sep = "\n"))
# text(2.25, 0.28, '(0.5769)', cex = 0.8)
Braces(0.7, 0.92, 3 * pi / 2, 0.98, 0.12)
text(0.7, 1.09, 'Diamonds, 0.2500')
Braces(1.3, 0.08, pi / 2, 0.98, 0.12)
text(1.3, -0.08, 'Face cards, 0.2308')
dev.off()
