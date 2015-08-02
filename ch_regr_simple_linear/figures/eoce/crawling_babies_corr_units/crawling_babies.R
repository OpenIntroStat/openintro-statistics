# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------

crawling_babies <- read.csv("crawling_babies.csv")

# correlation -------------------------------------------------------

round(cor(crawling_babies$avg_crawling_age, crawling_babies$temperature), 2)

# plot trave time vs. distance --------------------------------------

pdf("crawling_babies.pdf", 5.5, 4.3)

par(mar = c(3.5, 3.5, 0.5, 0.5), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1.25, cex.axis = 1.25)

plot(crawling_babies$avg_crawling_age ~ crawling_babies$temperature, 
     xlab = "Temperature (F)", ylab = "Avg. crawling age (weeks)",
     pch = 19, col = COL[1])

dev.off()