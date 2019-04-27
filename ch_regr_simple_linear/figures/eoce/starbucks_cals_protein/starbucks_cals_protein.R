# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------

starbucks <- read.csv("starbucks.csv")

# lmPlot protein vs. calories ---------------------------------------

myPDF("starbucks_cals_protein.pdf", 5, 4.55)

lmPlot(starbucks$calories, starbucks$protein,
       col = COL[1,2], 
       xlab = "Calories", ylab = "Protein (grams)", 
       lCol = COL[2], lwd = 2, 
       resSymm = TRUE, resAxis = 3, 
       xAxis = 6,
       cex.lab = 1.25, cex.axis = 1.25, mgp = c(2.1, 0.7, 0))

dev.off()