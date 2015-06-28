# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------
data(ipod)

# population histogram ----------------------------------------------
pdf("songs_on_ipod_pop_hist.pdf", height = 3, width = 6)
par(mar=c(3.7,2.2,0.5,0.5), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.5)
histPlot(ipod$songLength, col = COL[1], 
         xlab = "Length of song", ylab = "")
dev.off()

######## needs revision ---------------------------------------------

pdf("ipod_popdist.pdf", height = 3, width = 6)

par(mar=c(3.7,2.2,1,1), las=1, mgp=c(2.5,0.7,0), mfrow = c(1,1), cex.lab = 1.25)

histPlot(ipod$songLength, col = oiB, xlab = "Length of song", ylab = "")

dev.off()

###

pdf("ipod_n100.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 3.45
s = 1.63/sqrt(100)
u = 3.6

normTail(m = m, s = s, U = u, col = oiB, axes = FALSE)
axis(1, at = c(m - 3*s,m,u,m + 3*s), label = c(NA,m,u,NA), cex.axis = 1.25)

dev.off()
