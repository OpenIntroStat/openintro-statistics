library(openintro)
library(xtable)

d <- penetrating_oil

myPDF("torque_on_rusty_bolt_dot_plot.pdf", 7, 3.2,
    mar = c(3.5, 6.5, 0.1, 0.3),
    mgp = c(2.3, 0.55, 0))
dotPlot(d$torque, d$treatment,
    pch = 19, col = COL[1, 2], cex = 2,
    vertical = FALSE,
    xlab = paste(
        "Torque Required to Loosen Rusty Bolt,",
        "in Foot-Pounds"),
    ylab = "")
abline(h = 1:8, col = COL[5, 7])
dev.off()

m <- lm(torque ~ treatment, data = penetrating_oil)
anova(m)
xtable(anova(m))

xbar <- tapply(penetrating_oil$torque, penetrating_oil$treatment, mean)
n <- table(penetrating_oil$treatment)
stopifnot(all(names(xbar) == names(n)))
s <- summary(m)$sigma
df <- summary(m)$df[2]

p <- matrix("", length(n), length(n))
N <- length(n)
K <- N * (N - 1) / 2
for (i in 1:(N - 1)) {
  for (j in (i + 1):N) {
    diff <- xbar[i] - xbar[j]
    se <- s * sqrt(1 / n[i] + 1 / n[j])
    p[i, j] <- round(2 * pt(-abs(diff / se), df), 4)
  }
}
rownames(p) <-
    colnames(p) <-
    names(xbar)
xtable(p[1:7, 2:8])

