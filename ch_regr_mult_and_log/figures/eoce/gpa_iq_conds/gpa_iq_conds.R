# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------

gpa_iq_data <- read.csv("gpa_iq.csv")

# mlr for birth weight ----------------------------------------------

m_gpa <- lm(gpa ~ iq + gender, data = gpa_iq_data)

# normal prob plot for residuals ------------------------------------

pdf("gpa_iq_conds_normal_qq.pdf", 5.5, 4.3)
par(mar = c(3.7,3.9, 0.5, 0.5), las = 1, mgp = c(2.7,0.7,0),
    cex.lab = 1.5, cex.axis = 1.5)
qqnorm(m_gpa$residuals, 
       ylab = "Residuals", main = "",
       pch = 19, col = COL[1,2])
qqline(m_gpa$residuals, col = COL[1])
dev.off()

# Histogram for residuals ------------------------------------

pdf("gpa_iq_conds_normal_hist.pdf", 5.5, 4.3)
par(mar = c(3.7,3.9, 0.5, 0.5), las = 1, mgp = c(2.7,0.7,0),
    cex.lab = 1.5, cex.axis = 1.5)
histPlot(m_gpa$residuals, 
       xlab = "Residuals", ylab = "",
       col = COL[1])
dev.off()

# absolute values of residuals against fitted -----------------------

pdf("gpa_iq_conds_abs_res_fitted.pdf", 5.5, 4.3)

par(mar = c(3.7, 3.9, 0.5, 0.5), las = 1, mgp = c(2.7,0.7,0),
    cex.lab = 1.5, cex.axis = 1.5)

plot(m_gpa$residuals ~ m_gpa$fitted.values, 
     ylab = "Residuals", xlab = "Fitted values", 
     pch = 19, col = COL[1,2])
     
abline(h = 0, lty = 2)

dev.off()

# residuals in order of their data collection -----------------------

pdf("gpa_iq_conds_res_order.pdf", 5.5, 4.3)

par(mar = c(3.7, 3.9, 0.5, 1), las = 1, mgp = c(2.7,0.7,0),
    cex.lab = 1.5, cex.axis = 1.5)

plot(m_gpa$residuals ~ c(1:length(m_gpa$residuals)), 
     ylab = "Residuals", xlab = "Order of collection",
     pch = 19, col = COL[1,2],
     axes = FALSE)
axis(1, at = seq(0, 80, 40))
axis(2, at = seq(-6, 2, 4))
box()

abline(h = 0, lty = 2)

dev.off()

# residuals vs. iq -------------------------------------------

pdf("gpa_iq_conds_res_iq.pdf", 5.5, 4.3)

par(mar = c(3.9, 3.9, 0.5, 0.5), las = 1, mgp = c(2.7, 0.7,0),
    cex.lab = 1.5, cex.axis = 1.5)

plot(m_gpa$residuals ~ gpa_iq_data$iq, 
     ylab = "Residuals", xlab = "IQ", 
     pch = 19, col = COL[1,2],
     axes = FALSE)
axis(1, at = seq(75, 125, 25))
axis(2, at = seq(-6, 2, 4))
box()

abline(h = 0, lty = 2)

dev.off()

# residuals vs. gender -------------------------------------------

pdf("gpa_iq_conds_res_gender.pdf", 5.5, 4.3)

par(mar = c(3.9, 3.9, 0.5, 0.5), las = 1, mgp = c(2.7, 0.7,0),
    cex.lab = 1.5, cex.axis = 1.5)

plot(m_gpa$residuals ~ gpa_iq_data$gender, 
     ylab = "Residuals", xlab = "Gender", 
     pch = 19, col = COL[1,2],
     axes = FALSE)
axis(1, at = c(1, 2), labels = c(0, 1))
axis(2, at = seq(-6, 2, 4))
box()

abline(h = 0, lty = 2)

dev.off()
