# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------

starbucks <- read.csv("starbucks.csv")

# model calories vs. carbos -----------------------------------------

m_carb_cals <- lm(carb ~ calories, data = starbucks)

# plot calories vs. carbos ------------------------------------------

pdf("starbucks_cals_carbos.pdf", 5.5, 4.3)

par(mar = c(3.5, 4, 1, 0.5), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1.5, cex.axis = 1.5)

plot(carb ~ calories, data = starbucks, 
     pch = 19, col = COL[1,2], 
     xlab = "Calories", ylab = "Carbs (grams)", axes = FALSE)
axis(1)
axis(2, at = seq(20, 80, 20))
box()

abline(m_carb_cals, col = COL[2], lwd = 2)

dev.off()

# plot residuals ----------------------------------------------------

pdf("starbucks_cals_carbos_residuals.pdf", 5.5, 4.3)

par(mar = c(3.5, 4, 1, 0.5), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1.5, cex.axis = 1.5)

plot(m_carb_cals$residuals ~ starbucks$calories,
     xlab = "Calories", ylab = "Residuals", 
     col = COL[1,2], pch = 19,
     ylim = c(-30, 30), axes = FALSE)
axis(1)
axis(2, at = seq(-20, 20, 20))
box()

abline(h = 0, lty = 2)

dev.off()

# histogram of residuals --------------------------------------------

pdf("starbucks_cals_carbos_residuals_hist.pdf", 5.5, 4.3)

par(mar = c(3.5, 2.5, 0.5, 0.5), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1.5, cex.axis = 1.5)

hist(m_carb_cals$residuals,
     col = COL[1], 
     xlab = "Residuals", ylab = "", main = "", 
     axes = FALSE, xlim = c(-40,40))
axis(1, at = seq(-40, 40, 20))
axis(2)

dev.off()