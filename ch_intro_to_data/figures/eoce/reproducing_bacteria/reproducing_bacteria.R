# set seed ------------------------------------------------
set.seed(2406)

# sketch --------------------------------------------------
pdf("reproducing_bacteria_sketch.pdf", 5.5, 3)
par(mar = c(1.5, 1.5, 0.5, 0.5), mgp = c(0.3, 0.7, 0), 
    mfrow = c(1,1), cex.lab = 1.5)
curve(-1*dexp(x, rate = 4), lwd = 2,
      xlab = "time", ylab = "number of bacteria cells", axes = FALSE)
box()
dev.off()