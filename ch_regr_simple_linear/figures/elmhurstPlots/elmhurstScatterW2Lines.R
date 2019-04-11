library(openintro)
d <- elmhurst
d$gift_aid <- d$gift_aid * 1000
d$family_income <- d$family_income * 1000

g <- lm(d$gift_aid ~ d$family_income)
summary(g)

loss <- function(a, b, d) {
  p <- a + b * d$family_income
  sum(abs(d$gift_aid - p))
}
a      <- round(g$coef[1], 2) + seq(-500, 500, 1)
b      <- round(g$coef[2], 3) + seq(-0.01, 0.01, 0.0001)
mins   <- c(a[1], b[1])
theMin <- loss(a[1], b[1], d)
pb     <- txtProgressBar(1, length(a), style=3)
for (i in 1:length(a)) {
  for (j in 1:length(b)) {
    hold <- loss(a[i], b[j], d)
    if (hold < theMin) {
      mins <- c(a[i],b[j])
      theMin <- hold
    }
  }
  setTxtProgressBar(pb, i)
}

BuildElmhurtPlot <- function() {
  plot(d$family_income, d$gift_aid,
      col = COL[1, 2],
      pch = 19,
      xlab = 'Family Income',
      ylab = '', axes=FALSE,
      xlim = c(0, 280e3), 
      ylim = c(0, 35e3))
  AxisInDollars(1, at = (0:8) * 50e3)
  AxisInDollars(2, at = (0:3) * 10e3)
  box()
  par(las = 0)
  mtext("Gift Aid From University", 2, line = 3)
}

myPDF('elmhurstScatterW2Lines.pdf', 5.5, 3.3,
      mar = c(3.1, 4.1, 0.5, 0.5),
      mgp = c(2, 0.6, 0))
BuildElmhurtPlot()
abline(mins[1], mins[2], lty=2, lwd=2)
abline(g, lwd = 2)
dev.off()


myPDF('elmhurstScatterWLSROnly.pdf', 5.5, 3.3,
      mar = c(3.1, 4.1, 0.5, 0.5),
      mgp = c(2, 0.6, 0))
BuildElmhurtPlot()
abline(g, lwd = 2)
dev.off()
