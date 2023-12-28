library(xtable)
library(openintro)

by(toy_anova$outcome, toy_anova$group, mean)


myPDF("toyANOVA.pdf",
      mar = c(1.7, 3.1, 0.5, 0.5),
      mgp = c(2, 0.5, 0))
plot(toy_anova$outcome,
     xlim = c(0.5, 6.5),
     type = "n",
     axes = FALSE,
     xlab = "",
     ylab = "Outcome")
rect(-100, -100,
     100, 100,
     col = COL[7,3])
abline(h = seq(-10, 10, 2), col = "#FFFFFF", lwd = 3)
abline(h = seq(-10, 10, 1), col = "#FFFFFF", lwd = 0.8)
these <- toy_anova$group %in% c("I", "II", "III")
dotPlot(toy_anova$outcome[these], toy_anova$group[these],
        vertical = TRUE,
        at = 1:3,
        add = TRUE,
        col = COL[1, 3],
        cex = 0.9, pch = 19)
dotPlot(toy_anova$outcome[!these], toy_anova$group[!these],
        vertical = TRUE,
        at = 1:3 + 3,
        add = TRUE,
        col = COL[4, 3],
        cex = 0.9,
        pch = 19)
abline(v = 3.5, col = COL[7], lwd = 5.5)
abline(v = 3.5, col = "#AAAAAA", lwd = 3)
abline(v = 3.5, col = "#333333", lwd = 0.8)
axis(2)
par(mgp = c(2, 0.45, 0.1))
axis(1, at = 1:3, c("I", "II", "III"))
axis(1, at = 4:6, c("IV", "V", "VI"))
box()
dev.off()

xtable(anova(lm(outcome ~ group, toy_anova[these, ])))
xtable(anova(lm(outcome ~ group, toy_anova[!these, ])))
