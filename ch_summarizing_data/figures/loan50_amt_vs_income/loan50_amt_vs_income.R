library(openintro)
data(loan50)
data(COL)

d <- loan50

myPDF("loan50_amt_vs_income.pdf",
      6, 3.5,
      mar = c(3.4, 4.1, 0.5, 0.5),
      mgp = c(2.1, 0.5, 0),
      xaxs = "i", yaxs = "i")
x <- d$total_income
y <- d$loan_amount
plot(x, y, type = "n",
     xlim = c(0, 1.05 * max(x)),
     ylim = c(0, 1.05 * max(y)),
     xlab = "Total Income",
     ylab = "",
     axes = FALSE)
abline(h = pretty(c(0, y)), v = pretty(c(0, x)), col = COL[7, 3])
points(x, y, pch = 19, col = COL[1, 2])
AxisInDollars(1, pretty(c(0, x)))
AxisInDollars(2, pretty(c(0, y)))
mtext("Loan Amount", 2, 3, las = 0)

x. <- seq(min(x), max(x), length.out = 300)
m <- lm(y ~ log(x))
y. <- predict(m, newdata = data.frame(x = x.))
# lines(x., y., lty = 2, col = COL[5, 3])
dev.off()

# library(ggplot2); qplot(x, y, geom = c("point", "smooth"))
