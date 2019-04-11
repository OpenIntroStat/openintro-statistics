library(openintro)
library(splines)
library(dplyr)
a <- resume
d <- data.frame(
    callback = a$received_callback,
    job_city = a$job_city,
    college_degree = a$college_degree,
    years_experience = a$years_experience,
    honors = a$honors,
    military = a$military,
    email_address = a$has_email_address,
    race = a$race,
    gender = ifelse(a$gender == "m", "male", "female"))


m <- glm(callback ~
    job_city + college_degree + years_experience +
    honors + military + email_address +
    race + gender,
    data = d, family = binomial)
m <- glm(callback ~ job_city + years_experience + honors + race,
    data = d, family = binomial)
summary(m)
p  <- predict(m, type = "response")
p. <- p




set.seed(1)
myPDF("logisticModelPredict.pdf", 8, 3,
      mar = c(3.9, 6.5, 0.5, 0.5),
      mgp = c(2.4, 0.55, 0))
noise <- rnorm(nrow(d), sd = 0.08)
plot(p, d$callback + noise,
     xlim = 0:1,
     ylim = c(-0.5, 1.5),
     axes = FALSE,
     xlab = "Predicted Probability",
     ylab = "",
     col = fadeColor(COL[1], "22"),
     pch = 20)
axis(1)
axis(2,
     at = c(0,1),
     labels = c("0 (No Callback)", "1 (Callback)"))
dev.off()



ns1 <- 4
myPDF("logisticModelSpline.pdf", 7.7, 4.4,
      mar = c(3.9, 7, 0.5, 0.2),
      mgp = c(2.4, 0.55, 0))
plot(p, d$callback + noise / 5,
     type = "n",
     xlim = 0:1,
     ylim = c(-0.07, 1.07),
     axes = FALSE,
     xlab = "Predicted Probability",
     ylab = "")
par(las = 0)
mtext("Truth", 2, 5.5)
par(las = 1)
rect(0, 0, 1, 1,
     border = COL[6],
     col = "#00000000",
     lwd = 1.5)
lines(0:1, 0:1,
      lty = 2,
      col = COL[6],
      lwd = 1.5)
points(p, d$callback + noise / 5,
       col = fadeColor(COL[1], "18"),
       pch = 20)
axis(1)
at <- seq(0, 1, length.out = 6)
labels <- c("0 (No Callback)",
            "0.2  ",
            "0.4  ",
            "0.6  ",
            "0.8  ",
            "1 (Callback)")
axis(2, at, labels)
g1 <- lm(d$callback ~ ns(p, ns1))
p  <- seq(min(p), max(p), length.out = 100)
Y  <- predict(g1,
              data.frame(ns(p, ns1)),
              se.fit = TRUE)
yb <- Y$fit - 1.96 * Y$se.fit
yt <- rev(Y$fit + 1.96 * Y$se.fit)
polygon(c(p, rev(p)),
        c(yb, yt),
        col = COL[3, 3],
        border = "#00000000")
lines(p, Y$fit, lwd = 2.5)
arrows(0.15, 0.34,
       0.15, 0.22,
       length = 0.07)
text(0.15, 0.34,
     "Locally-estimated\nprobabilities with\nconfidence bounds",
     cex = 0.75, pos = 3)
arrows(0.4, 0.21,
       max(p) + 0.02, max(p) - 0.08,
       length = 0.07)
text(0.4, 0.19,
     paste("The bounds become wide\nbecause not much data",
           "are found this far right",
           sep = "\n"),
     cex = 0.75, pos = 4)
# arrows(0.83, 0.57,
#        0.8, 0.785,
#        length = 0.07)
text(0.42, 0.63,
     "The smoothed line\nshould fall close to the\ndashed line if the\nlogistic model\nis reasonable",
     cex = 0.75)
dev.off()




p <- p.
ns1 <- 4
myPDF("logisticModelBucketDiag.pdf", 7.7, 4.4,
    mar = c(3.9, 7, 0.5, 0.2),
    mgp = c(2.4, 0.55, 0))
plot(p, d$callback + noise / 5,
     type = "n",
     xlim = 0:1,
     ylim = c(-0.07, 1.07),
     axes = FALSE,
     xlab = "Predicted Probability",
     ylab = "")
par(las = 0)
mtext("Truth", 2, 5.5)
par(las = 1)
rect(0, 0, 1, 1,
     border = COL[6],
     col = "#00000000",
     lwd = 1.5)
lines(0:1, 0:1,
      lty = 2,
      col = COL[6],
      lwd = 1.5)
points(p, d$callback + noise / 5,
       col = fadeColor(COL[1], "18"),
       pch = 20)
axis(1)
at <- seq(0, 1, length.out = 6)
labels <- c("0 (No Callback)",
            "0.2  ",
            "0.4  ",
            "0.6  ",
            "0.8  ",
            "1 (Callback)")
axis(2, at, labels)
eps <- 1e-4
bucket_breaks <- quantile(p, seq(0, 1, 0.01))
bucket_breaks[1] <- bucket_breaks[1] - eps
n_buckets <- length(bucket_breaks) - 1
bucket_breaks[n_buckets] <- bucket_breaks[n_buckets] + 1e3 * eps
bucket_breaks. <- bucket_breaks
k <- 1
for (i in 1:n_buckets) {
  if (abs(bucket_breaks.[i] - bucket_breaks[k]) >= 0.01) {
    k <- k + 1
    bucket_breaks[k] <- bucket_breaks.[i]
  }
}
bucket_breaks <- bucket_breaks[1:k]

n_buckets <- length(bucket_breaks)
xp <- rep(NA, n_buckets)
yp <- rep(NA, n_buckets)
yp_lower <- rep(NA, n_buckets)
yp_upper <- rep(NA, n_buckets)
zs <- qnorm(0.975)
for (i in 1:n_buckets) {
  these <- bucket_breaks[i] < p & p <= bucket_breaks[i + 1]
  xp[i] <- mean(p[these])
  y <- d$callback[these]
  yp[i] <- mean(y)
  yp_lower[i] <- yp[i] - zs * sqrt(yp[i] * (1 - yp[i]) / length(y))
  yp_upper[i] <- yp[i] + zs * sqrt(yp[i] * (1 - yp[i]) / length(y))
}
points(xp, yp, pch = 19, cex = 0.7)
segments(xp, yp_lower, xp, yp_upper)
arrows(0.3, 0.17,
       0.24, 0.22,
       length = 0.07)
text(0.3, 0.15,
    paste("Observations are bucketed,",
        "then we compute the observed probability in each bucket (y)",
        "against the average predicted probability (x)",
        "for each of the buckets with 95% confidence intervals.",
        sep = "\n"),
    cex = 0.85, pos = 4)
dev.off()



# This plot is still a bit of a mess
ns2 <- 10
myPDF("logisticModelResidual.pdf", 8, 6,
      mar = c(4.9, 6, 5.5, 0.5),
      mgp = c(2.4, 0.55, 0),
      mfrow = 2:1)
noise <- rnorm(nrow(d), sd = 0.08)
p <- p.
res   <- d$callback - p
plot(d$years_experience, res,
     axes = FALSE,
     main = "THIS PLOT IS A BIT OF A MESS",
     xlab = "Time email was sent",
     ylab = "Residual",
     col = COL[1, 4],
     pch = 20)
TR  <- range(as.numeric(d$years_experience))
DR  <- diff(TR)
Mo  <- TR[1] + c(0, DR * 31, DR * 59, DR * 90) / 90
axis(1)
axis(2)
Time <- d$years_experience
g2   <- lm(res ~ ns(Time, ns2))
Time <- seq(TR[1], TR[2], length.out = 200)
Y    <- predict(g2, ns(Time, ns2), se.fit = TRUE)
abline(h = 0, lty = 2, col = "#00000088")
yb <- Y$fit - 1.96 * Y$se.fit
yt <- rev(Y$fit + 1.96 * Y$se.fit)
polygon(c(Time, rev(Time)),
        c(yb, yt),
        col = "#E0E317B5",
        border = "#00000000")
lines(Time, Y$fit, lwd = 1.75)

par(mar = c(3.9, 6, 1.5, 0.5))
noise <- rnorm(nrow(d), sd = 0.08)
res   <- d$callback - p
TR  <- range(as.numeric(d$years_experience))
plot(d$years_experience, res,
     axes = FALSE,
     xlab = "January",
     ylab = "Residual",
     col = "#22558855",
     pch = 20,
     xlim = c(TR[1], quantile(TR, 0.08)))
DR  <- diff(TR)
axis(1)
axis(2)
dev.off()
