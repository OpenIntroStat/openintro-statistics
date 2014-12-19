library(openintro)
data(textbooks)
data(COL)

d <- textbooks

myPDF('diffInTextbookPricesS10.pdf', 5.4, 3.2,
      mar = c(3, 3.2, 0.5, 0.5),
      mgp = c(1.8, 0.5, 0))
histPlot(d$diff, axes = FALSE,
         xlim = c(-20, 80),
         xlab = "UCLA price - Amazon price (USD)",
         ylab = "",
         col = COL[1])
mtext("Frequency", 2, 2.1, las = 0)
axis(1, cex.axis = 0.87, tck = -0.03)
axis(2, at = seq(0, 30, 10), cex.axis = 0.87, tck = -0.02)
dev.off()
