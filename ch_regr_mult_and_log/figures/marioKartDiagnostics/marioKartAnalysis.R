library(xtable)
library(openintro)
data(COL)
data(marioKart)
toss <- which(marioKart$totalPr > 80)
keep <- c("totalPr",
          "cond",
          "stockPhoto",
          "duration",
          "wheels",
          "shipSp")
d <- marioKart[-toss, keep]
d$stockPhoto <- (d$stockPhoto == "yes") + 0
d$cond <- (d$cond == "new") + 0
thisOne <- names(d) == "cond"
names(d)[thisOne] <- "condNew"
d$shipSp <- as.character(d$shipSp)
these <- d$shipSp %in%
         c("firstClass", "priority", "parcel", "media")
d$shipSp[these] <- "usps"
d$shipSp[grep("ups", d$shipSp)] <- "ups"
these <- d$shipSp %in% c("other", "standard")
d$shipSp[these] <- "unknown"
d$shipSp <- as.factor(d$shipSp)
d <- d[,-which(colnames(d) == "shipSp")]

summary(lm(totalPr ~ ., d))
summary(lm(totalPr ~ condNew +
                     stockPhoto +
                     duration +
                     wheels,
           data = d))
fit <- lm(totalPr ~ condNew + stockPhoto + wheels, data = d)
xtable(summary(fit))

e <- fit$res
f <- fit$fit

width <- 4.7
height <- 4


myPDF("mkDiagnosticNormalQuantilePlot.pdf", width, height,
      mgp = c(2.5,0.6,0))
qqnorm(e,
       ylab = "Residuals",
       main = "",
       col = COL[1,2],
       pch = 19)
dev.off()

myPDF("mkDiagResHist.pdf", width, 0.7 * height)
histPlot(e,
    breaks = 12,
    xlab = "Residuals",
    ylab = "Frequency",
    col = COL[1],
    axes = FALSE)
axis(1, pretty(e))
axis(2)
dev.off()


myPDF("mkDiagnosticInOrder.pdf", width, 0.8 * height,
      mgp = c(2.5, 0.6, 0))
plot(e,
     xlab = "Order of Collection",
     ylab = "Residuals",
     axes = FALSE)
axis(1)
AxisInDollars(2, c(-10, 0, 10))
rect(-10, -50, 200, 50,
     col = COL[7,3])
abline(h = seq(-50, 50, 10),
       col = "#FFFFFF",
       lwd = 3)
abline(h = seq(-50, 50, 5),
       col = "#FFFFFF",
       lwd = 1)
points(e, col = COL[1, 2], pch = 19)
box()
dev.off()

myPDF("mkDiagnosticEvsF.pdf", 0.9 * width, 0.9 * height,
      mgp = c(2.5, 0.6, 0))
plot(f, e,
     xlab = "Fitted Values",
     ylab = "Residuals",
     axes = FALSE)
AxisInDollars(1, seq(35, 65, 5))
AxisInDollars(2, seq(-10, 10, 10))
rect(-10, -50, 100, 50,
     col = COL[7, 3])
abline(h = seq(-50, 50, 10),
       col = "#FFFFFF",
       lwd = 3)
abline(h = seq(-50, 50, 5),
       col = "#FFFFFF",
       lwd = 1)
points(f, e,
       col = COL[1, 2],
       pch = 19)
box()
dev.off()

myPDF("mkDiagnosticEvsAbsF.pdf", width, 0.9 * height,
      mgp = c(2.5, 0.6, 0))
plot(f, abs(e),
     xlab = "Fitted Values",
     ylab = "Absolute Value of Residuals",
     axes = FALSE)
AxisInDollars(1, seq(35, 65, 5))
AxisInDollars(2, seq(-10, 10, 5))
rect(-10, -50, 100, 50,
     col = COL[7,3])
abline(h = seq(-50, 50, 10),
       col = "#FFFFFF",
       lwd = 3)
abline(h = seq(-50, 50, 5),
       col = "#FFFFFF",
       lwd = 1)
points(f, abs(e),
       col = COL[1, 2],
       pch = 19)
box()
dev.off()

myPDF("mkDiagnosticEvsVariables.pdf", width, 1.5 * height,
      mgp = c(2, 0.55, 0),
      mfrow = c(3, 1),
      mar = c(4.1, 3.1, 0.9, 0.5))
boxPlot(e, d$condNew,
        xlab = "Condition",
        ylab = "Residuals",
        axes = FALSE)
axis(1, at = 1:2, c("Used", "New"))
AxisInDollars(2, seq(-10, 10, 10))
rect(-10, -50, 100, 50,
     col = COL[7, 3])
abline(h = seq(-50, 50, 10),
       col = "#FFFFFF",
       lwd = 3)
abline(h = seq(-50, 50, 5),
       col = "#FFFFFF",
       lwd = 1)
boxPlot(e, d$condNew,
        add = 1:2,
        axes = FALSE)
dotPlot(e[d$condNew == 0],
        vertical = TRUE,
        at = 1.05,
        add = TRUE,
        col = COL[1, 2],
        pch = 19,
        cex = 0.7)
dotPlot(e[d$condNew == 1],
        vertical = TRUE,
        at = 2.05,
        add = TRUE,
        col = COL[1, 2],
        pch = 19,
        cex = 0.7)
box()

par(mar = c(3.8, 3.1, 1.2, 0.5))
boxPlot(e, d$stockPhoto,
        xlab = "Photo Type",
        ylab = "Residuals",
        axes = FALSE)
axis(1, at = 1:2, c("Unique Photo", "Stock Photo"))
AxisInDollars(2, seq(-10, 10, 10))
rect(-10, -50, 100, 50,
     col = COL[7, 3])
abline(h = seq(-50, 50, 10),
       col = "#FFFFFF",
       lwd = 3)
abline(h = seq(-50, 50, 5),
       col = "#FFFFFF",
       lwd = 1)
boxPlot(e, d$stockPhoto,
        add = 1:2,
        axes = FALSE)
dotPlot(e[d$stockPhoto == 0],
        vertical = TRUE,
        at = 1.05,
        add = TRUE,
        col = COL[1, 2],
        pch = 19,
        cex = 0.7)
dotPlot(e[d$stockPhoto == 1],
        vertical = TRUE,
        at = 2.05,
        add = TRUE,
        col = COL[1, 2],
        pch = 19,
        cex = 0.7)
box()

par(mar = c(3.1, 3.1, 1.2, 0.5))
plot(d$wheels, e,
     xlab = "Number of Wheels",
     ylab = "Residuals",
     axes = FALSE)
axis(1)
AxisInDollars(2, seq(-10, 10, 10))
rect(-10, -50, 100, 50,
     col = COL[7, 3])
abline(h = seq(-50, 50, 10),
       col = "#FFFFFF",
       lwd = 3)
abline(h = seq(-50, 50, 5),
       col = "#FFFFFF",
       lwd = 1)
points(d$wheels, e,
       col = COL[1, 2],
       pch = 19)
box()
dev.off()


fit <- lm(totalPr ~ condNew + wheels + I(wheels^2), d)
plot(fit)


fit1 <- lm(totalPr ~
           duration + condNew + stockPhoto + wheels,
           d)
fit2 <- lm(totalPr ~
           condNew + stockPhoto + wheels,
           d)
anova(fit1, fit2)

fit1 <- lm(totalPr ~ condNew + stockPhoto, d)
fit2 <- lm(totalPr ~ stockPhoto, d)
anova(fit1, fit2)



fit <- lm(totalPr ~
          condNew + stockPhoto + duration + wheels,
          d)
xtable(fit)
summary(fit)
fit <- lm(totalPr ~
          condNew + stockPhoto + wheels,
          d)
xtable(fit)
summary(fit)

# _____ Backward-Selection, Stage 1 _____ #
fit <- lm(totalPr ~
          stockPhoto + duration + wheels,
          d)
summary(fit)
fit <- lm(totalPr ~
          condNew + duration + wheels,
          d)
summary(fit)
fit <- lm(totalPr ~
          condNew + stockPhoto + wheels,
          d)
summary(fit)
fit <- lm(totalPr ~
          condNew + stockPhoto + duration,
          d)
summary(fit)

# _____ Backward-Selection, Stage 2 _____ #
fit <- lm(totalPr ~ stockPhoto + wheels, d)
summary(fit)$adj.r.squared
fit <- lm(totalPr ~ condNew + wheels, d)
summary(fit)$adj.r.squared
fit <- lm(totalPr ~ condNew + stockPhoto, d)
summary(fit)$adj.r.squared


# _____ Forward-Selection, Stage 1 _____ #
fit <- lm(totalPr ~ 1, d)
summary(fit)$adj.r.squared
fit <- lm(totalPr ~ condNew, d)
summary(fit)$adj.r.squared
fit <- lm(totalPr ~ stockPhoto, d)
summary(fit)$adj.r.squared
fit <- lm(totalPr ~ duration, d)
summary(fit)$adj.r.squared
fit <- lm(totalPr ~ wheels, d)
summary(fit)$adj.r.squared

# _____ Forward-Selection, Stage 2 _____ #
fit <- lm(totalPr ~ wheels, d)
summary(fit)$adj.r.squared
fit <- lm(totalPr ~ wheels + condNew, d)
summary(fit)$adj.r.squared
fit <- lm(totalPr ~ wheels + stockPhoto, d)
summary(fit)$adj.r.squared
fit <- lm(totalPr ~ wheels + duration, d)
summary(fit)$adj.r.squared

# _____ Forward-Selection, Stage 3 _____ #
fit <- lm(totalPr ~ wheels + condNew, d)
summary(fit)$adj.r.squared
fit <- lm(totalPr ~ wheels + condNew + stockPhoto, d)
summary(fit)$adj.r.squared
fit <- lm(totalPr ~ wheels + condNew + duration, d)
summary(fit)$adj.r.squared

# _____ Forward-Selection, Stage 4 _____ #
fit <- lm(totalPr ~ wheels + condNew + stockPhoto, d)
summary(fit)$adj.r.squared
fit <- lm(totalPr ~ wheels + condNew + stockPhoto + duration, d)
summary(fit)$adj.r.squared

