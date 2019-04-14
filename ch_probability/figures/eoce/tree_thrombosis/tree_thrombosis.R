# load openintro for treeDiag function ------------------------------
library(openintro)

# tree --------------------------------------------------------------
pdf("tree_thrombosis.pdf", width = 6, height = 2.5)
treeDiag(c("Predisposition?", "Result"), 
         c(0.03, 0.97), list(c(0.99, 0.01), c(0.02, 0.98)), c("yes","no"), 
         c("positive","negative"), textwd=0.19, solwd=0.25, showWork=TRUE,
         col.main = COL[1])
dev.off()