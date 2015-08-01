# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------
data(hsb2)

# create variables from data ----------------------------------------
scores <- c(hsb2$read, hsb2$write)
gp <- c(rep('read', nrow(hsb2)), rep('write', nrow(hsb2)))

# read vs. write side-by-side box plot ------------------------------
pdf("hs_beyond_read_write_box.pdf", height = 3, width = 5)
par(mar = c(3, 4, 0.5, 0.5), las = 1, mgp = c(2.8, 0.7, 0), 
    cex.axis = 1.1, cex.lab = 1.1)
openintro::dotPlot(scores, gp, vertical = TRUE, ylab = "scores", 
                   at=1:2+0.13, col = COL[1,3], 
                   xlim = c(0.5,2.5), ylim = c(20, 80), 
                   axes = FALSE, cex.lab = 1.25, cex.axis = 1.25)
axis(1, at = c(1,2), labels = c("read","write"), cex.lab = 1.25, cex.axis = 1.25)
axis(2, at = seq(20, 80, 20), cex.axis = 1.25)
boxplot(scores ~ gp, add = TRUE, axes = FALSE, col = NA)
dev.off()

# histogram of differences of read and write ------------------------
pdf("hs_beyond_diff_hist.pdf", height = 3, width = 5.5)
par(mar=c(3.3, 2, 0.5, 0.5), las = 1, mgp = c(2.1, 0.7, 0), 
    cex.lab = 1.25, cex.axis = 1.25)
histPlot(hsb2$read - hsb2$write, col = COL[1], 
         xlab = "Differences in scores (read - write)", ylab = "")
dev.off()
