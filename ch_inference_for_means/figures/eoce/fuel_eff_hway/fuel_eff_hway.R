# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------
fuel_eff <- read.csv("fuel_eff.csv")

# select a small sample ---------------------------------------------
man_rows <- which(fuel_eff$transmission == "M")
aut_rows <- which(fuel_eff$transmission == "A")

set.seed(3583)
man_rows_samp <- sample(man_rows, 26)
aut_rows_samp <- sample(aut_rows, 26)

fuel_eff_samp <- fuel_eff[c(man_rows_samp,aut_rows_samp), ]
fuel_eff_samp$transmission <- droplevels(fuel_eff_samp$transmission)

levels(fuel_eff_samp$transmission) <- c("automatic", "manual")

# plot --------------------------------------------------------------
myPDF("fuel_eff_hway_box.pdf", 3.5, mar = c(3.7,2,0.3,1), mgp = c(2.5,0.55,0))
boxPlot(fuel_eff_samp$hwy_mpg, fact = fuel_eff_samp$transmission, ylim = c(10, 37), 
        xlab = "Hwy MPG", axes = FALSE, xlim = c(0.5, 2.5),
        lcol = COL[1], lwd = 1.5, medianLwd = 2.5)
axis(1, at = c(1,2), labels = c("automatic","manual"))
axis(2, at = c(15,25,35))
dev.off()