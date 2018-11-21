library(openintro)

t <- c("cat", "xom")
s <- stocks_18[t]
apply(s, 2, mean)
apply(s, 2, sd)
apply(s, 2, var)
cor(s)
summary(lm(s))
ret <- 6000 * s$cat + 2000 * s$xom
# baselines <- c(cat = 65.39, goog = 742.60, xom = 72.33)
# dates <- stocks_18$date


myPDF("changeInLeonardsStockPortfolioFor36Months.pdf", 5, 2.15,
      mar = c(3.5, 0.5, 0.5, 0.5),
      mgp = c(2.3, 0.6, 0))
boxPlot(ret,
        main = "",
        xlab = "Monthly Returns Over 3 Years",
        ylab = "",
        horiz = TRUE,
        axes = FALSE,
        ylim = c(0.6, 1.4))
points(ret,
       rep(0.9, 36),
       col = COL[1, 3],
       pch = 19)
buildAxis(1, ret, 2, 4)
dev.off()
