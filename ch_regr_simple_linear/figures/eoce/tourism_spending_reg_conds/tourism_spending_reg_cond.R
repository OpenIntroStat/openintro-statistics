# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------

tourism_spending <- read.csv("tourism_spending.csv")

# model spending vs. count ------------------------------------------

m_spending_count <- lm(tourist_spending ~ visitor_count_thousand,
                       data = tourism_spending)

# plot spending vs. count -------------------------------------------

pdf("tourism_spending_count.pdf", 5.5, 4.3)

par(mar = c(3.5, 4, 1, 0.5), las = 0, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1.5, cex.axis = 1.5)

plot(tourist_spending ~ visitor_count_thousand,
     data = tourism_spending, 
     col = COL[1,2], 
     xlab = "Number of tourists (thousands)",
     ylab = "Spending (million $)", 
     pch = 19)

abline(m_spending_count, col = COL[2], lwd = 2)

dev.off()

# plot residuals ----------------------------------------------------

pdf("tourism_spending_count_residuals.pdf", 5.5, 4.3)

par(mar = c(3.5, 4, 1, 0.5), las = 0, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1.5, cex.axis = 1.5)

plot(m_spending_count$residuals ~ tourism_spending$visitor_count_thousand,
     xlab = "Number of tourists (thousands)", ylab = "Residuals", 
     col = COL[1,2], pch = 19,
     ylim = c(-1600, 1600), axes = FALSE)
axis(1)
axis(2, at = seq(-1000, 1000, 1000))
box()

abline(h = 0, lty = 2)

dev.off()

# histogram of residuals --------------------------------------------

pdf("tourism_spending_count_residuals_hist.pdf", 5.5, 4.3)

par(mar = c(3.5, 2.5, 0.5, 0.5), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1.5, cex.axis = 1.5)

hist(m_spending_count$residuals,
     col = COL[1], 
     xlab = "Residuals", ylab = "", main = "", 
     axes = FALSE, ylim = c(0,20))
axis(1, at = seq(-1500, 1500, 750))
axis(2, c(0, 10, 20))

dev.off()