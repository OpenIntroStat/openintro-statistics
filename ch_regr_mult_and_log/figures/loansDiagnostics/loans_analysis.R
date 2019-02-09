library(xtable)
library(openintro)
d <- loans_full_schema
d$credit_util <- round(ifelse(d$total_credit_limit == 0, 0,
    d$total_credit_utilized / d$total_credit_limit), 4)
d$past_bankr <- (d$public_record_bankrupt > 0) + 0
d$ver_income <- ifelse(d$verified_income == "Verified", "verified",
    ifelse(d$verified_income == "Not Verified", "not", "source_only"))
d$credit_checks <- d$inquiries_last_12m
d$issued <- gsub("-", "", d$issue_month, fixed = TRUE)
these <- d$annual_income %in% 0:1
d$debt_to_income[these] <- d$total_credit_utilized[these] /
    d$annual_income_joint[these]
d$sqrt_debt_to_income <- sqrt(d$debt_to_income)
d$debt_to_income_50 <-
    ifelse(d$debt_to_income > 50, 50, d$debt_to_income)
keep <- c(
    "interest_rate",
    "ver_income",
    "debt_to_income",
    "sqrt_debt_to_income",
    "debt_to_income_50",
    "credit_util",
    "past_bankr",
    "term",
    # "issued",
    "credit_checks")
d <- d[keep]

F <- function(x, sub = 1:length(x)) {
  as.formula(paste("interest_rate ~", paste(x[sub], collapse = "+")))
}
summary(fit <- lm(F(keep[-c(1, 4, 5)]), d))
xtable(summary(fit))

e <- fit$res
f <- fit$fit

int_rate_at <- seq(-30, 30, 5)
IntRateAxis <- function(at) {
  AxisInPercent(2, at)
}
grid_lines_color <- COL[7, 3]
pt_col <- COL[1, 4]

myPDF("loansDiagNormalQuantilePlot.pdf", 4.5, 3.7,
    mgp = c(2.5,0.6,0))
qqnorm(e,
    ylab = "Residuals",
    main = "",
    col = COL[1,2],
    pch = 19)
dev.off()

myPDF("loansDiagNormalHistogram.pdf", 6, 3.7,
    mar = c(3.9, 4, 0.5, 0.5), mgp = c(2.5,0.6,0))
histPlot(e,
    xlab = "Residuals",
    ylab = "",
    col = COL[1],
    axes = FALSE)
AxisInPercent(1, pretty(e))
axis(2)
par(las = 0)
mtext("Frequency", 2, 2.9)
dev.off()

myPDF("ignore-loansDiagInOrder.pdf", 5.65, 3.9,
    mgp = c(2.5, 0.6, 0))
plot(e,
    xlab = "Order of collection",
    ylab = "Residuals",
    axes = FALSE,
    type = "n")
axis(1)
IntRateAxis(int_rate_at)
abline(h = int_rate_at, col = grid_lines_color, lwd = 1)
points(e, col = pt_col, pch = 19)
box()
dev.off()

myPDF("loansDiagEvsF.pdf", 5.65, 4.61,
    mgp = c(2.5, 0.6, 0))
plot(f, e,
    xlab = "Fitted values",
    ylab = "Residuals",
    axes = FALSE)
axis(1)
IntRateAxis(int_rate_at)
abline(h = int_rate_at, col = grid_lines_color, lwd = 1)
points(f, e, col = pt_col, pch = 19)
box()
dev.off()

myPDF("loansDiagEvsAbsF.pdf", 5.5, 3.7,
    mgp = c(2.5, 0.6, 0))
plot(f, abs(e),
    xlab = "Fitted Values",
    ylab = "Absolute Value of Residuals",
    axes = FALSE,
    type = "n")
axis(1)
IntRateAxis(int_rate_at)
abline(h = int_rate_at, col = grid_lines_color, lwd = 1)
points(f, abs(e), col = pt_col, pch = 19)
smooth <- loess(abs(e) ~ f)
o <- order(smooth$x)
lines(smooth$x[o], smooth$fitted[o],
    lwd = 2, col = COL[7,3])
lines(smooth$x[o], smooth$fitted[o],
    lwd = 2, lty = 2, col = COL[2])

box()
dev.off()


PlotCatVar <- function(x, xlab, key) {
  if (missing(key)) {
    key <- unique(d[[x]])
  }
  boxPlot(e, d[[x]],
      xlab = "",
      ylab = "Residuals",
      axes = FALSE,
      lcol = "#00000000",
      col = "#00000000",
      key = key)
  mtext(xlab, 1, line = 2)
  n_levels <- length(unique(d[[x]]))
  axis(1, at = 1:n_levels, key)
  IntRateAxis(int_rate_at)
  abline(h = int_rate_at, col = grid_lines_color, lwd = 1)
  boxPlot(e, d[[x]], add = 1:n_levels, axes = FALSE,
      lcol = COL[1], col = COL[1, 4])
  box()
}

PlotNumVar <- function(x, xlab) {
  plot(d[[x]], e,
      xlab = "",
      ylab = "Residuals",
      axes = FALSE,
      type = "n")
  mtext(xlab, 1, line = 2)
  axis(1)
  IntRateAxis(int_rate_at)
  abline(h = int_rate_at, v = pretty(d[[x]]),
      col = grid_lines_color, lwd = 1)
  points(d[[x]], e, col = pt_col, pch = 19)
  smooth <- loess(e ~ d[[x]])
  o <- order(smooth$x)
  # polygon(smooth$one.delta
  sx <- unique(smooth$x[o])
  sy <- smooth$fitted[o][match(sx, smooth$x[o])]
  lines(sx, sy, lwd = 2, col = COL[7,3])
  lines(sx, sy, lwd = 2, lty = 2, col = COL[2])
  box()
}


mgp <- c(2.5, 0.6, 0)
mar_left <- c(4.1, 3.8, 0.9, 2)
mar_right <- c(4.1, 5.6, 0.9, 0.4)
w <- 7.5
h <- 3.3
myPDF("loansDiagEvsVariables_1.pdf", w, h,
    mgp = mgp, mfrow = c(1, 2), mar = mar_left)
PlotCatVar("ver_income", "Verified Income")
par(mar = mar_right)
PlotNumVar("debt_to_income", "Debt to Income")
dev.off()
myPDF("loansDiagEvsVariables_2.pdf", w, h,
    mgp = mgp, mfrow = c(1, 2), mar = mar_left)
PlotNumVar("credit_util", "Credit Utilization")
par(mar = mar_right)
PlotCatVar("past_bankr", "Any Past Bankruptcy")
dev.off()
myPDF("loansDiagEvsVariables_3.pdf", w, h,
    mgp = mgp, mfrow = c(1, 2), mar = mar_left)
PlotCatVar("term", "Loan Term, in Months", c(36, 60))
par(mar = mar_right)
PlotNumVar("credit_checks", "Credit Checks in Last 12 Months")
dev.off()


myPDF("loansDebtToIncomeHist.pdf", 5, 2.7,
    mar = c(2.9, 4, 0.5, 0.5))
histPlot(d$debt_to_income, breaks = 30, col = COL[1],
    xlab = "", ylab = "Frequency")
mtext("Debt to Income", 1, 1.8)
dev.off()


# Diagnostics when Debt to Income is Transformed
myPDF("loansDiagEvsTransformDebtToIncome.pdf", w, h,
    mar = c(2.9, 4, 0.5, 0.5),
    mfrow = c(1, 2))

# Checking square root transformation
summary(fit <- lm(F(keep[-c(1, 3, 5)]), d))
e <- fit$res
f <- fit$fit
PlotNumVar("sqrt_debt_to_income", "SQRT(Debt to Income)")

# Checking truncation
summary(fit <- lm(F(keep[-c(1, 3, 4)]), d))
e <- fit$res
f <- fit$fit
PlotNumVar("debt_to_income_50", "Debt to Income, Truncated at 50")

dev.off()
