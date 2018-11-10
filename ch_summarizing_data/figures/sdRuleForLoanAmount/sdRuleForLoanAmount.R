library(openintro)
data(email50)
data(COL)
d <- loan50$loan_amount
mean(d)
sd(d)

myPDF("sdRuleForLoanAmount.pdf", 6.3, 1.5,
      mar = c(3.5, 1.3, 0, 1.3),
      mgp = c(2.2, 0.7, 0))
expr <- expression(paste("Loan Amount, ",
                         bar(x),
                         " = $17,083, ",
                         s[x],
                         " = $10,455"))
dotPlot(d,
        col = COL[1,2],
        pch = 20,
        cex = 2,
        xlim = range(d) + sd(d) / 2 * c(-1, 1),
        axes = FALSE,
        xlab = expr,
        type = 'n')
m <- round(mean(d), -2)
s <- round(sd(d), -2)
abline(v = m, col = COL[7])
col <- '#0000000D'
border <- '#00000000'
rect(m - s, -5, m + s, 5,
     col = col, border = border)
rect(m - 2 * s, -5, m + 2 * s, 5,
     col = col, border = border)
rect(m - 3 * s, -5, m + 3 * s, 5,
     col = col, border = border)
rect(m - 4 * s, -5, m + 4 * s, 5,
     col = col, border = border)
dotPlot(d,
        col = COL[1, 2],
        pch = 20,
        cex = 2,
        add = TRUE,
        axes = FALSE)
dotPlot(d,
        col = 1,
        pch = ".",
        add = TRUE,
        axes = FALSE)
AxisInDollars(1, m + s * (-7:7))
dev.off()

sum(d > m - s & d < m + s) / length(d)
sum(d > m - 2 * s & d < m + 2 * s) / length(d)
