library(openintro)
data(COL)

# _____ Simulate _____ #
set.seed(51)
n <- 10^5
x <- sample(0:1, n, TRUE, p = c(5 / 6, 1 / 6))
y <- cumsum(x) / 1:n
X <- c(1:100, seq(102, 500, 2),
	seq(510, 1500, 10), seq(1550, 10000, 50),
	seq(10100, 25000, 100), seq(25250, 100000, 250))
Y <- y[X]

# _____ Plotting _____ #
myPDF('dieProp.pdf', 6.5, 3,
      mar = c(3.8, 3.8, 0.5, 1))
plot(X, Y,
     log = 'x',
     type = 'l',
     xlab = '',
     ylab = '',
     axes = FALSE,
     col = COL[1],
     lwd = 2)
mtext('n (number of rolls)', side = 1, line = 2.5)
abline(h = 1 / 6, lty = 2)
at <- 10^(0:5)
labels <- c('1', '10', '100', '1,000', '10,000', '100,000')
axis(1, at, labels)
axis(2, at = seq(0, 0.3, 0.1))
axis(2, at = seq(0.05, 0.3, 0.1), labels = rep(NA, 3), tcl = -0.15)
at <- 1 / 6
labels <- expression(paste(hat(p)[n]))
axis(2, at, labels,
     line = 2.3,
     tick = FALSE,
     cex.axis = 1.1)
dev.off()
