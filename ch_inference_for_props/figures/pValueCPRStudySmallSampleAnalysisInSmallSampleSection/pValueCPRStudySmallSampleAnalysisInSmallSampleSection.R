library(openintro)
data(COL)
set.seed(1)
tr <- rep(1:2, c(50, 40))
su <- c(rep(c("s", "d"), c(11, 39)), rep(c("s", "d"), c(14, 26)))

N <- 10^5
d <- rep(NA, N)
for(i in 1:N){
	trf  <- sample(tr)
	p1   <- sum(su[trf == 1] == "s") / 50
	p2   <- sum(su[trf == 2] == "s") / 40
	d[i] <- p2 - p1
}
sum((d) > 0.1299) / N

myPDF("pValueCPRStudySmallSampleAnalysisInSmallSampleSection.pdf", 5*1.35, 2.3*1.35, mar=c(2, 2.5, 0.5, 0.5))
hist(d, breaks=seq(-0.4, 0.4, 0.02), col=COL[7,3], main="", xlab="Differences under the null hypothesis", ylab="", axes=FALSE)
axis(1)
axis(2, at=(0:3)*N/20, labels=c(0, NA, NA, 3)/20)
hist(d[d > 0.1299], breaks=seq(-0.4, 0.4, 0.02), col=COL[1], add=TRUE)
#hist(d[d < -0.1299], breaks=seq(-0.4, 0.4, 0.02), col="#4488AA", add=TRUE)
abline(h=0)
lines(rep(0.13, 2), c(0, 3)*N/25, lty=3, lwd=1.7)
text(0.13, 3*N/25, "0.13", pos=3, cex=0.7)
#lines(rep(-0.13, 2), c(0, 3)*N/25, lty=3, lwd=1.7)
#text(-0.13, 3*N/25, "-0.13", pos=3, cex=0.7)
dev.off()

#N <- 50000
#d <- rpois(N, 3)
#d <- d - mean(d)
#par(mfrow=2:1)
#dd <- sample(d, N/10)
#pv <- rep(NA, N/10)
#for(i in 1:(N/10)){
#	if(dd[i] < 0){
#		pv[i] <- 2*sum(d <= dd[i]) / N	
#	} else {
#		pv[i] <- 2*sum(d >= dd[i]) / N	
#	}
#}
#br <- rep(NA, 200)
#for(j in 1:200){
#	br[j] <- sum(pv < 0.01*j)/N*10
#}
#plot(br)
#abline(0, 1/100)
#dd <- sample(d, N/10)
#pv <- rep(NA, N/10)
#for(i in 1:(N/10)){
#	pv[i] <- sum(abs(d) >= abs(dd[i])) / N	
#}
#br <- rep(NA, 200)
#for(j in 1:200){
#	br[j] <- sum(pv < 0.01*j)/N*10
#}
#plot(br)
#abline(0, 1/100)
