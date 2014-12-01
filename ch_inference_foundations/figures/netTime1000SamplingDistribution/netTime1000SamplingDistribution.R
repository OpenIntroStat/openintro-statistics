library(openintro)
data(COL)
pdf('netTime1000SamplingDistribution.pdf', 6.5, 3.2)

set.seed(5)
means <- c()
for(i in 1:1000){
	temp <- sample(nrow(run10), 100)
	means[i] <- mean(run10$time[temp], na.rm=TRUE)
}

par(las=1, mar=c(4, 4, 1, 1), mgp=c(2.7,0.7,0))
plot(0, 0, type='n', xlim=c(88, 102), ylim=c(0, 145), xlab='Sample mean', ylab='Frequency', axes=FALSE)
m <- mean(run10$time, na.rm=TRUE)
s <- sd(run10$time, na.rm=TRUE)/10
rect(m-s/100, 0, m+s/100, 1500, col='#00000044', border='#00000000')
rect(m-s, 0, m+s, 1500, col='#00000011', border='#00000000')
rect(m-2*s, 0, m+2*s, 1500, col='#00000011', border='#00000000')
rect(m-3*s, 0, m+3*s, 1500, col='#00000011', border='#00000000')
histPlot(means, col=COL[1], breaks=25, add=TRUE)
abline(h=0)
axis(1, at=c(90, 95, 100))
axis(2, at=c(0, 50, 100))



dev.off()
