library(openintro)
heartTr <- heart_transplant

# mosaic plot -------------------------------------------------------
pdf("randomization_heart_transplants_mosaic.pdf", 5.5, 4.3)
par(mar = c(0, 0, 0, 0), las = 1, mgp = c(2.7, 0.9, 0))
mosaicplot(transplant ~ survived, data = heartTr, 
           main = "", xlab = "", ylab = "", color = COL[1],
           cex.axis = 1.25)
dev.off()

# box plot ----------------------------------------------------------
pdf("randomization_heart_transplants_box.pdf", 5.5, 4.3)
par(mar = c(2, 4.8, 0, 0), las = 1, mgp = c(3.5, 0.7, 0), 
    cex.lab = 1.5, cex.axis = 1.25)
boxPlot(heartTr$survtime, fact = heartTr$transplant, 
        ylab = "Survival Time (days)", col = COL[1,2])
dev.off()

# randomization -----------------------------------------------------
load("inference.RData")

diffs = inference(heartTr$survived, heartTr$transplant, 
                  success = "dead", order = c("treatment","control"), 
                  est = "proportion", type = "ht", method = "simulation", 
                  nsim = 100, null = 0, alternative = "twosided", simdist = TRUE,
                  seed = 95632)

# plot randomization distribution -----------------------------------
pdf("randomization_heart_transplants_rando.pdf", height = 3, width = 7)

par(mar = c(3.6, 2.2, 1, 1), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.axis = 1.25, cex.lab = 1.5)

values  <- table(diffs)
plot(diffs, type = "n", xlim = c(-0.25, 0.25), 
     xlab = "simulated differences in proportions", 
     ylab = "", axes = FALSE, ylim = c(0, max(values)))
axis(1, at = seq(-0.25, 0.25, 0.05), 
     labels = c(-0.25, NA,-0.15, NA,-0.05, NA, 0.05, NA, 0.15, NA, 0.25))
for(i in 1:length(diffs)){
  x   <- diffs[i]
  rec <- sum(diffs == x)
  points(rep(x, rec), 1:rec, pch = 20, cex = 0.8, col = COL[1])
}

dev.off()