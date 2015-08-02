# load packages -----------------------------------------------------
library(openintro)
library(xtable)

# load data ---------------------------------------------------------

data(bdims)

# correlation -------------------------------------------------------

round(cor(bdims$hgt, bdims$wgt), 2)

# model -------------------------------------------------------------

m_weight_height <- lm(bdims$wgt ~ bdims$hgt)

xtable(summary(m_weight_height))

# plot weight vs. height --------------------------------------------

pdf("body_measurements_weight_height.pdf", 5.5, 4.3)

par(mar = c(3.9, 3.9, 0.5, 0.5), las = 1, mgp = c(2.7, 0.7, 0), 
    cex.lab = 1.5, cex.axis = 1.5)

plot(bdims$wgt ~ bdims$hgt, 
     ylab = "Weight (kg)", xlab = "Height (cm)", 
     pch = 19, col = COL[1,2],
     axes = FALSE, xlim = c(147,199))
axis(1, at = seq(150, 200, 25))
axis(2, at = seq(50, 110, 20))
box()

dev.off()