library(openintro)

tourism = read.csv("tourism.csv")

lmTourism = lm(tourism$tourist_spending ~ tourism$visitor_count_tho)

###

pdf("tourism_scat.pdf", 5.5, 4.3)
par(mar=c(4,4,0.7,0.5), mgp=c(2.75,1.1,0), cex.lab = 1.5, cex.axis = 1.5)
plot(tourism$visitor_count_tho, tourism$tourist_spending, col = COL[1,3], xlab = "Number of tourists (in thousands)", ylab = "Spending (in million $)", pch = 19)
abline(lmTourism, col = COL[2], lwd = 2)
dev.off()

###

pdf("tourism_res_scat.pdf", 5.5, 4.3)
par(mar=c(4,4,0.7,0.5),  mgp=c(2.75,1.1,0), cex.lab = 1.5, cex.axis = 1.5)
plot(tourism$visitor_count_tho, lmTourism$residuals, col = COL[1,3], xlab = "Number of tourists (in thousands)", ylab = "Residuals", pch = 19, ylim = c(-1500,1500))
abline(h = 0, lty = 2)
dev.off()

###

pdf("tourism_res_hist.pdf", 5.5, 4.3)
par(mar=c(4,2.7,0.5,0.5), las=1, mgp=c(2.75,1.1,0), cex.lab = 1.5, cex.axis = 1.5)
histPlot(lmTourism$res, xlab = "Residuals", ylab = "", axes = FALSE, ylim = c(0,20), col = COL[1])
axis(1, c(-1500, -750, 0, 750, 1500))
axis(2, c(0, 10, 20))

dev.off()
