# load packages -----------------------------------------------------
library(openintro)

# simulate data -----------------------------------------------------

set.seed(1234)

x <- seq(0, 6, by = 0.05)

y_1_u <- (x-3)^2 - 4 + rnorm(length(x), mean = 0, sd = 1)
y_2_strong_pos <- 3*x + 10 + rnorm(length(x), mean = 0, sd = 2)
y_3_weak_pos <- 3*x + 10 + rnorm(length(x), mean = 0, sd = 10)
y_4_weak_neg <- -3 * x + rnorm(length(x), mean = 0, sd = 5)

# calculate correlations --------------------------------------------

round(cor(x, y_1_u), 2)
round(cor(x, y_2_strong_pos), 2)
round(cor(x, y_3_weak_pos), 2)
round(cor(x, y_4_weak_neg), 2)

# plot u-shaped -----------------------------------------------------

pdf("match_corr_1_u.pdf", 5.5, 4.3)
par(mar = c(2,1,1,1), las = 1, mgp = c(0.9,0.7,0), cex.lab = 1.75)
plot(y_1_u ~ x, xlab = "(1)", ylab = "", 
     yaxt = "n", xaxt = "n", 
     pch=19, col=COL[1])
dev.off()

# plot strong positive ----------------------------------------------

pdf("match_corr_2_strong_pos.pdf", 5.5, 4.3)
par(mar = c(2,1,1,1), las = 1, mgp = c(0.9,0.7,0), cex.lab = 1.75)
plot(y_2_strong_pos ~ x, xlab = "(2)", ylab = "", 
     yaxt = "n", xaxt = "n", 
     pch=19, col=COL[1])
dev.off()

# plot weak positive ------------------------------------------------

pdf("match_corr_3_weak_pos.pdf", 5.5, 4.3)
par(mar = c(2,1,1,1), las = 1, mgp = c(0.9,0.7,0), cex.lab = 1.75)
plot(y_3_weak_pos ~ x, xlab = "(3)", ylab = "", 
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