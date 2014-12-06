library(openintro)
data(COL)
p  <- seq(0.0001, 0.9999, 0.0002)
lp <- log(p/(1-p))

pts  <- seq(0.01, 0.99, length.out = 25)
R    <- c(-6,6)
adj  <- 0.07
adj1 <- 0.02


myPDF("logitTransformationFigureHoriz.pdf", 7, 4,
      mar = c(3.3, 3.4, 0.8, 0.8),
      mgp = c(2.1, 0.55, 0))


plot(lp, p,
     xlab = expression(logit(p[i])),
     ylab = "",
     xlim = c(-5.8, 6.5),
     ylim = c(-0.05, 1.1),
     type = "n")
lines(lp, p,
      type = "l",
      col = COL[5],
      lwd = 1.5)
mtext(expression(p[i]), 2, 2.4)
abline(h = 0:1,
       lty = 2,
       col = COL[1],
       lwd = 1.5)
this <- which.min(abs(p - 0.2))
LP <- c(seq(6, -5, -1))
P <- exp(LP) / (1 + exp(LP))
POS <- c(3, 1, 3, 1, 2, 2, 2, 2, 4, 3, 1, 3)
xOFF <- c()
Round <- c(3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 3, 3)
for (i in 1:length(LP)) {
  points(LP[i], P[i], col = COL[4], lwd = 2)
  t1   <- format(round(c(LP, 0.9), Round[i]))[i]
  t2   <- format(round(P, Round[i]))[i]
  text(LP[i], P[i],
       paste0("(", t1, ", ", t2, ")"),
       cex = 0.6,
       pos = POS[i],
       col = COL[5])
  
}
dev.off()
