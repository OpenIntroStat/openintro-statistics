require(openintro)
data(COL)
data(yrbss)

set.seed(5)
N     <- 100000
means <- rep(0, N)
pb <- txtProgressBar(0, N, style = 3)
for (i in 1:N) {
  tmp <- sample(nrow(yrbss), 200)
  tmp <- tmp[!is.na(tmp)][1:100]
  means[i] <- mean(yrbss$physically_active_7d[tmp], na.rm = TRUE)
  setTxtProgressBar(pb, i)
}

myPDF('yrbssActiveBigSampDist.pdf', 8, 3.15,
      mar = c(3.3, 4, 1.4, 1),
      mgp = c(2.7,0.55,0))
layout(matrix(1:2, 1),
       c(4.3, 3))
plot(0, 0,
     type = 'n',
     xlim = c(2.8, 5.1),
     ylim = c(0, 2000 * N / 25000),
     xlab = '',
     ylab = '',
     axes = FALSE)
mtext("Sample Mean", 1, 2)
mtext("Frequency", 2, line = 3, las = 0)
m <- mean(yrbss$physically_active_7d, na.rm = TRUE)
s <- sd(yrbss$physically_active_7d, na.rm = TRUE) / 10
rect(m - s / 100, 0,
     m + s / 100, 1350,
     col = '#00000044',
     border = '#00000000')
rect(m - s, 0,
     m + s, 135000,
     col = '#00000011',
     border = '#00000000')
rect(m - 2 * s, 0,
     m + 2 * s, 135000,
     col = '#00000011',
     border = '#00000000')
rect(m - 3 * s, 0,
     m + 3 * s, 135000,
     col = '#00000011',
     border = '#00000000')
histPlot(means,
         col = COL[1],
         breaks = seq(2, 6, length.out = 80),
         add = TRUE)
abline(h = 0)
axis(1, at = seq(3.0, 5, 0.5))
axis(2, at = seq(0, 8000, 2000))

par(las = 1, mar = c(4, 4, 1.4, 1))
q <- c(seq(0.00001, 0.0009, 0.00001),
       seq(0.001, 0.999, 0.0001),
       seq(0.9991, 0.99999, 0.00001))
ms <- quantile(means, q)
nq <- qnorm(q)
plot(nq, ms,
     xlab = "",
     ylab = 'Sample means',
     main = '',
     col = COL[1],
     axes = FALSE)
mtext("Theoretical quantiles", 1, 2)
axis(1)
axis(2, seq(3, 5, 0.5))
box()
dev.off()
