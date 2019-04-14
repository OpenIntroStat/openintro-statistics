# load openintro for treeDiag function ------------------------------
library(openintro)

# tree --------------------------------------------------------------
pdf("tree_drawing_box_plots.pdf", width = 6, height = 2.5)
treeDiag(c("\nCan construct\nbox plots?", "Passed?"), 
         c(0.80, 0.20), list(c(0.86, 0.14), c(0.65, 0.35)), 
         c("yes", "no"), textwd = 0.19, solwd = 0.25, showWork = TRUE,
         col.main = COL[1])
dev.off()