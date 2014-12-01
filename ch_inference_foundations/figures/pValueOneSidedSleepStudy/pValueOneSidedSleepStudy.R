library(openintro)
data(COL)

pdf('pValueOneSidedSleepStudy.pdf', 1.5*4.5, 1.2*2.2)

#===> plot <===#
par(las=1, mar=c(2,0,0.5,0), mgp=c(3,0.65,0))
X <- seq(-5,5,0.01)
Y <- dt(X, 50)
plot(X, Y, type='l', axes=FALSE, xlim=c(-3,4), col=COL[5], lwd=2)
axis(1, at=c(-5, 0, .37/.17, 5), label=expression(0, H[0]*': '*mu*' = 7  ', bar(x)*' = 7.42', 0), cex.axis=1)
these <- which(X*0.17 + 7 >= 7.37)
polygon(c(X[these[1]], X[these],X[rev(these)[1]]), c(0,Y[these],0), col=COL[1])
yMax <- max(Y)

text(0, yMax*.4, '0.993', cex=1.2)

arrows(2.5, yMax/2, 2.5, yMax/10, length=0.1, col=COL[1], lwd=1.5)
text(2.5, yMax/2, 'p-value\n 0.007', pos=3, cex=1.2, col=COL[1])

#arrows(1.3,0.28, 0.43, 0.28, length=0.07)
#text(-.88, 0.13, '  40%\n(0.40)', cex=0.8)

#lines(X, Y)
abline(h=0)


dev.off()
