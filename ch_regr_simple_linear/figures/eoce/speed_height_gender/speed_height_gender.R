# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------

speed_survey <- read.csv("speed_survey.csv")

# assign colors and plotting characters to gender -------------------

speed_survey$col[speed_survey$gender == "female"] <- COL[4]
speed_survey$col[speed_survey$gender == "male"] <- COL[2]

speed_survey$pch[speed_survey$gender == "female"] <- 4
speed_survey$pch[speed_survey$gender == "male"] <- 19

# plot speed vs. height ---------------------------------------------

pdf("speed_height.pdf", 5.5, 4.3)

par(mar = c(3.7, 3.7, 0.5, 0.5), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1.25, cex.axis = 1.25)

plot(speed_survey$speed ~ speed_survey$height, 
     xlab = "Height (in inches)", ylab = "Fastest speed (in mph)", 
     pch = 19, col = COL[1,2], 
     axes = FALSE, ylim = c(0,150))
axis(1, at = seq(50, 80, 10))
axis(2, at = seq(0, 150, 50))
box()

dev.off()

# plot speed vs. height vs. gender ----------------------------------

pdf("speed_height_gender.pdf", 5.5, 4.3)

par(mar = c(3.7, 3.7, 0.5, 0.5), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1.25, cex.axis = 1.25)

plot(speed_survey$speed ~ speed_survey$height, 
     xlab = "Height (in inches)", ylab = "Fastest speed (in mph)", 
     pch = speed_survey$pch, col = speed_survey$col, 
     axes = FALSE, ylim = c(0,150))
axis(1, at = seq(50, 80, 10))
axis(2, at = seq(0, 150, 50))
box()

legend("bottomright", inset = 0.05, 
       col = c(COL[4],COL[2]), 
       pch = c(4,19), legend = c("female", "male"))

dev.off()