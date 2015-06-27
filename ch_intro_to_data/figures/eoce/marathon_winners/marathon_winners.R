# load openintro package for colors ---------------------------------
library(openintro)

# load data ---------------------------------------------------------
data(marathon)

# histogram and box plot of marathon finishing times of winners -----
pdf("marathon_winners_hist_box.pdf", height = 2.2, width = 7)

par(mar = c(2, 2.8, 0.5, 5), las = 1, mgp = c(2.9, 0.7, 0),
    cex.axis = 1.5, cex.lab = 1.5)
layout(matrix(1:2, 1), 2:1)
histPlot(marathon$Time, col = COL[1], 
         xlab = "Marathon times", ylab = "", yaxt = "n", 
         axes = FALSE)
axis(1, at = seq(2, 3.2, 0.4))
axis(2, at = seq(0, 20, 10))

par(mar = c(2, 2.8, 0.5, 0))
boxPlot(marathon$Time, col = COL[1,2], ylim = c(2, 3.2),
        ylab = "Marathon times",
        axes = FALSE)
axis(2, at = seq(2, 3.2, 0.4))

dev.off()

# finishing times vs. gender ----------------------------------------
pdf("marathon_winners_gender_box.pdf", height = 1.5, width = 7)

par(mar = c(2, 5.1, 0, 1), las = 1, mgp = c(2.5, 0.7, 0), 
    mfrow = c(1,1), cex.lab = 1.5, cex.axis = 1.5)
boxPlot(marathon$Time, horiz = TRUE, fact = marathon$Gender, 
        xlim = c(2,3.2), ylim = c(0.5, 2.5),
        axes = FALSE, col = COL[1,2])
axis(1, at = seq(2,3.2,0.4))
axis(2, at = c(1,2), labels = c("Women", "Men"))

dev.off()

# times series by gender --------------------------------------------
pdf("marathon_winners_time_series.pdf", height = 3, width = 9)

par(mar = c(2, 4, 0.5, 1.3), las = 1, mgp = c(2.7, 0.7, 0), 
    cex.lab = 1.5, cex.axis = 1.5)
plot(marathon$Time[marathon$Gender == "m"] ~ marathon$Year[marathon$Gender == "m"],
     xlab = "Year", ylab = "Marathon times", 
     pch = 19, col = COL[1], ylim = c(2, 3.2), axes = FALSE)

points(marathon$Time[marathon$Gender == "f"] ~ marathon$Year[marathon$Gender == "f"],
       xlab = "Year", pch = 4, lwd = 1.7, col = COL[2])
axis(1)
axis(2, at = seq(2, 3.2, 0.4))
legend("topright", inset = 0, pch = c(4, 19), col = c(COL[2], COL[1]), 
       legend = c("Women", "Men"))

dev.off()