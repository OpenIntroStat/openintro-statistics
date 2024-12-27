# load openintro package for colors ---------------------------------
library(openintro)

# load mapproj package for map functions ----------------------------
library(mapproj)

# load data ---------------------------------------------------------
data(county_complete)

# histogram of hispanic % -------------------------------------------
pdf("county_hispanic_pop_hist.pdf", 7.5, 4)

par(mar = c(3.8, 3.5, 0.5, 0.5), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1.5, cex.axis = 1.5)
histPlot(county_complete$hispanic_2010, breaks = 25, 
         xlab = "Percent Hispanic", ylab = "", 
         col = COL[1], axes = FALSE)
AxisInPercent(1, at = seq(0, 100, 20))
axis(2)

dev.off()

# log of histogram of hispanic % ------------------------------------
pdf("county_hispanic_pop_log_hist.pdf", 7.5, 4)

par(mar = c(3.8, 3.5, 0.5, 0.5), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1.5, cex.axis = 1.5)
histPlot(log(county_complete$hispanic_2010), breaks = 25, 
         xlab = "log(Percent Hispanic)", ylab = "", 
         col = COL[1])

dev.off()

# source custom code for county maps --------------------------------
source("countyMap.R")

# map of travel to work time ----------------------------------------

pdf("county_hispanic_pop_map.pdf", 7.5, 4)

val <- county_complete$hispanic_2010
val[val >= 40] <- 40
countyMap(val, county_complete$FIPS, "bg", gtlt=">")

dev.off()