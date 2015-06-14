library(openintro)
data(COL)

set.seed(5)
means <- c()
for (i in 1:1000) {
  these <- sample(nrow(yrbss), 100)
  means[i] <- mean(yrbss$physically_active_7d[these], na.rm = TRUE)
}

myPDF('yrbssActive1000SampDist.pdf', 6.5, 3.2,
      mar = c(3.5, 3.5, 0.7, 0.7),
      mgp = c(2.3, 0.6, 0))
plot(0, 0,
     type = 'n',
     xlim = c(3, 5),
     ylim = c(0, 80),
     xlab = 'Sample mean',
     ylab = 'Frequency',
     axes = FALSE)
m <- mean(yrbss$physically_active_7d, na.rm = TRUE)
s <- sd(yrbss$physically_active_7d, na.rm = TRUE) / 10
rect(m - s / 100, 0,
     m + s / 100, 1500,
     col = '#00000044',
     border = '#00000000')
rect(m - s, 0,
     m + s, 1500,
     col = '#00000011',
     border = '#00000000')
rect(m - 2 * s, 0,
     m + 2 * s, 1500,
     col = '#00000011',
     border = '#00000000')
rect(m - 3 * s, 0,
     m + 3 * s, 1500,
     col = '#00000011',
     border = '#00000000')
histPlot(means, col = COL[1], breaks = 25, add = TRUE)
abline(h = 0)
axis(1, at = seq(3, 5, 0.5))
at <- seq(3, 5, 0.1)
axis(1, at, rep("", length(at)), tcl = -0.1)
axis(2, at = seq(0, 100, 20))
dev.off()
