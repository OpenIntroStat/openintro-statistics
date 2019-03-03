library(openintro)
data(COL)

n <- c(10:500, seq(510, 2000, 10), seq(2100, 10000, 100))
se <- sapply(n, function(x) sqrt(2 * 12^2 / x))
left.reject <- qt(0.025, n - 1) * se
x <- (left.reject - (-3)) / se
p <- pt(x, 2 * n - 2)

myPDF('power_curve_neg-3.pdf', 7, 3)
plot(n, p,
     xlab = "Sample Size Per Group",
     ylab = "Power",
     xlim = c(20, 5000),
     ylim = 0:1,
     type = "n",
     log = "x",
     axes = FALSE)
axis(1)
axis(2)
abline(h = 0:1, lty = 2, col = COL[6,2])
lines(n, p, col = COL[1], lwd = 3)
dev.off()


