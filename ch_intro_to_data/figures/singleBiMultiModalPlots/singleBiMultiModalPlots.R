library(openintro)
data(COL)

myPDF("singleBiMultiModalPlots.pdf", 5.8, 2)

set.seed(51)
x1 <- rchisq(65, 6)
x2 <- c(rchisq(22, 5.8),
        rnorm(40, 16.5, 2))
x3 <- c(rchisq(20, 3),
        rnorm(35, 12),
        rnorm(42, 18, 1.5))

par(mfrow=c(1, 3),
    mar=c(1.9, 2, 1, 2),
    mgp=c(2.4, 0.7, 0))

HistPlot1 <- function(x, COL = COL) {
  histPlot(x, axes=FALSE, xlab='', ylab='', col=COL[1])
}

HistPlot1(x1, COL)
axis(1)
axis(2)

HistPlot1(x2, COL)
axis(1)
axis(2)

HistPlot1(x3, COL)
axis(1)
axis(2)

dev.off()
