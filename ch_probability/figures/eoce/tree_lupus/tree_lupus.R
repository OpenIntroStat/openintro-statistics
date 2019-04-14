# load openintro for treeDiag function ------------------------------
library(openintro)

# tree --------------------------------------------------------------
pdf("tree_lupus.pdf", width = 6, height = 3)
treeDiag(c("Lupus?", "Result"), 
         c(0.02, 0.98), list(c(0.98, 0.02), c(0.26, 0.74)), 
         c("yes","no"), c("positive","negative"), 
         textwd=0.19, solwd=0.25, showWork=TRUE,
         col.main = COL[1])
dev.off()