# load openintro package for colors ---------------------------------
library(openintro)

# number of observations --------------------------------------------
nrow(county_complete) # n = 3142

# scatterplot of income vs. % with bachelor's degree ----------------
pdf("county_income_education_scatterplot.pdf", 5.5, 4.3)
par(mar = c(4, 4.1, 1, 1), las = 1, mgp = c(2.9, 0.7, 0), 
    cex.axis = 1.5, cex.lab = 1.5)
plot(county_complete$per_capita_income_2010/1000 ~ county_complete$bachelors_2010, 
    xlab = "Percent with Bachelor's degree", 
    ylab = "Per capita income (in $1,000)", 
    pch = 20, col = COL[1,3], axes = FALSE, 
    xlim = c(3,72), ylim = c(5, 65))
axis(1, at = seq(10, 70, 10), labels = c(10, NA, 30, NA, 50, NA, 70))
axis(2, at = seq(10, 60, 10), labels = c(NA, 20, NA, 40, NA, 60))
box()
dev.off()
