# load packages -----------------------------------------------------
library(openintro)
library(dplyr)

# load data ---------------------------------------------------------
data(chickwts)

# summary stats ----------------------------------------------------
chickwts %>%
  group_by(feed) %>%
  summarise(mean = round(mean(weight), 2),
            sd = round(sd(weight), 2),
            length = n())

# side-by-side box plots of weight by feed -------------------------
pdf("chick_wts_box.pdf", height = 4, width = 8)
par(mar=c(2, 4, 0.5, 0.5), las = 1, mgp = c(2.9, 0.7, 0), 
    cex.lab = 1.25, cex.axis = 1.25)
boxPlot(chickwts$weight, fact = chickwts$feed, 
		h = T, col = COL[1], lwd = 1.5, medianLwd = 2.5, lcol = COL[1],
		horiz = FALSE, ylab = "Weight (in grams)")
dev.off()