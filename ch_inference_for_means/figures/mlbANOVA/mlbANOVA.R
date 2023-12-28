rm(list = ls())
library(xtable)
library(openintro)
library(dplyr)
d   <- subset(mlb_players_18, AB >= 100)
d   <- subset(d, !position %in% c("P", "DH"))
pos <- list(c("LF", "CF", "RF"), c("1B", "2B", "3B", "SS"), "DH", "C")
POS <- c("OF", "IF", "DH", "C")

for (i in 1:length(pos)) {
  these <- which(d$position %in% pos[[i]])
  cat(length(these), "\n")
  d$position[these] <- POS[i]
}
d <- select(d, name, team, position, AB, H, HR, RBI, AVG, OBP)
d <- d[order(d$name, d$team), ]
rownames(d) <- NULL
xtable(rbind.data.frame(head(d, 3), tail(d, 3)), digits = 3)


mod <- lm(OBP ~ position, data = d)
summary(mod)
anova(mod)
xtable(summary(mod))
xtable(anova(mod), digits = 4)


myPDF("mlbANOVABoxPlot.pdf", 5.4, 3,
      mar = c(2.8, 4, 0, 1))
key <- POS[c(1, 2, 4)]
boxPlot(d$OBP, d$position,
        xlab = "",
        ylab = "On-Base Percentage",
        axes = FALSE,
        pchCex = 1,
        key = key,
        col = COL[1, 3],
        lcol = COL[1])
mtext("Position", 1, 1.5)
axis(1, 1:3, key)
axis(2)
dev.off()


tab <- rbind(
    by(d$OBP, d$position, length),
    by(d$OBP, d$position, mean),
    by(d$OBP, d$position, sd))[, c("OF", "IF", "C")]
xtable(tab, digits = 3)


g <- rep(1:3, c(10, 1000, 1000))
x <- c()
for (i in 1:3) {
  n <- sum(g == i)
  x <- c(x, rnorm(n))
}
sum(by(x, g, length) * (by(x, g, mean) - mean(x))^2) / 2
anova(lm(x ~ as.factor(g)))


# uTeams <- unique(mlb_players_18$team)
# nTeams <- length(uTeams)
# myPDF("mlbANOVADiagIndepOfTeam.pdf", 5, 4)
# dotPlot(mod$res, mlbBat10$team,
        # key = uTeams,
        # ylim = c(0, nTeams),
        # axes = FALSE,
        # ylab = "Teams",
        # xlab = "Residuals",
        # col = COL[1])
# axis(1)
# axis(2, 1:nTeams, uTeams, cex.axis = 0.5)
# abline(h = 1:nTeams, col = COL[7], lwd = 0.5)
# abline(h = seq(1, nTeams, 5), col = COL[6], lwd = 1.5)
# dev.off()


myPDF("mlbANOVADiagNormality.pdf", 5, 4,
      mar = c(3.5, 4.4, 0.5, 0.5))
qqnorm(mod$res,
       main = "",
       xlab = "",
       ylab = "",
       pch = 20,
       cex = 0.7,
       col = COL[1,3])
mtext("Theoretical Quantiles", 1, 2.2)
par(las = 0)
mtext("Residuals", 2, line = 3.3)
dev.off()


myPDF("mlbANOVADiagNormalityGroups.pdf", 6, 1.7,
      mar = c(3.4, 3.4, 2, 0.5),
      mgp = c(2.2, 0.55, 0),
      mfrow = c(1, 3))
xlim <- range(d$OBP)
at <- pretty(xlim, 3)
breaks <- pretty(xlim, 15)
HistOfOBP <- function(x, main) {
  histPlot(x,
      main = main,
      xlim = xlim,
      breaks = breaks,
      xlab = "On-Base Percentage",
      ylab = "Frequency",
      col = COL[1],
      axes = FALSE)
  axis(1, at)
  axis(2)
}
HistOfOBP(d$OBP[d$position == "OF"], "Outfielders")
HistOfOBP(d$OBP[d$position == "IF"], "Infielders")
HistOfOBP(d$OBP[d$position == "C"], "Catchers")
dev.off()


myPDF("mlbANOVADiagConstantVar.pdf", 5, 4,
      mar = c(3.5, 4.4, 0.5, 0.5))
boxPlot(mod$res, d$position,
        main = "",
        xlab = "",
        ylab = "",
        pch = 20,
        cex = 0.7,
        col = COL[1, 3],
        lcol = COL[1])
mtext("Position", 1, 2.2)
par(las = 0)
mtext("Residuals", 2, line = 3.3)
dev.off()


anova(lm(OBP ~ team + position, d))
anova(lm(OBP ~ position + team, d))

