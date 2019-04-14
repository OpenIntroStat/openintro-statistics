# load openintro for treeDiag function ------------------------------
library(openintro)

# tree --------------------------------------------------------------
pdf("tree_exit_poll.pdf", width = 6, height = 3)
treeDiag(c("Support Walker", "College degree"), 
         c(0.53, 0.47), p2=list(c(0.37, 0.63), c(0.44, 0.56)), 
         cex.main=1.1, col.main = COL[1])
dev.off()