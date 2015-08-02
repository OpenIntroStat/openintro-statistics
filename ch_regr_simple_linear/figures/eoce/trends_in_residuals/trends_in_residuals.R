# load packages -----------------------------------------------------
library(openintro)

# simulate data -----------------------------------------------------

set.seed(8313)

x = seq(1:300)
y_fan = rep(NA,300)
for(i in 1:300){
	y_fan[i] = x[i]+rnorm(1)*x[i]
}
y_log = log(x) + rnorm(300, mean = 0, s = 0.5)

# fit models --------------------------------------------------------

m_fan = lm(y_fan ~ x)
m_log = lm(y_log ~ x)

# plot fan residuals ------------------------------------------------

pdf("trends_in_residuals_fan.pdf", 5.5, 2)

par(mar = c(2,1,1,1), las = 1, mgp = c(0.9,0.7,0), 
    cex.lab = 1.75, cex.axis = 1.75)

plot(m_fan$res ~ x, xlab = "(a)", ylab = "", 
     yaxt = "n", xaxt = "n", 
     pch = 19, col = COL[1])

abline(h = 0, lty = 2, lwd = 2)

dev.off()

# plot log residuals ------------------------------------------------

pdf("trends_in_residuals_log.pdf", 5.5, 2)

par(mar = c(2,1,1,1), las = 1, mgp = c(0.9,0.7,0), 
    cex.lab = 1.75, cex.axis = 1.75)

plot(m_log$res ~ x, xlab = "(b)", ylab = "", 
     yaxt = "n", xaxt = "n", 
     pch = 19, col = COL[1])

abline(h = 0, lty = 2, lwd = 2)

dev.off()