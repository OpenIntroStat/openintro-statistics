# load openintro package for colors ---------------------------------
library(openintro)

# number of observations --------------------------------------------
nrow(county_complete) # n = 3142

# scatterplot of income vs. % with bachelor's degree ----------------
pdf("county_income_education_scatterplot.pdf", 5, 4)
par(mar = c(4, 4.6, 1, 1), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.axis = 1.25, cex.lab = 1.4)
plot(county_complete$per_capita_income_2010 ~ county_complete$bachelors_2010, 
    xlab = "Percent with Bachelor's Degree", 
    ylab = "", 
    pch = 20, col = COL[1,3], axes = FALSE, 
    xlim = c(0,80), ylim = c(0, 65) * 1000)
AxisInDollars(2, at = seq(0, 70, 20) * 1000)
AxisInPercent(1, at = seq(0, 80, 20))
par(las = 0)
mtext("Per Capita Income", 2, 3.4, cex = 1.4)
box()
dev.off()
