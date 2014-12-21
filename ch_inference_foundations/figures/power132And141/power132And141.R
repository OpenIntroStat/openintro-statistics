library(openintro)
data(COL)

myPDF("power132And141.pdf", 7.15, 3.3,
      mar=c(3.7, 0.5, 0.5, 0.5),
      mgp=c(2.5, 0.55, 0))

X    <- seq(119, 141, length.out=500)
Y0   <- dt((X - 130) / 2.5, 30)
Y115 <- dt((X - 132) / 2.5, 30)

ylim <- range(Y0)
plot(X, Y0,
     type='l',
     col=COL[2],
     axes=FALSE,
     xlab='Systolic blood pressure',
     ylab='',
     ylim=1.1 * ylim,
     lwd=2)
axis(1)
abline(h=0)
lines(X, Y115, col=COL[1], lwd=2)
these <- (X > 134.899)
Xhold <- c(134.9, X[these])
Yhold <- c(0, Y115[these])
polygon(Xhold, Yhold,
        col=COL[1, 3],
        border='#00000000')
these <- (X < 125.101)
Xhold <- c(X[these], 125.1)
Yhold <- c(Y115[these], 0)
polygon(Xhold, Yhold,
        col=COL[1, 3],
        border="#00000000")
segments(c(125.1, 134.9), c(0, 0),
         c(125.1, 134.9), rep(0.2, 2),
         lty=3,
         col=COL[5],
         lwd=3)
segments(c(125.1, 134.9), c(0, 0),
         c(125.1, 134.9), rep(0.2, 2),
         lty=3,
         col=COL[5],
         lwd=1.5)
arrows(124, ylim[2] * 0.8,
       126.5, ylim[2] * 0.6,
       length=0.1,
       col=COL[2])
text(123, ylim[2] * 0.8, "Null\ndistribution",
     pos=3,
     col=COL[2])
dev.off()
