# load packages -----------------------------------------------------
library(openintro)
library(xtable)
library(MASS)

# load data ---------------------------------------------------------

data(cats)

# model heart weight vs. weight -------------------------------------

m_cats_hwt_bwt <- lm(cats$Hwt ~ cats$Bwt)

xtable(summary(m_cats_hwt_bwt), digits = 3)

round(summary(m_cats_hwt_bwt)$r.squared, 4)
round(summary(m_cats_hwt_bwt)$adj.r.squared, 4)
  
# plot heart weight vs. weight --------------------------------------

pdf("cat_body_heart.pdf", 5.5, 4.3)

par(mar = c(3.7, 3.7, 0.5, 0.5), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1.5, cex.axis = 1.5)

plot(cats$Hwt ~ cats$Bwt, 
     xlab = "Body weight (kg)", ylab = "Heart weight (g)", 
     pch = 19, col = COL[1,2],
     xlim = c(2,4), ylim = c(5, 20.5), axes = FALSE)
axis(1, at = seq(2, 4, 0.5))
axis(2, at = seq(5, 20, 5))
box()

dev.off()