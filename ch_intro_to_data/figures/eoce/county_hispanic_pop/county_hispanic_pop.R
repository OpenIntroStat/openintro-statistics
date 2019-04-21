# load openintro package for colors ---------------------------------
library(openintro)

# load mapproj package for map functions ----------------------------
library(mapproj)

# load data ---------------------------------------------------------
data(countyComplete)

# histogram of hispanic % -------------------------------------------
pdf("county_hispanic_pop_hist.pdf", 7.5, 4)

par(mar = c(3.8, 3.5, 0.5, 0.5), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1.5, cex.axis = 1.5)
histPlot(countyComplete$hispanic, breaks = 25, 
         xlab = "Hispanic %", ylab = "", 
         col = COL[1])

dev.off()

# log of histogram of hispanic % ------------------------------------
pdf("county_hispanic_pop_log_hist.pdf", 7.5, 4)

par(mar = c(3.8, 3.5, 0.5, 0.5), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1.5, cex.axis = 1.5)
histPlot(log(countyComplete$hispanic), breaks = 25, 
         xlab = "log(% Hispanic)", ylab = "", 
         col = COL[1])

dev.off()

# source custom code for county maps --------------------------------
source("countyMap.R")

# map of travel to work time ----------------------------------------

pdf("county_hispanic_pop_map.pdf", 7.5, 4)

val <- countyComplete$hispanic
val[val >= 40] <- 40
countyMap(val, countyComplete$FIPS, "bg", gtlt=">")

dev.off()