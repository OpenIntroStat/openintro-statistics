# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------

data(trees)

# plot volume vs. height ---------------------------------------------

pdf("trees_volume_height.pdf", 5, 4)

par(mar = c(3.7, 3.7, 0.5, 0.5), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1.25, cex.axis = 1.25)

plot(trees$Volume ~ trees$Height, 
     xlab = "Height (feet)", ylab = "Volume (cubic feet)", 
     pch = 19, col = COL[1], axes = FALSE,
     xlim = c(60, 90),
     ylim = 1.1 * range(0, trees$Volume))
axis(1, at = seq(60, 90, 10))
axis(2)
box()

dev.off()

# plot volume vs. diameter ---------------------------------------------

pdf("trees_volume_diameter.pdf", 5, 4)

par(mar = c(3.7, 3.7, 0.5, 0.5), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1.25, cex.axis = 1.25)

plot(trees$Volume ~ trees$Girth, 
     xlab = "Diameter (inches)", ylab = "Volume (cubic feet)", 
     pch = 19, col = COL[1], axes = FALSE,
     xlim = c(7, 21),
     ylim = 1.1 * range(0, trees$Volume))
axis(1, at = seq(8,20,4))
axis(2)
box()

dev.off()