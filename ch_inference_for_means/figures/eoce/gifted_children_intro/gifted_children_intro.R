# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------
data(gifted)

# plot counts -------------------------------------------------------
pdf("gifted_children_ht_count_hist.pdf", height = 3, width = 6)
par(mar=c(3.7,2.2,0.5,0.5), las=1, mgp=c(2.5,0.7,0), cex.lab = 1.5)
histPlot(gifted$count, col = COL[1], 
         xlab = "Age child first counted to 10 (in months)", ylab = "", 
         axes = FALSE)
axis(1)
axis(2, at = c(0,3,6))
dev.off()