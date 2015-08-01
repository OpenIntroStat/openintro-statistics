# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------
prison <- read.csv("prison_isolation.csv")

# calculate diffs ---------------------------------------------------

diff1 = prison$PreTrt1 - prison$PostTrt1
diff2 = prison$PreTrt2 - prison$PostTrt2
diff3 = prison$PreTrt3 - prison$PostTrt3

diff = c(diff1, diff2, diff3)
tr = c(rep("Tr 1", 14), rep("Tr 2", 14), rep("Tr 3", 14))

# normal probability plots ------------------------------------------

pdf("prison_isolation_qq.pdf", height = 2.5, width = 9)

par(mar = c(2,6,1.5,1), las = 1, mgp = c(4.5,0.7,0), 
    mfrow = c(1,3), cex.axis = 1.5, cex.lab = 1.5, cex.main = 1.5)

qqnorm(diff[tr == "Tr 1"], col = COL[1], pch = 19, 
       main = "Tr 1", axes = FALSE, xlab = "", ylab = "")
axis(2)
axis(1, at = c(-1,0,1))
box()
qqline(diff[tr == "Tr 1"], col = COL[1])

qqnorm(diff[tr == "Tr 2"], col = COL[1], pch = 19, 
       main = "Tr 2", axes = FALSE, xlab = "", ylab = "")
axis(2)
axis(1, at = c(-1,0,1))
box()
qqline(diff[tr == "Tr 2"], col = COL[1])

qqnorm(diff[tr == "Tr 3"], col = COL[1], pch = 19, 
       main = "Tr 3", axes = FALSE, xlab = "", ylab = "")
axis(2)
axis(1, at = c(-1,0,1))
box()
qqline(diff[tr == "Tr 3"], col = COL[1])

dev.off()