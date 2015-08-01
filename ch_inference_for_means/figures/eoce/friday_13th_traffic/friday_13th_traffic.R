# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------
data(friday)

# subset for accidents ----------------------------------------------
friday_tr <- friday[friday$type == "traffic",]

# qq plots of 6th vs. 13th vs. diff traffic -------------------------
pdf("friday_13th_traffic_qq.pdf", height = 2.5, width = 9)

par(mar = c(2, 6, 1.5, 1), las = 1, mgp = c(4.5, 0.7, 0), 
    mfrow = c(1,3), cex.axis = 1.5, cex.lab = 1.5, cex.main = 1.5)

qqnorm(friday_tr$sixth, col = COL[1], 
       pch = 19, main = "6th", axes = FALSE, xlab = "", ylab = "")
axis(2)
axis(1, at = c(-1,0,1))
box()
qqline(friday_tr$sixth, col = COL[1,2])
qqnorm(friday_tr$thirteenth, col = COL[1], 
       pch = 19, main = "13th", axes = FALSE, xlab = "", ylab = "")
axis(2)
axis(1, at = c(-1,0,1))
box()
qqline(friday_tr$thirteenth, col = COL[1,2])
qqnorm(friday_tr$sixth - friday_tr$thirteenth, col = COL[1], 
       pch = 19, main = "Diff.", axes = FALSE, xlab = "", ylab = "")
axis(2)
axis(1, at = c(-1,0,1))
box()
qqline((friday_tr$sixth - friday_tr$thirteenth), col = COL[1,2])

dev.off()

