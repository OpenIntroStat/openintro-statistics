# load packages -----------------------------------------------------
library(openintro)

# simulate data -----------------------------------------------------

set.seed(83629)

x <- seq(1,50,1)

y <- -2 * x + 20 + rnorm(length(x), mean = 0, sd = 10)

x_influential <- c(x[1:49], 200)

y_leverage <- c(y[1:49], -370)

y_outlier <- c(y[1:25], y[26]+100, y[27:50])

# plot influential -------------------------------------------------

pdf("outliers_1_influential.pdf", width = 4, height = 3)

par(mar = c(2.4, 0.5, 0.2, 0.5), las = 1, mgp = c(1, 0.7, 0), cex.lab = 1.5)

plot(y ~ x_influential, 
     pch = 19, col = COL[1,2], 
     xlab = "(a)", ylab = "", 
     xaxt = "n", yaxt = "n")

m_influential = lm(y ~ x_influential)
abline(m_influential, col = COL[2])

dev.off()

# plot leverage ----------------------------------------------------

pdf("outliers_2_leverage.pdf", width = 4, height = 3)

par(mar = c(2.4, 0.5, 0.2, 0.5), las = 1, mgp = c(1, 0.7, 0), cex.lab = 1.5)

plot(y_leverage ~ x_influential, 
     pch = 19, col = COL[1,2], 
     xlab = "(b)", ylab = "", 
     xaxt = "n", yaxt = "n")

m_leverage = lm(y_leverage ~ x_influential)
abline(m_leverage, col = COL[2])

dev.off()

# plot outlier -----------------------------------------------------

pdf("outliers_3_outlier.pdf", width = 4, height = 3)

par(mar = c(2.4, 0.5, 0.2, 0.5), las = 1, mgp = c(1, 0.7, 0), cex.lab = 1.5)

plot(y_outlier ~ x, 
     pch = 19, col = COL[1,2], 
     xlab = "(c)", ylab = "", 
     xaxt = "n", yaxt = "n")

m_outlier = lm(y_outlier ~ x)
abline(m_outlier, col = COL[2])

dev.off()