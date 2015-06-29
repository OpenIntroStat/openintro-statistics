library(MASS)
library(openintro)

pdf("heart_body.pdf", 5.5, 4.3)
par(mgp = c(2.5, 0.7, 0), mar = c(4,4,1,1), cex.axis = 1.5, cex.lab = 1.5, las = 1)
plot(cats$Hwt~cats$Bwt, pch = 19, col = COL[1,3], xlab = "body weight (kg)", ylab = "heart weight (g)")
dev.off()

cat_model = lm(cats$Hwt~cats$Bwt)

summary(cat_model)
xtable(summary(cat_model), digits = 3)
