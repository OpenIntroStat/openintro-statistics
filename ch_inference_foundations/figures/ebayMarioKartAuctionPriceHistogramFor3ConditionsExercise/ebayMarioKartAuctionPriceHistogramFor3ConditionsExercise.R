library(openintro)
data(COL)
data(marioKart)
d <- marioKart[marioKart$totalPr < 100,]
d <- d$totalPr[d$wheels == 1]

fn <- paste0("ebayMarioKartAuctionPriceHistogram",
             "For3ConditionsExercise.pdf")
myPDF(fn, 5.28, 2.97,
      mar = c(3.05, 3.2, 0.5, 0.5),
      mgp = c(1.9, 0.55, 0))
histPlot(d,
         xlab = "Total price of auction (US$)",
         ylab = "Frequency",
         breaks = 10,
         axes = FALSE,
         col = COL[1])
axis(1)
axis(2, seq(0, 10, 5))
dev.off()
