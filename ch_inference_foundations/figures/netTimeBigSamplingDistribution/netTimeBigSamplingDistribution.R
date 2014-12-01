require(openintro)
data(COL)
data(run10)

set.seed(1)
N     <- 100000
means <- rep(0, N)
for(i in 1:N){
	temp <- sample(nrow(run10), 100)
	means[i] <- mean(run10$time[temp], na.rm=TRUE)
}

myPDF('netTimeBigSamplingDistribution.pdf', 8, 3.15, mar=c(3.3, 4, 1.4, 1), mgp=c(2.7,0.55,0))

layout(matrix(1:2,1), c(4.3,3))
plot(0, 0, type='n', xlim=c(88, 102), ylim=c(0, 1350*N/25000), xlab='', ylab='', axes=FALSE)
mtext("Sample mean", 1, 2)
mtext("Frequency", 2, line=3, las=0)
m <- mean(run10$time, na.rm=TRUE)
s <- sd(run10$time, na.rm=TRUE)/10
rect(m-s/100, 0, m+s/100, 1350, col='#00000044', border='#00000000')
rect(m-s, 0, m+s, 135000, col='#00000011', border='#00000000')
rect(m-2*s, 0, m+2*s, 135000, col='#00000011', border='#00000000')
rect(m-3*s, 0, m+3*s, 135000, col='#00000011', border='#00000000')
histPlot(means, col=COL[1], breaks=50, add=TRUE)
abline(h=0)
axis(1, at=c(90, 95, 100))
axis(2, at=seq(0, 5000, 1000))

par(las=1, mar=c(4, 4, 1.4, 1))
q  <- c(seq(0.00001, 0.0009, 0.00001),
       seq(0.001, 0.999, 0.0001),
       seq(0.9991, 0.99999, 0.00001))
ms <- quantile(means, q)
nq <- qnorm(q)
plot(nq, ms, xlab="", ylab='Sample means', main='', col=COL[1], axes=FALSE)
mtext("Theoretical quantiles", 1, 2)
axis(1)
axis(2, c(90, 95, 100))
box()
#m <- mean(run10$time, na.rm=TRUE)
#s <- sd(run10$time, na.rm=TRUE)/10
#rect(m-s/100, 0, m+s/100, 1350, col='#00000044', border='#00000000')
#rect(m-s, 0, m+s, 1350, col='#00000022', border='#00000000')
#rect(m-2*s, 0, m+2*s, 1350, col='#00000022', border='#00000000')
#rect(m-3*s, 0, m+3*s, 1350, col='#00000022', border='#00000000')
#histPlot(means, border='#225588', col='#88AACDDD', breaks=25, add=TRUE)
#abline(h=0)
#axis(2, at=c(90, 95, 100))
#axis(2, at=c(0, 500, 1000))

dev.off()

