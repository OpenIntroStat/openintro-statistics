library(openintro)
data(COL)

k  <- -50:500
p  <- 0.1
n  <- c(10, 30, 100, 300)
xl <- c(0, 0, 0, 10)-1
xu <- c(7, 11, 24, 50)-1
axis1 <- list()
axis1[[1]] <- seq(0,6,2)
axis1[[2]] <- seq(0,10, 2)
axis1[[3]] <- seq(0, 20, 5)
axis1[[4]] <- seq(10, 50, 10)

myPDF('fourBinomialModelsShowingApproxToNormal.pdf', 5.5, 4.1, mfrow=c(2,2), mar=c(3.9, 1, 0.5, 1), mgp=c(2.2, 0.6, 0))

for(i in 1:4){
  pk   <- dbinom(k, n[i], p)
  xlab <- paste("n =", n[i])
  plot(k-0.05,pk,type='s',xlim=c(xl[i], xu[i]), axes=FALSE, xlab=xlab, ylab="", col=COL[5], lwd=1.5)
  axis(1, axis1[[i]])
  abline(h=0)
  if(i == 2){
  	par(mar=c(3.25, 1, 0.9, 1))
  }
}

dev.off()
