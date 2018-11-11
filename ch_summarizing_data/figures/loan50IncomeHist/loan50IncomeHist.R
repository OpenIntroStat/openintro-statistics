library(openintro)
data(email50)
data(COL)

x <- loan50$total_income
H <- hist(x,
          breaks = 12,
          plot = FALSE)
counts <- rbind(H$counts)
from   <- head(H$breaks, -1)
to     <- tail(H$breaks, -1)
colnames(counts) <- paste(from, 'to', to)
require(xtable)
xtable(counts)

myPDF("loan50IncomeHist.pdf",
      6.05, 3.1,
      mar = c(3.5, 3.5, 0.5, 1),
      mgp = c(2.4, 0.7, 0))
histPlot(x,
         breaks = seq(0, 350e3, 25e3),
         # breaks = seq(0, 40000, 5000),
         xlab = 'Total Income',
         ylab = "Frequency",
         # ylim = c(0, 20),
         col = COL[1],
         border = COL[5],
         axes = FALSE)
bin <- table(round(x / 2000) * 2000)
for (i in 1:length(bin)) {
  # points(rep(as.numeric(names(bin)[i]), bin[i]), 1:(bin[i]), cex = 2)
}
axis(2)
AxisInDollars(1, pretty(x))
dev.off()
