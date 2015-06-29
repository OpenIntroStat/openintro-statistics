library(openintro)

sb = read.csv("starbucks.csv")

lmSbuxCarb = lm(sb$carb ~ sb$calories)

#####################
# carb vs. calories
#####################

pdf("carb_cals_scat.pdf", 5.5, 4.3)
par(mar=c(4,4,0.7,0.5), mgp=c(2.75,1.1,0), cex.lab = 1.5, cex.axis = 1.5)
plot(sb$calories, sb$carb, col = COL[1,3], xlab="Calories", ylab="Carb (in grams)", pch = 19)
abline(lmSbuxCarb, col = COL[2], lwd = 2)
dev.off()

##

pdf("carb_cals_res_scat.pdf", 5.5, 4.3)
par(mar=c(4,4,0.7,0.5),  mgp=c(2.75,1.1,0), cex.lab = 1.5, cex.axis = 1.5)
plot(sb$calories, lmSbuxCarb$residuals, col = COL[1,3], xlab="Calories", ylab="Residuals", pch = 19)
abline(h = 0, lty = 2)
dev.off()

##

pdf("carb_cals_res_hist.pdf", 5.5, 4.3)
par(mar=c(4,2.7,0.5,0.5), las=1, mgp=c(2.75,1.1,0), cex.lab = 1.5, cex.axis = 1.5)
histPlot(lmSbuxCarb$residuals, xlab = "Residuals", ylab = "", col = COL[1], xlim = c(-40,40))
dev.off()


#################


###

pdf("pro_cals.pdf", 5.5, 7)

lmPlot(sb$calories, sb$protein, col = fadeColor(COL[1],90), xlab="Calories", ylab="Protein (in grams)", lCol = COL[2], lwd = 2, resSymm = TRUE, resAxis = 3, xAxis = 6, cex.lab = 1.25, cex.axis = 1.25)

dev.off()

