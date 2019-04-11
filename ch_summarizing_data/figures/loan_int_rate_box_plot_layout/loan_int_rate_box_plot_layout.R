require(openintro)
data(COL)
d <- loan50$interest_rate
the.seed <- 2

myPDF("loan_int_rate_box_plot_layout.pdf", 5.5, 3.8,
      mar = c(0, 4, 0, 1),
      mgp = c(2.8, 0.55, 0))
boxPlot(d,
        ylab = 'Interest Rate',
        xlim = c(0.3, 3),
        axes = FALSE,
        ylim = range(d) + sd(d) * c(-1,1) * 0.2)
AxisInPercent(2, c(0, pretty(d)))

arrows(2, min(d) + 1, 1.35, min(d), length = 0.08)
text(2, min(d) + 1, 'lower whisker', pos = 4)

arrows(2, quantile(d, 0.25) + sd(d) / 7,
       1.35, quantile(d, 0.25),
       length = 0.08)
text(2, quantile(d, 0.25) + sd(d)/6.5,
     expression(Q[1]~~'(first quartile)'), pos = 4)

m <- median(d)
arrows(2, m + sd(d) / 5, 1.35, m, length = 0.08)
text(2,m + sd(d) / 4.7, 'median', pos = 4)

q <- quantile(d, 0.75)
arrows(2, q + sd(d) / 4, 1.35, q, length = 0.08)
text(2, q + sd(d) / 3.8,
     expression(Q[3]~~'(third quartile)'), pos = 4)

arrows(2, rev(sort(d))[3] - sd(d) / 4,
       1.35, rev(sort(d))[3], length = 0.08)
text(2, rev(sort(d))[3] - sd(d) / 3.8,
     'upper whisker', pos = 4)

y <- quantile(d, 0.75) + 1.5 * IQR(d)
arrows(2, y - 0.1 * sd(d),
       1.35, y, length = 0.08)
lines(c(0.72, 1.28), rep(y, 2),
      lty = 3, col = '#00000066')
text(2, y - 0.1 * sd(d),
     'max whisker reach', pos = 4)

m <- rev(tail(sort(d), 5))
s <- m[1] - 0.3 * sd(m)
arrows(2, s, 1.1, m[1] - 0.2, length = 0.08)
arrows(2, s, 1.1, m[2] + 0.3, length = 0.08)
text(2, s, 'suspected outliers', pos = 4)

set.seed(the.seed)
pt.jitter <- 0.05
nco <- 50
cutoffs <- seq(0.9 * min(d), max(d), length.out = nco)
for (i in 2:nco) {
  these <- which(cutoffs[i - 1] < d & d <= cutoffs[i])
  lt <- length(these)
  if (lt == 0) {
    next
  }
  x <- pt.jitter * (1:lt)
  x <- x - mean(x)
  points(rep(0.4, lt) + x, d[these],
      col = rep(COL[1, 3], 25), pch = 19)
}

dev.off()

sort(d)[25:26]
quantile(d, c(0.25, 0.5, 0.75))
tail(sort(d), 4)


myPDF("loan_int_rate_box_plot_layout_small.pdf", 1.5, 2.5,
      mar = c(0, 4.1, 0, 0),
      mgp = c(2.3, 0.45, 0),
      tcl = -0.2)
boxPlot(d,
        ylab = '',
        axes = FALSE,
        xlim = c(0.5, 1.45),
        ylim = range(d) + sd(d) * c(-1,1) * 0.2)
AxisInPercent(2, c(0, pretty(d)), cex = 1.1)
par(las = 0)
mtext("Interest Rate", 2,
      line = 2.5,
      cex = 1.1)
dev.off()
