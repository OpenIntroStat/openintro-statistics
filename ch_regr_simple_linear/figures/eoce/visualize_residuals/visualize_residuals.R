# load packages -----------------------------------------------------
library(openintro)

# simulate data -----------------------------------------------------

x <- seq(1,100,1)

set.seed(84628)

y_linear <- 3 * x + 5 + rnorm(length(x), mean = 0, sd = 20)
y_fan_back <- 4*x + 5 + rnorm(length(x), mean = 0, sd = sort(x, decreasing = TRUE))

# fit models --------------------------------------------------------

m_linear = lm(y_linear ~ x)
m_fan_back = lm(y_fan_back ~ x)

# plot linear -------------------------------------------------------

pdf("visualize_residuals_linear.pdf", 5.5, 4.3)

par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0), cex.lab = 1.75, cex.axis = 1.75)

plot(y_linear ~ x, 
     xlab = "(a)", ylab = "", 
     yaxt = "n", xaxt = "n", 
     pch = 19, col = COL[1])

abline(m_linear, col = COL[2], lwd = 2)

dev.off()

# plot backwards fan shaped -----------------------------------------

pdf("visualize_residuals_fan_back.pdf", 5.5, 4.3)

par(mar=c(2,1,1,1), las=1, mgp=c(0.9,0.7,0), cex.lab = 1.75, cex.axis = 1.75)

plot(y_fan_back ~ x, 
     xlab = "(b)", ylab = "", 
     yaxt = "n", xaxt = "n", 
     pch = 19, col = COL[1])

abline(m_fan_back, col = COL[2], lwd = 2)

dev.off()