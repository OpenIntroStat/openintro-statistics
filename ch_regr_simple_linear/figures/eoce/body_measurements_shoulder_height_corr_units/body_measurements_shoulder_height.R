# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------

data(bdims)

# correlation -------------------------------------------------------

round(cor(crawling_babies$avg_crawling_age, crawling_babies$temperature), 2)

# plot height vs. shoulder girth ------------------------------------

pdf("body_measurements_height_shoulder_girth.pdf", 5.5, 4.3)

par(mar = c(3.8, 3.8, 0.5, 0.5), las = 1, mgp = c(2.7, 0.7, 0), 
    cex.lab = 1.25, cex.axis = 1.25)

plot(bdims$hgt ~ bdims$sho.gi, 
     xlab = "Shoulder girth (cm)", ylab = "Height (cm)", 
     pch = 19, col = COL[1,2])

dev.off()