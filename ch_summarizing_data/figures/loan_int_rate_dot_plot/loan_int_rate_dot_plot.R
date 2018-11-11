library(openintro)

d <- loan50$interest_rate
xlim <- c(0.9 * min(d), 1.05 * max(d))

myPDF("loan_int_rate_dot_plot.pdf",
      5.5,
      1.25,
      mar = c(3.6, 1, 0, 1),
      mgp = c(2.5, 0.7, 0),
      tcl = -0.4)
dotPlot(d,
        at = 1.007,
        xlab = 'Interest Rate',
        ylab = '',
        pch = 20,
        col = COL[1, 3],
        cex = 3, # 1.5,
        xlim = xlim,
        ylim = c(0.95, 1.05),
        axes = FALSE)
abline(h = 0.983)
AxisInPercent(1, pretty(c(0, d)))
M <- mean(d)
polygon(M + c(-1, 1, 0) * 1,
        c(0.95, 0.95, 0.98),
        border = COL[4],
        col = COL[4])
dev.off()



set.seed(10)
myPDF("loan_int_rate_dot_plot_stacked.pdf",
      5.5,
      2.5,
      mar = c(3.6, 1, 0.5, 1),
      mgp = c(2.5, 0.7, 0))
round.to <- 1
binned <- round.to * round(d / round.to)
tab <- table(binned)
cex    <- 1
plot(0,
     type = "n",
     xlab = "Interest Rate, Rounded to Nearest Percent",
     ylab = "",
     axes = FALSE,
     xlim = xlim,
     ylim = c(-1, 1.5 * max(tab)))
for (i in 1:length(tab)) {
  points(rep(as.numeric(names(tab[i])), tab[i]),
         1.5 * (1:tab[i]) - 0.4,
         pch = 19,
         col = COL[1],
         cex = 2 * cex)
}
abline(h = 0)
AxisInPercent(1, pretty(c(0, d)))
polygon(M + c(-1, 1, 0) * 1,
        c(-1.2, -1.2, -0.1),
        border = COL[4],
        col = COL[4])
dev.off()

M
sd(d)
