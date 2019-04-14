# load openintro for treeDiag function ------------------------------
library(openintro)

# tree --------------------------------------------------------------
pdf("tree_twins.pdf", width = 10, height = 3.5)
treeDiag(main = c("Type of twins","Gender"), 
         p1 = c(0.3, 0.7), p2 = list(c(0.5,0.5,0), c(0.25,0.25,0.5)), 
         out1 = c("identical","fraternal"), 
         out2 = c("males","females","male&female"), 
         showWork = TRUE, textwd=0.19, solwd=0.25,
         col.main = COL[1])
dev.off()