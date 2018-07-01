library(openintro)
data(email50)
data(COL)

H <- hist(email50$num_char,
          breaks = 12,
          plot = FALSE)
counts <- rbind(H$counts)
from   <- head(H$breaks, -1)
to     <- tail(H$breaks, -1)
colnames(counts) <- paste(from, 'to', to)
require(xtable)
xtable(counts)

myPDF("email50NumCharHist.pdf",
      6.05, 3.1,
      mar = c(3.5, 3.5, 0.5, 1),
      mgp = c(2.4, 0.7, 0))
histPlot(email50$num_char,
         breaks = 12,
         xlab = 'Number of Characters (in thousands)',
         ylab = "Frequency",
         ylim = c(0, 20),
         col = COL[1],
         border = COL[5])
dev.off()
