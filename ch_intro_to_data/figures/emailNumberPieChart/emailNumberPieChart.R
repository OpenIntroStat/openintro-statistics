library(openintro)
data(email)
data(COL)

myPDF("emailNumberPieChart.pdf",
      7.5,
      4,
      mar = c(0, 2, 0, 0.5),
      mgp = c(2.4, 0.5, 0))
layout(matrix(1:2, 1), c(1, 1.1))
tab <- table(email$number)
pie(tab, col = COL[c(3, 1, 2)], radius = 0.75)

par(mar = c(3.6, 5.2, 1, 1))
barplot(tab,
        axes = FALSE,
        xlab = 'number',
        ylab = '',
        main = '',
        col = COL[c(3, 1, 2)])
axis(2)
abline(h = 0)
dev.off()
