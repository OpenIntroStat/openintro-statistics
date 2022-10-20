rm(list = ls())
library(openintro)

tourism$visitor_count <- 1e3 * tourism$visitor_count_tho
tourism$tourist_spending <- 1e6 * tourism$tourist_spending

m_spending_count <- lm(tourist_spending ~ visitor_count,
                       data = tourism)


# plot spending vs. count -------------------------------------------

myPDF(
  "tourism_spending_count.pdf",
  5.5, 4.3,
  mar = c(3.5, 5.5, 1, 0.5),
  mgp = c(2.5, 0.7, 0), 
  cex.lab = 1.5,
  cex.axis = 1.5
)

plot(tourist_spending ~ visitor_count,
     data = tourism, 
     col = COL[1,2], 
     xlab = "Number of Tourists",
     ylab = "",
     pch = 19,
     axes = FALSE)
at <- seq(0, 25e6, 5e6)
axis(1, at = at, labels = paste0(at / 1e6, "m"))
AxisInDollars(2, at = seq(0, 15e9, 5e9))
par(las = 0)
mtext("Spending", 2, 4.2, cex = 1.5)

abline(m_spending_count, col = COL[2], lwd = 2)

dev.off()

# plot residuals ----------------------------------------------------

myPDF(
  "tourism_spending_count_residuals.pdf",
  5.5, 4.3,
  mar = c(3.5, 5.5, 1, 0.5),
  mgp = c(2.5, 0.7, 0), 
  cex.lab = 1.5,
  cex.axis = 1.5
)

plot(
  tourism$visitor_count,
  m_spending_count$residuals,
  xlab = "Number of Tourists",
  ylab = "Residuals", 
  col = COL[1,2], pch = 19,
  ylim = c(-1600e6, 1600e6), axes = FALSE
)
at <- seq(0, 25e6, 5e6)
axis(1, at = at, labels = paste0(at / 1e6, "m"))
axis(2, at = seq(-1e9, 1e9, 1e9), labels = c("-$1b", "$0", "$1b"))

abline(h = 0, lty = 2)

dev.off()

# histogram of residuals --------------------------------------------

myPDF(
  "tourism_spending_count_residuals_hist.pdf",
  5.5, 4.3,
  mar = c(3.7, 4, 1, 0.5),
  mgp = c(2.5, 0.7, 0), 
  cex.lab = 1.5,
  cex.axis = 1.5
)

hist(m_spending_count$residuals,
     col = COL[1], 
     xlab = "Residuals", ylab = "Count", main = "", 
     axes = FALSE, ylim = c(0,20))
axis(1, at = seq(-2e9, 2e9, 1e9), labels = c("-$2b", "-$1b", "$0", "$1b", "$2b"))
axis(2, c(0, 10, 20))
abline(h = 0)

dev.off()
