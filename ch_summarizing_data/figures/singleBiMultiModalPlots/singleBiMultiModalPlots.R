library(openintro)
data(COL)

myPDF("singleBiMultiModalPlots.pdf", 6.5, 2)

set.seed(51)
x1 <- rchisq(65, 6)
x2 <- c(rchisq(22, 5.8),
        rnorm(40, 16.5, 2))
x3 <- c(rchisq(25, 3),
        rnorm(35, 11.7),
        rnorm(42, 18, 1.5))

par(mfrow=c(1, 3),
    mar=c(1.9, 2, 1, 2),
    mgp=c(2.4, 0.7, 0))

HistPlot1 <- function(x, COL = COL) {
  histPlot(x, axes=FALSE, xlab='', ylab='', col=COL[1],
      ylim = c(0, 20))
  abline(h = 0)
  axis(1, at = seq(-20, 50, 5))
}

HistPlot1(x1, COL)
axis(2)

HistPlot1(x2, COL)
axis(2)

HistPlot1(x3, COL)
axis(2)

dev.off()
