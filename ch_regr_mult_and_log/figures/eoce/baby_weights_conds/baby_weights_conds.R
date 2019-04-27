# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------

babies <- read.csv("babies.csv")

# mlr for birth weight ----------------------------------------------

m_bwt_mlr <- lm(bwt ~ gestation + parity + age + 
                  height + weight + smoke , data = babies)

# complete cases data for plotting residuals plots ------------------

babies_cc <- na.omit(babies)

# normal prob plot for residuals ------------------------------------

pdf("baby_weights_conds_normal_qq.pdf", 5.5, 4.3)

par(mar = c(3.7,3.9, 0.5, 0.5), las = 1, mgp = c(2.7,0.7,0),
    cex.lab = 1.5, cex.axis = 1.5)

qqnorm(m_bwt_mlr$residuals, 
       ylab = "Residuals", main = "",
       pch = 19, col = COL[1,2],
       ylim = c(-60,60), axes = FALSE)
axis(1)
axis(2, seq(-40, 40, 40))
box()

qqline(m_bwt_mlr$residuals, col = COL[1])

dev.off()

# histogram for residuals ------------------------------------

pdf("baby_weights_conds_normal_hist.pdf", 5.5, 4.3)
par(mar = c(3.7,3.9, 0.5, 0.5), las = 1, mgp = c(2.7,0.7,0),
    cex.lab = 1.5, cex.axis = 1.5)
histPlot(m_bwt_mlr$residuals,
    xlab = "Residuals",
    ylab = "",
    col = COL[1])
box()
dev.off()

# absolute values of residuals against fitted -----------------------

pdf("baby_weights_conds_abs_res_fitted.pdf", 5.5, 4.3)

par(mar = c(3.7, 3.9, 0.5, 0.5), las = 1, mgp = c(2.7,0.7,0),
    cex.lab = 1.5, cex.axis = 1.5)

plot(m_bwt_mlr$residuals ~ m_bwt_mlr$fitted.values, 
     ylab = "Residuals", xlab = "Fitted values", 
     pch = 19, col = COL[1,2], 
     axes = FALSE)
axis(1, seq(80, 160, 40))
axis(2, seq(-40, 40, 40))
box()

abline(h = 0, lty = 2)

dev.off()

# residuals in order of their data collection -----------------------

pdf("baby_weights_conds_res_order.pdf", 5.5, 4.3)

par(mar = c(3.7, 3.9, 0.5, 1), las = 1, mgp = c(2.7,0.7,0),
    cex.lab = 1.5, cex.axis = 1.5)

plot(m_bwt_mlr$residuals ~ c(1:length(m_bwt_mlr$residuals)), 
     ylab = "Residuals", xlab = "Order of collection",
     pch = 19, col = COL[1,2], axes = FALSE)
axis(1, seq(0,1200,400))
axis(2, seq(-40,40,40))
box()

abline(h = 0, lty = 2)

dev.off()

# residuals vs. gestation -------------------------------------------

pdf("baby_weights_conds_res_gestation.pdf", 5.5, 4.3)

par(mar = c(3.9, 3.9, 0.5, 0.5), las = 1, mgp = c(2.7, 0.7,0),
    cex.lab = 1.5, cex.axis = 1.5)

plot(m_bwt_mlr$residuals ~ babies_cc$gestation, 
     ylab = "Residuals", xlab = "Length of gestation", 
     pch = 19, col = COL[1,2], 
     axes = FALSE)
axis(1, seq(150, 350, 50))
axis(2, seq(-40, 40, 40))
box()

abline(h = 0, lty = 2)

dev.off()

# residuals vs. parity -------------------------------------------

pdf("baby_weights_conds_res_parity.pdf", 5.5, 4.3)

par(mar = c(3.9, 3.9, 0.5, 0.5), las = 1, mgp = c(2.7, 0.7,0),
    cex.lab = 1.5, cex.axis = 1.5)

plot(m_bwt_mlr$residuals ~ babies_cc$parity, 
     ylab = "Residuals", xlab = "Parity", 
     pch = 19, col = COL[1,2], 
     axes = FALSE)
axis(1, seq(0, 1, 1))
axis(2, seq(-40, 40, 40))
box()

abline(h = 0, lty = 2)

dev.off()

# residuals vs. height -------------------------------------------

pdf("baby_weights_conds_res_height.pdf", 5.5, 4.3)

par(mar = c(3.9, 3.9, 0.5, 0.5), las = 1, mgp = c(2.7, 0.7,0),
    cex.lab = 1.5, cex.axis = 1.5)

plot(m_bwt_mlr$residuals ~ babies_cc$height, 
     ylab = "Residuals", xlab = "Height of mother", 
     pch = 19, col = COL[1,2], 
     axes = FALSE)
axis(1, at = seq(55, 70, 5))
axis(2, at = seq(-40, 40, 40))
box()

abline(h = 0, lty = 2)

dev.off()

# residuals vs. weight -------------------------------------------

pdf("baby_weights_conds_res_weight.pdf", 5.5, 4.3)

par(mar = c(3.9, 3.9, 0.5, 0.5), las = 1, mgp = c(2.7, 0.7,0),
    cex.lab = 1.5, cex.axis = 1.5)

plot(m_bwt_mlr$residuals ~ babies_cc$weight, 
     ylab = "Residuals", xlab = "Weight of mother", 
     pch = 19, col = COL[1,2], 
     axes = FALSE)
axis(1, at = seq(100, 250, 50))
axis(2, at = seq(-40, 40, 40))
box()

abline(h = 0, lty = 2)

dev.off()

# residuals vs. smoke -------------------------------------------

pdf("baby_weights_conds_res_smoke.pdf", 5.5, 4.3)

par(mar = c(3.9, 3.9, 0.5, 0.5), las = 1, mgp = c(2.7, 0.7,0),
    cex.lab = 1.5, cex.axis = 1.5)

plot(m_bwt_mlr$residuals ~ babies_cc$smoke, 
     ylab = "Residuals", xlab = "Smoke", 
     pch = 19, col = COL[1,2], 
     axes = FALSE)
axis(1, at = seq(0, 1, 1))
axis(2, at = seq(-40, 40, 40))
box()

abline(h = 0, lty = 2)

dev.off()