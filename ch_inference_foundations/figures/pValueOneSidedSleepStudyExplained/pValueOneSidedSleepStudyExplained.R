library(openintro)
data(COL)

pdf('pValueOneSidedSleepStudyExplained.pdf', 5.5*1.25, 2.2*1.25)

#===> plot <===#
par(las=1, mar=c(2,0,0.5,0), mgp=c(3,0.65,0))
X <- seq(-5,8,0.025)
Y <- dt(X, 15)
plot(X, Y, type='l', axes=FALSE, xlim=c(-3.8,5.5), lwd=2)
axis(1, at=c(-5, 0, .37/.17, 15), label=expression(0, 'null value', 'observed '*bar(x), 0), cex.axis=1.05)
these <- which(X*0.17 + 7 >= 7.37)
polygon(c(X[these[1]], X[these],X[rev(these)[1]]), c(0,Y[these],0), col=COL[1])
yMax <- max(Y)

arrows(-1.67, yMax*.6, -1.4, yMax*.48, length=0.1, lwd=1.5)
text(-1.5, yMax*.8, expression('distribution of '*bar(x)), cex=1, pos=2)
text(-1.5, yMax*.7, expression('if '*H[0]*' was true'), cex=1, pos=2)

xLoc <- 1.9
arrows(2.56, yMax/2.3, 2.562, yMax/10, length=0.1, col=COL[1], lwd=1.5)
text(xLoc, .83*yMax, expression('chance of observed '*bar(x)), pos=4, cex=1, col=COL[1])
text(xLoc, .73*yMax, expression('or another '*bar(x)*' that is even'), pos=4, cex=1, col=COL[1])
text(xLoc, .63*yMax, expression('more favorable towards '*H[A]*","), pos=4, cex=1, col=COL[1])
text(xLoc, .53*yMax, expression('if '*H[0]*' is true'), pos=4, cex=1, col=COL[1])

#arrows(1.3,0.28, 0.43, 0.28, length=0.07)
#text(-.88, 0.13, '  40%\n(0.40)', cex=0.8)

#lines(X, Y)
abline(h=0)


dev.off()
