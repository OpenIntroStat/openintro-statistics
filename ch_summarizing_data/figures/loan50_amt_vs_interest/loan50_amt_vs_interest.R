library(openintro)
data(loan50)
data(COL)

d <- loan50

myPDF("loan50_amt_vs_interest.pdf",
      6, 3.5,
      mar = c(3.4, 4.1, 0.5, 0.5),
      mgp = c(2.1, 0.5, 0),
      xaxs = "i", yaxs = "i")
x <- d$loan_amount
y <- d$interest_rate
plot(x, y,
     xlim = c(0, 1.05 * max(x)),
     ylim = c(0, 1.05 * max(y)),
     xlab = "Loan Amount",
     ylab = "",
     axes = FALSE,
     pch = 19,
     col = COL[1, 2])
AxisInDollars(1, pretty(c(0, x)))
AxisInPercent(2, pretty(c(0, y)))
mtext("Interest Rate", 2, 3, las = 0)
dev.off()

