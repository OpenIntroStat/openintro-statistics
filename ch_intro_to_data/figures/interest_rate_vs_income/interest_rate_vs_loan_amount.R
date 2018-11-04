library(openintro)
data(loan50)
data(COL)

the.index <- 40

myPDF("interest_rate_vs_income.pdf", 6, 3.5,
      mar = c(3, 3.5, 0.5, 0.5),
      mgp = c(2.4, 0.5, 0))
x <- loan50$total_income
y <- loan50$interest_rate
plot(x, y, 
     pch = 20,
     cex = 1.5,
     col = COL[1, 3],
     xlim = c(0, max(x)),
     ylim = c(0, max(y)),
     xlab = "",
     ylab = "Interest Rate (%)",
     axes = FALSE)
AxisInDollars(1, pretty(c(0, x)))
AxisInPercent(2, pretty(c(0, y)))
box()
# points(x, y, pch = ".")
mtext("Total Income", 1, 1.9)
t1 <- x[the.index]
t2 <- y[the.index]
# lines(c(t1, t1), c(-1e4, t2), lty = 2, col = COL[4])
# lines(c(-1e4, t1), c(t2, t2), lty = 2, col = COL[4])
# points(t1, t2, col = COL[4])
dev.off()

summary(lm(y ~ x))

loan50[the.index, ]
