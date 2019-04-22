# load packages -----------------------------------------------------
library(openintro)
library(xtable)

# load data ---------------------------------------------------------

prof_evals_beauty <- read.csv("prof_evals_beauty.csv")

# rename variables for convenience ----------------------------------

beauty <- prof_evals_beauty$btystdave
eval <- prof_evals_beauty$courseevaluation

# model evaluation scores vs. beauty --------------------------------

m_eval_beauty = lm(eval ~ beauty)

xtable(summary(m_eval_beauty))

# scatterplot of evaluation scores vs. beauty -----------------------

pdf("rate_my_prof_eval_beauty.pdf", 5.5, 4.3)

par(mar = c(3.9, 3.9, 0.5, 0.5), las = 0, mgp = c(2.7, 0.7, 0), 
    cex.lab = 1.5, cex.axis = 1.5, las = 1)

plot(eval ~ beauty, 
     xlab = "Beauty", ylab = "Teaching evaluation", 
     pch = 19, col = COL[1,2], 
     axes = FALSE)
axis(1, at = seq(-1, 2, 1))
axis(2, at = seq(2, 5, 1))
box()

dev.off()

# residuals plot ----------------------------------------------------

pdf("rate_my_prof_residuals.pdf", height = 5, width = 5)

par(mar = c(3.9, 3.9, 0.5, 0.5), las = 0, mgp = c(2.7, 0.7, 0), 
    cex.lab = 1.5, cex.axis = 1.5, las = 1)

plot(m_eval_beauty$residuals ~ beauty, 
     xlab = "Beauty", ylab = "Residuals", 
     pch = 19, col = COL[1,2], 
     ylim = c(-1.82, 1.82), axes = FALSE)
axis(1, at = seq(-1, 2, 1))
axis(2, at = seq(-1, 1, 1))
box()
abline(h = 0, lty = 3)

dev.off()

# residuals histogram -----------------------------------------------

pdf("rate_my_prof_residuals_hist.pdf", height = 5, width = 5)

par(mar = c(3.9, 3, 0, 0), cex.lab = 1.5, cex.axis = 1.5)

hist(m_eval_beauty$residuals, 
     xlab = "Residuals", ylab = "", main = "",
     col = COL[1],
     xlim = c(-2,2))

dev.off()

# normal probability plot of residuals ------------------------------

pdf("rate_my_prof_residuals_qq.pdf", height = 5, width = 5)

par(mar = c(3.9, 3.9, 0.5, 0.5), mgp = c(2.7, 0.7, 0), 
    cex.lab = 1.5, cex.axis = 1.5)

qqnorm(m_eval_beauty$residuals, 
       pch = 19, col = COL[1,2],
       main = "", las = 0)
qqline(m_eval_beauty$residuals, col = COL[1])

dev.off()

# order of residuals ---------------------------------------------===

pdf("rate_my_prof_residuals_order.pdf", height = 5, width = 5)

par(mar = c(3.9, 3.9, 0.5, 0.5), mgp = c(2.7, 0.7, 0), 
    cex.lab = 1.5, cex.axis = 1.5)

plot(m_eval_beauty$residuals, 
     xlab = "Order of data collection", ylab = "Residuals", main = "",
     pch = 19, col = COL[1,2],
     ylim = c(-1.82, 1.82), axes = FALSE)
axis(1)
axis(2, at = seq(-1, 1, 1))
box()

abline(h = 0, lty = 3)

dev.off()