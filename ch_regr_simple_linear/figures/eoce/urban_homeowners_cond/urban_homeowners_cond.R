# load packages -----------------------------------------------------
library(openintro)

# load packages -----------------------------------------------------
urban_state_data <- read.csv("urban_state_data.csv")

# drop outlier DC ---------------------------------------------------

urban_state_data_noDC <- urban_state_data[urban_state_data$state != "District of Columbia",]

# lmPlot of % urban vs. % owner without DC --------------------------

pdf("urban_homeowners_cond.pdf", 5.5, 6)

lmPlot(urban_state_data_noDC$poppct_urban, 
       urban_state_data_noDC$pct_owner_occupied, 
       col = COL[1,2], 
       xlab = "% Urban population", ylab = "% Who own home", 
       lCol = COL[2], lwd = 2, 
       resSymm = TRUE, 
       resAxis = 3, xAxis = 5, yAxis = 5, 
       cex.lab = 1.5, cex.axis = 1.5)

dev.off()