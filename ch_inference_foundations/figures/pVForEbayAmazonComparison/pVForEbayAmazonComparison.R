library(openintro)
data(COL)
colCurve <- '#00000088'

myPDF('pVForEbayAmazonComparison.pdf', 7, 2.2)

#===> plot <===#
par(las=1, mar=c(2,0,0.5,0), mgp=c(3,0.75,0))
X <- seq(-7,5,0.01)
Y <- dt(X, 30)
plot(X, Y, type='l', axes=FALSE, xlim=c(-6.5,3.3), lwd=1.5)
axis(1, at=c(-4.9), label=expression(bar(x)*' = 44.17'), cex.axis=1.15)
par(mgp=c(3, 0.9, 0))
axis(1, at=c(-15, 0, 5), label=expression(0, mu[0]*' = 46.99', 0), cex.axis=1.15)
lines(c(-15, -4.9), c(0,0), lwd=4, col=COL[4])
#these <- which(X <= -4.75)
#polygon(c(X[these[1]], X[these],X[rev(these)[1]]), c(0,Y[these],0), col='#000000', border='#000000')
yMax <- max(Y)

#text(0, yMax*.4, '0.993', cex=1.2)

arrows(-5.3, yMax/2, -5.3, yMax/10, length=0.1, col=COL[4], lwd=1.5)
text(-4.5, yMax/2, 'The p-value is represented\nby area to the left. The area is\nso slim we cannot see it.', pos=3, cex=1.2, col=COL[4])

#arrows(1.3,0.28, 0.43, 0.28, length=0.07)
#text(-.88, 0.13, '  40%\n(0.40)', cex=0.8)

lines(X, Y, col=colCurve)
abline(h=0, col=colCurve)


dev.off()
