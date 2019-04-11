library(openintro)
data(COL)

set.seed(16)

RetrieveOffsets <- function(d, jitter = 0.1, num_buckets = 70) {
  cutoffs <- seq(0.9 * min(d), max(d), length.out = num_buckets)
  x <- rep(NA, length(d))
  for (i in 2:num_buckets) {
    these <- which(cutoffs[i - 1] < d & d <= cutoffs[i])
    lt <- length(these)
    if (lt == 0) {
      next
    }
    x[these] <- jitter * ((1:lt) - (lt + 1) / 2)
  }
  return(x)
}


p1 <- loan50$interest_rate
y1 <- 3 + RetrieveOffsets(p1)
p2 <- p1
p2[which.max(p2)] <- 15
y2 <- 2 + RetrieveOffsets(p2, num_buckets = 50)
p3 <- p1
p3[which.max(p1)] <- 35
y3 <- 1 + RetrieveOffsets(p3)
n1 <- length(p1)

myPDF("loan_int_rate_robust_ex.pdf",
      7.04,
      1.7,
      mar = c(2.45, 0, 0, 0),
      mgp = c(1.35, 0.25, 0),
      cex.lab = 0.85)

plot(p1, y1,
    xlab = 'Interest Rate',
    ylab = '',
    pch = 20,
    col = COL[1,3],
    xlim = c(1, max(p1, p2, p3)),
    ylim = c(0.6, 3.4),
    axes = FALSE)
points(max(p1), y1[which.max(p1)],
    col = COL[4])

at <- seq(5, 100, 5)
AxisInPercent(1, at, cex.axis = 0.8)
text(5, 3, 'Original', pos = 2, cex = 0.8)

# y2 <- rep(2, n1) + rnorm(n1, sd = jitter)
y2[p2 == 15] <- 2.15
points(p2, y2,
    pch = 20, col = COL[1, 3])
points(15, y2[p2 == 15],
    col = COL[4])
text(5, 2,
     '26.3% to 15%',
     pos = 2,
     cex = 0.8)

# y3 <- rep(1, n1) + rnorm(n1, sd = jitter)
points(p3, y3,
    pch = 20, col = COL[1, 3])
points(35, y3[p3 == 35],
    col = COL[4])
text(5, 1,
     '26.3% to 35%',
     pos = 2,
     cex = 0.8)

dev.off()


# _____ Summary Statistics _____ #
GetSummaries <- function(p) {
  temp <- round(quantile(p, c(0.25, 0.5, 0.75)), 3)
  hold <- temp[3] - temp[1]
  names(hold) <- NULL
  return(c(temp,
           IQR = hold,
           mean = mean(p),
           sd = sd(p)))
}
GetSummaries(p1)
GetSummaries(p2)
GetSummaries(p3)
