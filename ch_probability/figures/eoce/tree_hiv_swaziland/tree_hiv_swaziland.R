# load openintro for treeDiag function ------------------------------
library(openintro)

# tree --------------------------------------------------------------
pdf("tree_hiv_swaziland.pdf", width = 7, height = 2.5)
treeDiag(c("HIV?", "Result"), 
         c(0.259, 1-0.259), list(c(0.997, 0.003), c(1-0.926, 0.926)), 
         c("yes","no"), c("positive","negative"), 
         textwd=0.19, solwd=0.25, showWork=TRUE,
         col.main = COL[1])
dev.off()