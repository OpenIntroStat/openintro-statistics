# load openintro package for colors ---------------------------------
library(openintro)

# data --------------------------------------------------------------
stats_scores = c(79, 83, 57, 82, 94, 83, 72, 74, 73, 71, 66, 89, 78, 
                 81, 78, 81, 88, 69, 77, 79)

# summary -----------------------------------------------------------
summary(stats_scores)

# scatterplot of gpa vs. study hours --------------------------------
pdf("stats_scores_boxplot.pdf", 5.5, 2)
par(mar = c(3, 0.5, 0.5, 0.5), las = 1, mgp = c(1.75, 0.7, 0), 
    cex.axis = 1.5, cex.lab = 1.5)
boxplot(stats_scores, horizontal = TRUE, col = COL[1], xlab = "Scores")
dev.off()