library(openintro)
data(email50)
data(COL)



myPDF("emailCharactersDotPlot.pdf",
      7.5,
      1.25,
      mar = c(3.6, 1, 0, 1),
      mgp = c(2.5, 0.7, 0),
      tcl = -0.4)
d <- email50$num_char
dotPlot(d,
        xlab = 'Number of Characters (in thousands)',
        ylab = '',
        pch = 20,
        col = COL[1, 2],
        cex = 1.5,
        ylim = c(0.95, 1.05),
        axes = FALSE)
axis(1, at = seq(0, 70, 10))
M <- mean(d)
polygon(M + c(-2, 2, 0) * 1.5,
        c(0.95, 0.95, 0.98),
        border = COL[4],
        col = COL[4])
dev.off()



set.seed(10)
myPDF("emailCharactersDotPlotStacked.pdf",
      5,
      2,
      mar = c(3.6, 1, 0.5, 1),
      mgp = c(2.5, 0.7, 0))
round.to <- 2
binned <- round.to * round(d / round.to)
tab <- table(binned)
cex    <- 1
plot(0,
     type = "n",
     xlab = paste("Number of Characters",
                  "(in thousands, with rounding)"),
     ylab = "",
     axes = FALSE,
     xlim = c(0, 75),
     ylim = c(-1, max(tab)))
for (i in 1:length(binned)) {
  points(rep(as.numeric(names(tab[i])), tab[i]),
         1:tab[i] - 0.4,
         pch = 19,
         col = COL[1],
         cex = cex)
}
abline(h = 0)
at <- seq(0, 70, 10)
axis(1, at)
polygon(M + c(-1.7, 1.7, 0) * 2.5,
        c(-1.7, -1.7, -0.1),
        border = COL[4],
        col = COL[4])
dev.off()

M
sd(d)
