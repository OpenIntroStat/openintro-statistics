# load openintro package for colors ---------------------------------
library(openintro)

# load MASS for data ------------------------------------------------
library(MASS)
data(cats)

# histogram of weights ----------------------------------------------
pdf("cat_weights.pdf", 5.5, 4.3)
par(mar=c(3.7, 2.2, 0.5, 0.5), las=1, mgp=c(2.5, 0.7, 0), 
    cex.lab = 1.5, cex.axis = 1.5)
hist(cats$Bwt, breaks = seq(2, 4, 0.25), ylim = c(0, 35), 
     xlab = "Body weight", col = COL[1], main = "", 
     axes = FALSE)
axis(1)
axis(2, at = seq(0,40,10))
dev.off()