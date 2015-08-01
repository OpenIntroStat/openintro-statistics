# set seed ------------------------------------------------
set.seed(2406)

# sketch --------------------------------------------------
pdf("office_productivity_sketch.pdf", 5.5, 3)
par(mar = c(1.5, 1.5, 0.5, 0.5), mgp = c(0.3, 0.7, 0), 
    mfrow = c(1,1), cex.lab = 1.5)
curve(rev(dgamma(x, 2.5,1/2)), 0, 14, 
      xlab = "stress", ylab = "productivity", lwd = 2, axes = FALSE)
box()
dev.off()