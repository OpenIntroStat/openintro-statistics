library(openintro)
data(COL)

p <- 0.35
x <- 1:100
y <- (1 - p)^(x - 1) * p
myPDF('geometricDist35.pdf', 6, 3.1,
      mar = c(2.6, 3.6, 0.5, 0.5),
      mgp = c(2.5, 0.34, 0))
plot(x, y,
     xlim = c(0.5, 14.5),
     type = 'n',
     axes = FALSE,
     xlab = '',
     ylab = 'Probability')
mtext('Number of Trials', line = 1.5, side = 1)
axis(1, at = seq(2, 14, 2))
par(mgp = c(2.25, 0.5, 0))
axis(2, seq(0, 0.3, 0.1))
for (i in 1:14) {
  rect(x[i] - 0.4, 0,
       x[i] + 0.4, y[i],
       col = COL[1])
}
abline(h = 0)
text(14.7, 0.003, '...', col = '#444444')
dev.off()
