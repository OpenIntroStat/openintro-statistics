library(openintro)
data(COL)

set.seed(1)
r <- 200/10^6
N <- 8*10^6
n <- 365
x <- rpois(n, r*N/365)

myPDF("amiIncidencesOver100Days.pdf", 5, 2.4, mar=c(1.6,2.5,0.5,1))
histPlot(x, breaks=(0:max(2*x+1))/2-0.25, axes=FALSE, col=COL[1])
at     <- 0:1000
labels <- rep("", length(at))
axis(1, at=at, labels=labels, tcl=-0.18)
axis(1, at=seq(0,1000,5), tcl=-0.35)
axis(2, at=seq(0,1000,20))
dev.off()
