library(openintro)

myPDF("body_measurements_weight_hip_girth.pdf", 5.7, 4.3,
    mar = c(3.8, 3.8, 0.5, 1),
    mgp = c(2.7, 0.7, 0), 
    cex.lab = 1.25,
    cex.axis = 1.25)

plot(bdims$wgt ~ bdims$hip_gi, 
    xlab = "Hip girth (cm)", ylab = "Weight (kg)", 
    pch = 19, col = COL[1,2])

dev.off()