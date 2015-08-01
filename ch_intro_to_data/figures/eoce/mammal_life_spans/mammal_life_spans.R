# load openintro package for colors ---------------------------------
library(openintro)

# load data ---------------------------------------------------------
data(mammals)

# calculate # of countries with life exp. & internet data -----------
nrow(mammals) # n = 62

# scatterplot of gpa vs. study hours --------------------------------
pdf("mammal_life_spans_scatterplot.pdf", 5.5, 4.3)
par(mar = c(4, 4.1, 1, 1), las = 1, mgp = c(2.9, 0.7, 0), 
    cex.axis = 1.5, cex.lab = 1.5)
plot(mammals$LifeSpan ~ mammals$Gestation, 
     xlab = "Gestation (days)", ylab = "Life Span (years)", 
     pch = 20, col = COL[1], axes = FALSE)
axis(1, at = seq(0, 600, 100), labels = c(0, NA, 200, NA, 400, NA, 600))
axis(2, at = seq(0, 100, 25))
box()
dev.off()
