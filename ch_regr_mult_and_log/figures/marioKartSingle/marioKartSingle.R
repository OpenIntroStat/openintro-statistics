library(xtable)
library(openintro)

toss <- which(marioKart$totalPr > 80)
keep <- c("totalPr",
          "cond",
          "stockPhoto",
          "duration",
          "wheels")
d <- marioKart[-toss, keep]
d$stockPhoto <- ifelse(d$stockPhoto == "yes", 1, 0)
d$cond <- ifelse(d$cond == "new", 1, 0)

myPDF("marioKartSingle.pdf", 4.5, 3.5,
      mar = c(3.7, 3.7, 0, 0.5),
      mgp = c(2.5,0.55,0))
plot(d$cond, d$totalPr,
     xlim = c(-0.15, 1.15),
     axes = FALSE,
     col = COL[1, 3],
     pch = 19,
     cex = 1.3,
     xlab = "",
     ylab = "Price")
AxisInDollars(2, at = seq(30, 70, 10))
par(mgp = c(2.5, 1.55, 0))
axis(1, at = 0:1, labels = c("0\n(used)", "1\n(new)"))
par(mgp = c(2.5, 0.55, 0))
mtext("Condition", 1, 2.6)
g <- lm(d$totalPr ~ d$cond)
abline(g, col = COL[5], lwd = 1.5)
dev.off()
