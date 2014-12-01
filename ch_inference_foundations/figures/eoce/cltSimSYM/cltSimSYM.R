library(openintro)

set.seed(85479)
a  = rnorm(1e6, 10, 3)

myPDF("cltSimSYM_pop.pdf", 4.25, 1.95, mar=c(2.3,0,0,0), mgp=c(2.7,0.5,0), las = 1)
densityPlot(a, bw = 1/4, from = -2, to = 22, col = COL[5], fadingBorder = "66", histo = "faded", xlab = "", axes = FALSE, ylab = "", breaks = 60, xlim=c(0, 20))
axis(1, at = seq(0,20,5), labels = seq(0,20,5))
text(x = 17, y = 0.103, "Population")
text(x = 17, y = 0.085, expression(paste(mu, " = 10")))
text(x = 17, y = 0.07, expression(paste(sigma, " = 3")))
dev.off()

###

set.seed(9582)
samp = sample(a, size = 100)

myPDF("cltSimSYM_samp.pdf", 3.2, 2, mar=c(3.3,2,0.5,1), mgp=c(2.1,0.5,0))
hist(samp, col = COL[1], xlab = "Plot B", ylab = "", main = "", axes=FALSE)
axis(1)
axis(2, at=c(0, 10, 20))

dev.off()

###

set.seed(7793)

sampling_5 = rep(0, 100)
n = 5

for(i in 1:100){
  	temp <- sample(a, n)
   	sampling_5[i] <- mean(temp)
   	}

myPDF("cltSimSYM_n5.pdf", 3.2, 2, mar=c(3.3,2,0.5,1), mgp=c(2.1,0.5,0))
hist(sampling_5, col = COL[1], xlab = "Plot A", ylab = "", main = "", axes=FALSE)
axis(1)
axis(2, at=c(0, 10, 20))
dev.off()

###

set.seed(3563)

sampling_25 = rep(0, 100)
n = 25

for(i in 1:100){
  	temp <- sample(a, n)
   	sampling_25[i] <- mean(temp)
   	}

myPDF("cltSimSYM_n25.pdf", 3.2, 2, mar=c(3.3,2,0.5,1), mgp=c(2.1,0.5,0))
hist(sampling_25, col = COL[1], xlab = "Plot C", ylab = "", main = "", axes = FALSE)
axis(2, at=seq(0, 20, 10))
axis(1, at = 9:11, labels = 9:11)
dev.off()
