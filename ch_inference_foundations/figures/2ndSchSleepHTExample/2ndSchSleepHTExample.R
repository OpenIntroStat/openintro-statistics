library(openintro)
data(COL)

pdf('2ndSchSleepHTExample.pdf', 6, 2.4)

#===> plot <===#
par(las=1, mar=c(2,0,0.5,0), mgp=c(3,0.65,0))
X <- seq(-7,5,0.01)
Y <- dnorm(X)
plot(X, Y, type='n', axes=FALSE, xlim=c(-3.35,3.5), lwd=1.5)

axis(1, at=c(-.81), label=expression(bar(x)*' = 6.83'), cex.axis=0.87)
par(mgp=c(3, 0.77, 0))
axis(1, at=c(-15, 0, 5), label=expression(0, H[0]*': '*mu*' = 7', 0), cex.axis=0.87)
these <- which(X <= -0.81)
polygon(c(X[these[1]], X[these],X[rev(these)[1]]), c(0,Y[these],0), col=COL[1])
these <- which(X >= 0.81)
polygon(c(X[these[1]], X[these],X[rev(these)[1]]), c(0,Y[these],0), col=COL[1])
yMax <- max(Y)

#text(0, yMax*.4, '0.993', cex=1.2)

arrows(-2, yMax/2, -1.6, yMax/3, length=0.1, col=COL[1], lwd=1.5)
text(-1.75, yMax*.6, 'left tail', pos=2, cex=1, col=COL[1])

arrows(1.7, yMax/2, 1.6, yMax/3, length=0.1, col=COL[1], lwd=1.5)
text(1.35, yMax*.75, expression('observations just as'), pos=4, cex=1, col=COL[1])
text(1.35, yMax*.6, expression('unusual as '*bar(x)*' under '*H[0]), pos=4, cex=1, col=COL[1])

#arrows(1.3,0.28, 0.43, 0.28, length=0.07)
#text(-.88, 0.13, '  40%\n(0.40)', cex=0.8)

lines(X, Y, lwd=1.5)
abline(h=0)


dev.off()
