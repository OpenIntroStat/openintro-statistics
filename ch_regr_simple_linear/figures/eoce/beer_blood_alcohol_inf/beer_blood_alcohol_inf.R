# load packages -----------------------------------------------------
library(openintro)
library(xtable)

# load data ---------------------------------------------------------

beer_data <- read.table("beer_blood_alcohol.txt", h = T, sep = "\t")

# scatterplot of BAC vs. beers --------------------------------------  

pdf("beer_blood_alcohol.pdf", 5.5, 4.3)

par(mar = c(3.9, 3.9, 0.5, 0.5), las = 0, mgp = c(2.7, 0.7, 0), 
    cex.lab = 1.5, cex.axis = 1.5)

plot(beer_data$BAC ~ beer_data$beers, 
     xlab = "Cans of beer", ylab = "BAC (grams / deciliter)", 
     pch = 19, col = COL[1])

dev.off()

# model summary -----------------------------------------------------

m_bac <- lm(beer_data$BAC ~ beer_data$beers)

xtable(summary(m_bac))