# load openintro package for colors ---------------------------------
library(openintro)

# create data -------------------------------------------------------
conditions = c(rep("Prematurity", 33),
               rep("Neuromuscular", 10),
               rep("Cardiovascular", 16),
               rep("Genetic/metabolic", 6),
               rep("Respiratory", 13),
               rep("Trauma", 10),
               rep("Gastrointestinal", 2),
               rep("Immunocompromised", 2)
               )

# summary table -----------------------------------------------------
summary_table = sort(table(conditions))/sum(table(conditions))

# barplot -----------------------------------------------------------
pdf("antibiotic_use_children_bar.pdf", height = 3, width = 6)
par(mar = c(3.7, 11.3, 0, 0.5), las = 1, mgp = c(2.5, 1, 0),
    cex.lab = 1.25, cex.axis = 1.25)
barplot(summary_table, ylab = "", xlab = "Relative frequency", 
        col = COL[1], horiz = TRUE)
dev.off()

# pie chart ---------------------------------------------------------
pdf("antibiotic_use_children_pie.pdf", height = 3, width = 6)
par(mar=c(0, 2.8, 0, 6), las = 1)
pie(summary_table, 
    col = c(COL[1,1], COL[1,4], COL[2,1], COL[2,4], 
            COL[3,1], COL[3,4], COL[4,1], COL[4,4]), 
    cex = 1, clockwise = FALSE,
    labels = names(summary_table))
dev.off()
