library(openintro)
data(COL)

myPDF("normalTails.pdf", 4.3, 1,
      mar = c(0.81, 1, 0.3, 1),
      mgp = c(3, -0.2, 0),
      mfrow = c(1,2))
normTail(0, 1,
         -0.8,
         col = COL[1],
         axes = FALSE)
at <- c(-5, 0, 5)
labels <- c(-5, 'Negative Z', 5)
cex.axis <- 0.7
tick <- FALSE
axis(1, at, labels, cex.axis = cex.axis, tick = tick)
lines(c(0, 0),
      dnorm(0) * c(0.01, 0.99),
      col = COL[6],
      lty = 3,
      lwd = 1.5)

normTail(0, 1,
         0.8,
         col = COL[1],
         axes = FALSE)
labels <- c(-5, 'Positive Z', 5)
axis(1, at, labels, cex.axis = cex.axis, tick = tick)
lines(c(0, 0),
      dnorm(0) * c(0.01, 0.99),
      col = COL[6],
      lty = 3,
      lwd = 1.5)
dev.off()
