library(openintro)

pu_allyrs = read.csv("pickup.csv")
pu = subset(pu_allyrs, pu_allyrs$year >= 1992)
pu$price = pu$price/1000

# linear model
pu_lin = lm(pu$price ~ pu$year)

# 1992 and newer: scatterplot, no line

pdf("pu_lin_scat.pdf", 4.2, 3)
par(mar=c(4.2,4.5,1,1), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.2, cex.axis = 1.2)
plot(pu$price ~ pu$year, ylab = "Price (thousand $)", xlab = "Year", pch=19, col=COL[1,2])
abline(pu_lin, col = COL[2], lwd = 2)
dev.off()

pdf("pu_res_scat.pdf", 4.2, 3)
par(mar=c(4.2,4.5,1,1), las=1, mgp=c(2.5,1,0), cex.lab = 1.2, cex.axis = 1.2)
plot(pu_lin$residuals ~ pu$year, ylab = "Residuals", xlab = "Year", pch=19, col=COL[1,2], ylim = c(-8,8))
abline(h = 0, lty = 2)
dev.off()

# logged model
pu_log = lm(log(pu$price) ~ pu$year)
xtable(summary(pu_log), digits = 3)
# 1992 and newer: scatterplot, no line

pdf("pu_lin_scat_log.pdf", 4.2, 3)
par(mar=c(4.2,4.5,1,1), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.2, cex.axis = 1.2)
plot(log(pu$price) ~ pu$year, ylab = "log(price)", xlab = "Year", pch=19, col=COL[1,2])
abline(pu_log, col = COL[2], lwd = 2)
dev.off()

pdf("pu_res_scat_log.pdf", 4.2, 3)
par(mar=c(4.2,4.5,1,1), las=1, mgp=c(2.5,1,0), cex.lab = 1.2, cex.axis = 1.2)
plot(pu_log$residuals ~ pu$year, ylab = "Residuals", xlab = "Year", pch=19, col=COL[1,2], ylim = c(-1,1))
abline(h = 0, lty = 2)
dev.off()

