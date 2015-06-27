library(openintro)
data(COL)

# Proportions not exactly right. Adjusted slightly for aesthetics.

pdf('familyCollegeVenn.pdf', 4.5, 2.4)
par(mar = rep(0, 4))
plot(0:1, 0:1, type = 'n', axes = FALSE)
rect(0, 0, 1, 1, lwd=2)
rect(0.07, 0.15,
     0.59, 0.82,
     border = COL[4,2],
     col = paste0(COL[4], "25"),
     lty = 3,
     lwd = 2.512)
text(0.33, 0.07, 'parent completed a college degree', col=COL[4,2])
rect(0.18, 0.14,
     0.96, 0.86,
     border=COL[1],
     col = paste0(COL[1], "40"),
     lty = 2,
     lwd = 2)
text(0.74, 0.84, 'Teenager went to college', col = COL[1], pos = 3)
text(0.39, 0.48, 0.29, col = COL[5]) # intersection
text(0.13, 0.47, 0.06, col = COL[4])
text(0.8, 0.5, 0.27, col = COL[1])
text(0.83, 0.05, 'Neither: 0.38', col = COL[6]) # outersection
dev.off()
