library(openintro)
data(COL)

pdf('sulphStudyFindPValueUsingNormalApprox.pdf', 6, 2.2)

#===> plot <===#
par(las=1, mar=c(2,0,0.5,0), mgp=c(3,0.65,0))
X <- seq(-5,5,0.01)
Y <- dt(X, 20)
plot(X, Y, type='l', axes=F, xlim=c(-3.5,3.5))
axis(1, at=c(-5, 0, 1.9, 5), label=expression(0, 'null diff. = 0   ', '   obs. diff. = 0.025', 0), cex.axis=0.8)
these <- which(X >= 1.9)
polygon(c(X[these[1]], X[these],X[rev(these)[1]]), c(0,Y[these],0), col=COL[1])
yMax <- max(Y)

text(0, yMax*.4, '0.973', cex=1.2)

arrows(2.3, yMax/2, 2.3, yMax/9, length=0.1, col=COL[1], lwd=1.5)
text(2.3, yMax/2, 'p-value\n 0.027', pos=3, cex=1.2, col=COL[1])

#arrows(1.3,0.28, 0.43, 0.28, length=0.07)
#text(-.88, 0.13, '  40%\n(0.40)', cex=0.8)

lines(X, Y)
abline(h=0)


dev.off()
