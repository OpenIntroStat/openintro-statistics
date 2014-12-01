library(openintro)
data(COL)

pdf('whyWeWantPValue.pdf', 6.3, 2.5)
par(mar=c(2,1,.5,1), mgp=c(2.1,0.6,0))
X <- seq(-10, 4, 0.025)
Y <- dnorm(X) # makes better visual
plot(X, Y, type='l', xlab='', ylab='', axes=FALSE, xlim=c(-6,3), col=COL[5], lwd=2.5)
axis(1, at=c(-10, -5, 0, 5), expression('', 'null value '*-5*'*SE   ', 'null value', '')) #at=c(-4, -2, 0, 2, 4))
abline(h=0) #, col='#00000088')
yMax <- max(Y)

text(0, yMax/2-0.02, expression('Distribution of '*bar(x)), cex=1.1, col=COL[5])
text(0, yMax/3-0.01, expression('if '*H[0]*' was true'), cex=1.1, col=COL[5])

arrows(-5,yMax/3, -5,yMax/20, length=0.1, lwd=1.5)
text(-5, yMax/3, expression('observed '*bar(x)), cex=1.1, pos=3)

dev.off()