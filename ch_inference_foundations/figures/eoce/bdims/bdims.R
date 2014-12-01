library(openintro)
data(bdims)

oiB = "#3E9BC0"

###

pdf("bdims_heights.pdf", height = 3, width = 6)

par(mar=c(3.7,2,1,1), las=1, mgp=c(2.5,0.7,0), mfrow = c(1,1), cex.lab = 1.25)

histPlot(bdims$hgt, col = oiB, xlab = "Height", ylab = "")

dev.off()












###

# MOVE TO CHP 7

###

pdf("bodyHgtShoGi.pdf", 5.5, 4.3)

par(mar=c(4,4,1,1), las=1, mgp=c(2.8,0.7,0))

plot(bm$Hgt ~ bm$ShoGi, xlab="Shoulder girth (in cm)", ylab="Height (in cm)", pch=19, col=COL[2], cex.lab = 1.5, cex.axis = 1.5)

dev.off()

###

setwd("/Users/mine/Desktop/Open Intro/Chp 7 - EOCE/figures")

pdf("bodyWgtHipGi.pdf", 5.5, 4.3)

par(mar=c(4,4,1,1), las=1, mgp=c(2.8,0.7,0))

plot(bm$Wgt ~ bm$HipGi, xlab="Hip girth (in cm)", ylab="Weight (in kg)", pch=19, col=COL[2], cex.lab = 1.5, cex.axis = 1.5, ylim = c(40,120))

dev.off()

###

cor(bm$Hgt, bm$ShoGi)
mean(bm$Hgt)
sd(bm$Hgt)
mean(bm$ShoGi)
sd(bm$ShoGi)

###

COL <- c('#550000','#22558866')

setwd("/Users/cetinkaya/Dropbox/Desktop/Open Intro/Chp 7 - EOCE/figures")

pdf("bodyWgtHgt.pdf", 5.5, 4.3)

par(mar=c(4,4,1,1), las=1, mgp=c(2.8,0.7,0))

plot(bm$Wgt ~ bm$Hgt, xlab="Height (in cm)", ylab="Weight (in kg)", pch=19, col=COL[2], cex.lab = 1.5, cex.axis = 1.5, ylim = c(40,120))

dev.off()

##

library(xtable)

xtable(summary(lm(bm$Wgt ~ bm$Hgt)))