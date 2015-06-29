library(xtable)
library(openintro)

load("acs.RData")
acs_sub = subset(acs, acs$employment == "employed" & acs$income > 0)
table(acs_sub$employment)

acs_sub = droplevels(acs_sub) # note that we overwrite acs_sub
table(acs_sub$employment)

names(acs_sub)
acs_sub$income = acs_sub$income / 1000

## non-log
m_lin = lm(income ~ hrs_work, data = acs_sub)

pdf("acs_lin_scat.pdf", 4.2, 3)
par(mar=c(4.2,4.5,1,1), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.2, cex.axis = 1.2)
plot(acs_sub$income ~ acs_sub$hrs_work, ylab = "Income (thousand $)", xlab = "Hours worked", pch=19, col=COL[1,3])
abline(m_lin, col = COL[2], lwd = 2)
dev.off()

pdf("acs_lin_res_scat.pdf", 4.2, 3)
par(mar=c(4.2,4.5,1,1), las=1, mgp=c(2.5,1,0), cex.lab = 1.2, cex.axis = 1.2)
plot(m_lin$residuals ~ m_lin$model$hrs_work, ylab = "Residuals", xlab = "Hours worked", pch=19, col=COL[1,3], ylim = c(-400,400))
abline(h = 0, lty = 2)
dev.off()

## log
m_log = lm(log(income) ~ hrs_work, data = acs_sub)
xtable(summary(m_log), digits = 3)

pdf("acs_log_scat.pdf", 4.2, 3)
par(mar=c(4.2,4.5,1,1), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.2, cex.axis = 1.2)
plot(log(acs_sub$income) ~ acs_sub$hrs_work, ylab = "log(income)", xlab = "Hours worked", pch=19, col=COL[1,3])
abline(m_log, col = COL[2], lwd = 2)
dev.off()

pdf("acs_log_res_scat.pdf", 4.2, 3)
par(mar=c(4.2,4.5,1,1), las=1, mgp=c(2.5,1,0), cex.lab = 1.2, cex.axis = 1.2)
plot(m_log$residuals ~ m_log$model$hrs_work, ylab = "Residuals", xlab = "Hours worked", pch=19, col=COL[1,3], ylim = c(-4.2,4.2))
abline(h = 0, lty = 2)
dev.off()