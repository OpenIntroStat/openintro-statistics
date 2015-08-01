# load openintro package for colors ---------------------------------
library(openintro)

# load data ---------------------------------------------------------
load("gpa_study_hours.rda")
# this dataset will also be available in the openintro package
# with the same name

# number of observations --------------------------------------------
nrow(survey) # n = 193

# scatterplot of gpa vs. study hours --------------------------------
pdf("gpa_study_hours_scatterplot.pdf", 5.5, 4.3)
par(mar = c(4, 4.1, 1, 1), las = 1, mgp = c(2.9, 0.7, 0), 
    cex.axis = 1.5, cex.lab = 1.5)
set.seed(193) # for jitter below
plot(jitter(gpa_study_hours$gpa) ~ gpa_study_hours$study_hours, 
     xlab="Study hours/week", ylab = "GPA", 
     pch=20, col = COL[1,2], cex.lab = 1.5, axes = FALSE,
     ylim = c(2.5, 4.4))
axis(1, at = seq(0, 70, 20), cex.axis = 1.5)
axis(2, at = c(2.5, 3, 3.5, 4), cex.axis = 1.5)
box()
dev.off()