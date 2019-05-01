library(openintro)
data(textbooks)
data(COL)

d <- as.numeric(na.omit(ucla_textbooks_f18$bookstore_new -
    ucla_textbooks_f18$amazon_new))

myPDF('diffInTextbookPricesF18.pdf', 5, 2.5,
      mar = c(3, 3.5, 0.5, 0.5),
      mgp = c(1.8, 0.5, 0))
histPlot(d, axes = FALSE, # breaks = 20,
         xlab = "UCLA Bookstore Price - Amazon Price (USD)",
         ylab = "",
         col = COL[1])
AxisInDollars(1, at = pretty(d), tck = -0.03)
axis(2, at = seq(0, 30, 10), tck = -0.02)
# axis(2, at = seq(0, 15, 5), tck = -0.02)
par(las = 0)
mtext("Frequency", 2, 2.4)
dev.off()
