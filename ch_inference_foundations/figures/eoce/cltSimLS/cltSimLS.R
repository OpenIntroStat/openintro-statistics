library(openintro)


set.seed(85479)
a  = rbeta(1e6, 3.5, 2)
b = a * 94

myPDF("cltSimLS_pop.pdf", 4.25, 1.95, mar=c(2.3,0,0,0), mgp=c(2.7,0.5,0), las = 1)
densityPlot(b, bw = 1, from = 0, to = 101, col = COL[5], fadingBorder = "66", histo = "faded", xlab = "", axes = FALSE, ylab = "")
axis(1)
text(x = 10, y = 0.015, "Population")
text(x = 10, y = 0.0125, expression(paste(mu, " = 60")))
text(x = 10, y = 0.01, expression(paste(sigma, " = 18")))
dev.off()

###

set.seed(2452)
samp = sample(b, size = 500)

myPDF("cltSimLS_samp.pdf", 3.2, 2, mar=c(3.3,2,0.5,1), mgp=c(2.1,0.5,0))
hist(samp, col = COL[1], xlab = "Plot B", ylab = "", main = "", axes=FALSE)
axis(1)
axis(2, at=c(0, 50, 100))
dev.off()

###

set.seed(24524)

sampling_18 = rep(0, 500)
n = 18

for(i in 1:500){
  	temp <- sample(b, n)
   	sampling_18[i] <- mean(temp)
   	}

myPDF("cltSimLS_n18.pdf", 3.2, 2, mar=c(3.3,2,0.5,1), mgp=c(2.1,0.5,0))
hist(sampling_18, col = COL[1], xlab = "Plot C", ylab = "", main = "", axes=FALSE)
axis(1)
axis(2, at=c(0, 50, 100))
dev.off()

###

set.seed(3563)

sampling_81 = rep(0, 500)
n = 81

for(i in 1:500){
  	temp <- sample(b, n)
   	sampling_81[i] <- mean(temp)
   	}

myPDF("cltSimLS_n81.pdf", 3.2, 2, mar=c(3.3,2,0.5,1), mgp=c(2.1,0.5,0))
hist(sampling_81, col = COL[1], xlab = "Plot A", ylab = "", main = "", axes=FALSE)
axis(1)
axis(2, at=c(0, 50, 100))
dev.off()
