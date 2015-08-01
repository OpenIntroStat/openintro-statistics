# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------
data(gifted)

# histogram of IQ scores --------------------------------------------
myPDF("gifted_children_IQ_hist.pdf", 5.5, 1.55, mar = c(3, 2, 0.2, 1), 
      mgp=c(1.8, 0.55, 0), mfrow = c(1,3))

histPlot(gifted$motheriq, col = COL[1], 
         xlab = "Mother's IQ", ylab = "", 
         axes = FALSE, xlim = c(100,140), ylim = c(0,12))
axis(1, at = seq(100,140,20))
axis(2, at = seq(0,12,4))
histPlot(gifted$fatheriq, col = COL[1], 
         xlab = "Father's IQ", ylab = "", 
         axes = FALSE, xlim = c(110,130), ylim = c(0,12))
axis(1, at = seq(100,130,10))
axis(2, at = seq(0,12,4))
histPlot(gifted$motheriq - gifted$fatheriq, col = COL[1], 
         xlab = "Diff.", ylab = "", 
         axes = FALSE, xlim = c(-20,20), ylim = c(0,12))
axis(1, at = seq(-20,20,20))
axis(2, at = seq(0,12,4))

dev.off()