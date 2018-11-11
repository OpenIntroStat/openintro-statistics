library(openintro)

d <- loan50$total_income


myPDF("total_income_dot_plot.pdf",
      5.5,
      1.25,
      mar = c(3.6, 1, 0, 1),
      mgp = c(2.5, 0.7, 0),
      tcl = -0.4)
dotPlot(d,
        at = 1.007,
        xlab = 'Loan Amount',
        ylab = '',
        pch = 20,
        col = COL[1, 3],
        cex = 2.25, # 1.5,
        xlim = c(0, 1.05 * max(d)),
        ylim = c(0.95, 1.05),
        axes = FALSE)
abline(h = 0.983)
AxisInDollars(1, pretty(c(0, d)))
M <- mean(d)
polygon(M + c(-1, 1, 0) * 15000,
        c(0.95, 0.95, 0.98),
        border = COL[4],
        col = COL[4])
dev.off()



set.seed(10)
myPDF("total_income_dot_plot_stacked.pdf",
      5.5,
      2.25,
      mar = c(3.6, 1, 0.5, 1),
      mgp = c(2.5, 0.7, 0))
round.to <- 10000
binned <- round.to * round(d / round.to)
tab <- table(binned)
cex    <- 1
plot(0,
     type = "n",
     xlab = "Loan Amount, Rounded to Nearest $1000",
     ylab = "",
     axes = FALSE,
     xlim = c(0, 1.05 * max(d)),
     ylim = c(-1, 1.5 * max(tab)))
for (i in 1:length(tab)) {
  points(rep(as.numeric(names(tab[i])), tab[i]),
         1.5 * (1:tab[i]) - 0.4,
         pch = 19,
         col = COL[1],
         cex = 1.5 * cex)
}
abline(h = 0)
AxisInDollars(1, pretty(c(0, d)))
polygon(M + c(-1, 1, 0) * 15000,
        c(-1.2, -1.2, -0.1),
        border = COL[4],
        col = COL[4])
dev.off()

M
sd(d)
