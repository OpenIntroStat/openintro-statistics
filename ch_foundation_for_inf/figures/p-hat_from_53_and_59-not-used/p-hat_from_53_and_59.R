library(openintro)
data(COL)

myPDF('p-hat_from_53_and_59.pdf', 2.15, 0.95,
      mar = c(1.31, 0, 0.01, 0),
      mgp = c(3, 0.45, 0))
X <- seq(-4, 4, 0.01)
Y <- dnorm(X)
normTail(0.56, 0.0156, M = c(0.53, 0.59), cex.axis = 0.8, axes = FALSE, col = COL[1])
at <- c(0.53, 0.56, 0.59)
axis(1, at, cex.axis = 0.8)
dev.off()
