# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------

data(bdims)

# plot height vs. shoulder girth ------------------------------------

pdf("body_measurements_weight_hip_girth.pdf", 5.5, 4.3)

par(mar = c(3.8, 3.8, 0.5, 0.5), las = 1, mgp = c(2.7, 0.7, 0), 
    cex.lab = 1.25, cex.axis = 1.25)

plot(bdims$wgt ~ bdims$hip.gi, 
     xlab = "Hip girth (cm)", ylab = "Weight (kg)", 
     pch = 19, col = COL[1,2])

dev.off()