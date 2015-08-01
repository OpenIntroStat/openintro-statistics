# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------
data(friday)

# subset for accidents ----------------------------------------------
friday_acc <- friday[friday$type == "accident",]

# side-by-side qq plots of 6th vs. 13th accidents ------------------

pdf("friday_13th_accident_qq.pdf", height = 2.5, width = 6)
par(mar = c(2, 5, 1.5, 1), las = 1, mgp = c(4.5, 0.7, 0), mfrow = c(1, 2))
qqnorm(friday_acc$sixth, col = COL[1], 
       pch = 19, main = "6th", axes = FALSE, xlab = "", ylab = "")
axis(2)
axis(1, at = c(-1,0,1))
box()
qqline(friday_acc$sixth, col = COL[1,2])

qqnorm(friday_acc$thirteenth, col = COL[1], 
       pch = 19, main = "13th", axes = FALSE, xlab = "", ylab = "")
axis(2)
axis(1, at = c(-1,0,1))
box()
qqline(friday_acc$thirteenth, col = COL[1,2])
dev.off()

# accident diff qq --------------------------------------------------
pdf("friday_13th_accident_diff_qq.pdf", height = 2.5, width = 3)
par(mar=c(2, 5, 1.5, 1), las = 1, mgp=c(4.5, 0.7, 0))
qqnorm(friday_acc$sixth - friday_acc$thirteenth, 
       col = COL[1], pch = 19, main = "Diff.", axes = FALSE, xlab = "", ylab = "")
axis(2)
axis(1, at = c(-1,0,1))
box()
qqline((friday_acc$sixth - friday_acc$thirteenth), col = COL[1,2])
dev.off()
