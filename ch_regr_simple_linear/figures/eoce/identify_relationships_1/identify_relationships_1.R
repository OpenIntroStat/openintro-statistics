# load packages -----------------------------------------------------
library(openintro)

# simulate data -----------------------------------------------------

set.seed(9274)

x1 <- seq(0, 6, by = 0.05)

y_u <- (x1-3)^2 - 4 + rnorm(length(x1), mean = 0, sd = 1)
y_lin_pos_strong <- 3*x1 + 10 + rnorm(length(x1), mean = 0, sd = 2)
y_lin_pos_weak <- 3*x1 + 10 + rnorm(length(x1), mean = 0, sd = 20)


x2 <- seq(-8, -2, by = 0.05)

y_n <- -1 * (x2 + 5)^2 + 1 + rnorm(length(x2), mean = 0, sd = 2)
y_lin_neg_strong <- -5 * x2 + 3 + rnorm(length(x2), mean = 0, sd = 2)
y_none <- rnorm(length(x2), mean = 0, sd = 1)

# plot u-shaped -----------------------------------------------------

pdf("identify_relationships_u.pdf", 5.5, 4.3)

par(mar= c(2,1,1,1), las = 1, mgp = c(0.9,0.7,0), 
    cex.lab = 1.75, cex.axis = 1.75)

plot(y_u ~ x1, xlab = "(a)", ylab = "",
     yaxt = "n", xaxt = "n", 
     pch = 19, col = COL[1])

dev.off()

# plot linear positive strong ---------------------------------------

pdf("identify_relationships_lin_pos_strong.pdf", 5.5, 4.3)

par(mar= c(2,1,1,1), las = 1, mgp = c(0.9,0.7,0), 
    cex.lab = 1.75, cex.axis = 1.75)

plot(y_lin_pos_strong ~ x1, xlab = "(b)", ylab = "",
     yaxt = "n", xaxt = "n", 
     pch = 19, col = COL[1])

dev.off()

# plot linear positive weak -----------------------------------------

pdf("identify_relationships_lin_pos_weak.pdf", 5.5, 4.3)

par(mar= c(2,1,1,1), las = 1, mgp = c(0.9,0.7,0), 
    cex.lab = 1.75, cex.axis = 1.75)

plot(y_lin_pos_weak ~ x1, xlab = "(c)", ylab = "",
     yaxt = "n", xaxt = "n", 
     pch = 19, col = COL[1])

dev.off()

# plot n-shaped -----------------------------------------------------

pdf("identify_relationships_n.pdf", 5.5, 4.3)

par(mar= c(2,1,1,1), las = 1, mgp = c(0.9,0.7,0), 
    cex.lab = 1.75, cex.axis = 1.75)

plot(y_n ~ x2, xlab = "(d)", ylab = "",
     yaxt = "n", xaxt = "n", 
     pch = 19, col = COL[1])

dev.off()

# plot n-shaped -----------------------------------------------------

pdf("identify_relationships_lin_neg_strong.pdf", 5.5, 4.3)

par(mar= c(2,1,1,1), las = 1, mgp = c(0.9,0.7,0), 
    cex.lab = 1.75, cex.axis = 1.75)

plot(y_lin_neg_strong ~ x2, xlab = "(e)", ylab = "",
     yaxt = "n", xaxt = "n", 
     pch = 19, col = COL[1])

dev.off()

# plot no relationship ----------------------------------------------

pdf("identify_relationships_none.pdf", 5.5, 4.3)

par(mar= c(2,1,1,1), las = 1, mgp = c(0.9,0.7,0), 
    cex.lab = 1.75, cex.axis = 1.75)

plot(y_none ~ x2, xlab = "(f)", ylab = "",
     yaxt = "n", xaxt = "n", 
     pch = 19, col = COL[1])

dev.off()