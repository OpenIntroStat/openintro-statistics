# load packages -----------------------------------------------------
library(openintro)

# simulate data -----------------------------------------------------

set.seed(9274)

x <- seq(-3, 4, 0.05)

y_s <-  -0.5 * x^3 + x^2 + x + rnorm(length(x), mean = 0, sd = 2)
y_hockey_stick <-  2 * x^4 + -0.5 * x^3 + x^2 + x + rnorm(length(x), mean = 0, sd = 30)
y_pos_lin_strong <- 3 * x + rnorm(length(x), mean = 0, sd = 2)
y_pos_weak <- 3 * x + rnorm(length(x), mean = 0, sd = 20)
y_pos_weaker <- -3 * x + rnorm(length(x), mean = 0, sd = 10) 
y_neg_lin_weak <- -3 * x + rnorm(length(x), mean = 0, sd = 5) 

# plot s-shaped -----------------------------------------------------

pdf("identify_relationships_s.pdf", 5.5, 4.3)

par(mar= c(2,1,1,1), las = 1, mgp = c(0.9,0.7,0), 
    cex.lab = 1.75, cex.axis = 1.75)

plot(y_s ~ x, xlab = "(a)", ylab = "",
     yaxt = "n", xaxt = "n", 
     pch = 19, col = COL[1])

dev.off()

# plot hockey stick -------------------------------------------------

pdf("identify_relationships_hockey_stick.pdf", 5.5, 4.3)

par(mar= c(2,1,1,1), las = 1, mgp = c(0.9,0.7,0), 
    cex.lab = 1.75, cex.axis = 1.75)

plot(y_hockey_stick ~ x, xlab = "(b)", ylab = "",
     yaxt = "n", xaxt = "n", 
     pch = 19, col = COL[1])

dev.off()

# plot linear positive strong ---------------------------------------

pdf("identify_relationships_pos_lin_strong.pdf", 5.5, 4.3)

par(mar= c(2,1,1,1), las = 1, mgp = c(0.9,0.7,0), 
    cex.lab = 1.75, cex.axis = 1.75)

plot(y_pos_lin_strong ~ x, xlab = "(c)", ylab = "",
     yaxt = "n", xaxt = "n", 
     pch = 19, col = COL[1])

dev.off()

# plot weak positive ------------------------------------------------

pdf("identify_relationships_pos_weak.pdf", 5.5, 4.3)

par(mar= c(2,1,1,1), las = 1, mgp = c(0.9,0.7,0), 
    cex.lab = 1.75, cex.axis = 1.75)

plot(y_pos_weak ~ x, xlab = "(d)", ylab = "",
     yaxt = "n", xaxt = "n", 
     pch = 19, col = COL[1])

dev.off()

# plot weaker positive ----------------------------------------------

pdf("identify_relationships_pos_weaker.pdf", 5.5, 4.3)

par(mar= c(2,1,1,1), las = 1, mgp = c(0.9,0.7,0), 
    cex.lab = 1.75, cex.axis = 1.75)

plot(y_pos_weaker ~ x, xlab = "(e)", ylab = "",
     yaxt = "n", xaxt = "n", 
     pch = 19, col = COL[1])

dev.off()

# plot negative linear ----------------------------------------------

pdf("identify_relationships_neg_lin_weak.pdf", 5.5, 4.3)

par(mar= c(2,1,1,1), las = 1, mgp = c(0.9,0.7,0), 
    cex.lab = 1.75, cex.axis = 1.75)

plot(y_neg_lin_weak ~ x, xlab = "(f)", ylab = "",
     yaxt = "n", xaxt = "n", 
     pch = 19, col = COL[1])

dev.off()