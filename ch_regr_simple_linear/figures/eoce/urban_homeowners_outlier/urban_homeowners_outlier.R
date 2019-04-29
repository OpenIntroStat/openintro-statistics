# load packages -----------------------------------------------------
library(openintro)

# load packages -----------------------------------------------------
urban_state_data <- read.csv("urban_state_data.csv")

# plot with outlier DC ----------------------------------------------

pdf("urban_homeowners_outlier.pdf", 5.5, 4.3)

par(mar = c(4.5, 5, 1.5, 1), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1.5, cex.axis = 1.5)

plot(urban_state_data$pct_owner_occupied ~ urban_state_data$poppct_urban,
     xlab = 'Percent Urban Population',
     ylab = '', 
     pch = 19, col = COL[1,2], 
     ylim = c(41, 75), axes = FALSE)
AxisInPercent(1, at = seq(40, 100, 20))
AxisInPercent(2, at = seq(45, 75, 10))
box()
par(las = 0)
mtext("Percent Own Their Home", 2, 3.8, cex = 1.5)
dev.off()
