library(openintro)
data(COL)

d <- county$pop2017
mean(d, na.rm = TRUE)
median(d, na.rm = TRUE)

myPDF("county_pop_transformed_i.pdf",
      4,
      3,
      mar = c(3.4, 4, 0.5, 0.5),
      mgp = c(2.1, 0.5, 0))
hist(d,
     breaks = 25,
     main = "",
     xlab = "Population (m = millions)",
     ylab = "",
     axes = FALSE,
     col = COL[1])
axis(1, at = pretty(d), paste0(pretty(d / 1e6), "m"))
axis(2, seq(0, 3000, 500))
par(las = 0)
mtext("Frequency", 2, 2.9)
dev.off()

myPDF("county_pop_transformed_log.pdf",
      4,
      3,
      mar = c(3.4, 3.7, 0.5, 0.5),
      mgp = c(2.2, 0.5, 0))
expr <- expression(log[10]*"(Population)")
hist(log(d, 10),
     main = "",
     breaks = 15,
     xlab = expr,
     axes = FALSE,
     ylab = "",
     col = COL[1])
axis(1)
axis(2, seq(0, 1000, 500))
par(las = 0)
mtext("Frequency", 2, 2.6)
dev.off()
