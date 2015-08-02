# load packages -----------------------------------------------------
library(openintro)

# simulate data -----------------------------------------------------

set.seed(1234)

x <- seq(0, 6, by = 0.05)

y_1_strong_neg_curved <-  -0.5 * x^2 + x + rnorm(length(x), mean = 0, sd = 2)
y_2_weak_pos <-  x + rnorm(length(x), mean = 0, sd = 3)
y_3_n <- -(x-3)^2 - 4 + rnorm(length(x), mean = 0, sd = 0.98)
y_4_weak_neg <- -3 * x + rnorm(length(x), mean = 0, sd = 10)

# calculate correlations --------------------------------------------
# note that these correlations are slightly off from
# those in the textbook due to not having set a seed 
# when the figures were produced (to be fixed for 4th edition)

round(cor(x, y_1_strong_neg_curved), 2)
round(cor(x, y_2_weak_pos), 2)
round(cor(x, y_3_n), 2)
round(cor(x, y_4_weak_neg), 2)

# plot strong negative curved ---------------------------------------

pdf("match_corr_1_strong_neg_curved.pdf", 5.5, 4.3)
par(mar = c(2,1,1,1), las = 1, mgp = c(0.9,0.7,0), cex.lab = 1.75)
plot(y_1_strong_neg_curved ~ x, xlab = "(1)", ylab = "", 
     yaxt = "n", xaxt = "n", 
     pch=19, col=COL[1])
dev.off()

# plot weak positive ------------------------------------------------

pdf("match_corr_2_weak_pos.pdf", 5.5, 4.3)
par(mar = c(2,1,1,1), las = 1, mgp = c(0.9,0.7,0), cex.lab = 1.75)
plot(y_2_weak_pos ~ x, xlab = "(2)", ylab = "", 
     yaxt = "n", xaxt = "n", 
     pch=19, col=COL[1])
dev.off()

# plot n-shaped -----------------------------------------------------

pdf("match_corr_3_n.pdf", 5.5, 4.3)
par(mar = c(2,1,1,1), las = 1, mgp = c(0.9,0.7,0), cex.lab = 1.75)
plot(y_3_n ~ x, xlab = "(3)", ylab = "", 
     yaxt = "n", xaxt = "n", 
     pch=19, col=COL[1])
dev.off()

# plot weak negative ------------------------------------------------

pdf("match_corr_4_weak_neg.pdf", 5.5, 4.3)
par(mar = c(2,1,1,1), las = 1, mgp = c(0.9,0.7,0), cex.lab = 1.75)
plot(y_4_weak_neg ~ x, xlab = "(4)", ylab = "", 
     yaxt = "n", xaxt = "n", 
     pch=19, col=COL[1])
dev.off()