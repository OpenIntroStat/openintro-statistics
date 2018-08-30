library(openintro)
data(COL)

myPDF('business_one_sided_20_21-p_value.pdf', 2.15, 0.95,
      mar = c(1.31, 0, 0.01, 0),
      mgp = c(3, 0.45, 0))
X <- seq(-4, 4, 0.01)
Y <- dnorm(X)
normTail(0.20, 0.01, U = 0.21, cex.axis = 0.8, axes = FALSE, col = COL[1])
at <- c(0.18, 0.20, 0.22)
axis(1, at, cex.axis = 0.8)
dev.off()
