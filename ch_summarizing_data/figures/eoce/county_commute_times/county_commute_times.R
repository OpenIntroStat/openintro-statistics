# load openintro package for colors ---------------------------------
library(openintro)

# load mapproj package for map functions ----------------------------
library(mapproj)

# load data ---------------------------------------------------------
data(countyComplete)

# histogram of travel to work time ----------------------------------
pdf("county_commute_times_hist.pdf", 7.5, 4)

par(mar = c(3.8, 3.5, 0.5, 0.5), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1.5, cex.axis = 1.5)
histPlot(county_complete$mean_work_travel_2010, breaks = 40, 
         xlab = "Mean work travel (in min)", ylab = "", 
         col = COL[1], axes = FALSE)
axis(1)
axis(2, at = seq(0, 200, 100))

dev.off()

# source custom code for county maps --------------------------------
source("countyMap.R")

# map of travel to work time ----------------------------------------

pdf("county_commute_times_map.pdf", 7.5, 4)

val <- county_complete$mean_work_travel_2010
val[val >= 33] <- 33
countyMap(val, county_complete$FIPS, "green", gtlt = ">")

dev.off()