library(openintro)
data(COL)
set.seed(2)
x <- c(rnorm(65, 596, 100), exp(rnorm(10, log(500), 1.8)))
x[x < 400] <- rnorm(sum(x < 400), 500, 50)
x[x < 900 & x > 800] <- x[x < 900 & x > 800] + 100
t.test(x, mu=650)
mean(x)
sd(x)
length(x)

pdf('communityCollegeClaimedHousingExpenseDistribution.pdf', 5*1.3, 3*1.3)
par(mar=c(3.2, 3.5, 1, 1), las=1, mgp=c(1.9, 0.7, 0))
histPlot(x, breaks=10, xlab='Housing expense (dollars)', ylab='', col=COL[1], axes=FALSE)
axis(1, at=seq(400, 1000, 200))
axis(2, at=seq(0, 15, 5))
mtext('Freqency', side=2, line=2.3, las=0)
dev.off()

#hist((x-mean(x))/sd(x))

ccHousing <- x
#save(ccHousing, file="ccHousing.rda")

