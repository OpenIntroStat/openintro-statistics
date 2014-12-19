library(openintro)
data(COL)
set.seed(1)
tr <- rep(1:2, c(50, 40))
su <- c(rep(c("s", "d"), c(11, 39)),
        rep(c("s", "d"), c(14, 26)))

N <- 10^5
d <- rep(NA, N)
for (i in 1:N) {
  trf  <- sample(tr)
  p1   <- sum(su[trf == 1] == "s") / 50
  p2   <- sum(su[trf == 2] == "s") / 40
  d[i] <- p2 - p1
}
sum((d) > 0.1299) / N

a <- "pValueCPRStudySmallSampleAnalysisInSmallSampleSection.pdf"
myPDF(a, 6.75, 3.105,
      mar = c(2, 2.5, 0.5, 0.5))
hist(d,
     breaks = seq(-0.4, 0.4, 0.02),
     col = COL[7, 3],
     main = "",
     xlab = "Differences under the null hypothesis",
     ylab = "",
     axes = FALSE)
axis(1)
at <- (0:3) * N / 20
labels <- c(0, NA, NA, 3) / 20
axis(2, at, labels)
hist(d[d > 0.1299],
     breaks = seq(-0.4, 0.4, 0.02),
     col = COL[1],
     add = TRUE)
abline(h = 0)
lines(rep(0.13, 2),
      c(0, 3) * N / 25,
      lty = 3,
      lwd = 1.7)
text(0.13, 3 * N / 25, "0.13",
     pos = 3,
     cex = 0.7)
dev.off()
