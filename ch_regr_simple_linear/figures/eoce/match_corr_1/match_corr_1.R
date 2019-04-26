# load packages -----------------------------------------------------
library(openintro)

# simulate data -----------------------------------------------------

set.seed(1234)

x <- seq(0, 6, by = 0.05)

y_1_u <- (x-3)^2 - 4 + rnorm(length(x), mean = 0, sd = 1)
y_2_strong_pos <- 3*x + 10 + rnorm(length(x), mean = 0, sd = 2)
y_3_weak_pos <- 3*x + 10 + rnorm(length(x), mean = 0, sd = 10)
y_4_weak_neg <- -3 * x + rnorm(length(x), mean = 0, sd = 5)

# calculate correlations --------------------------------------------

round(cor(x, y_1_u), 2)
round(cor(x, y_2_strong_pos), 2)
round(cor(x, y_3_weak_pos), 2)
round(cor(x, y_4_weak_neg), 2)

# plot -----------------------------------------------------
width <- 4.5
height <- 3.7
cex.lab <- 2
mgp <- c(1.2,0.7,0)
mar <- c(2.6,1,0.5,1)
pch <- 19
cex <- 1.5
col <- COL[1, 2]

MyPlot <- function(fn, x, y, i) {
  myPDF(fn, width, height,
      mar = mar, mgp = mgp, cex.lab = cex.lab)
  plot(x, y,
      xlab = paste0("(", i, ")"), ylab = "", 
      yaxt = "n", xaxt = "n", 
      pch = pch, col = col, cex = cex)
  dev.off()
}
MyPlot("match_corr_1_u.pdf", x, y_1_u, 1)
MyPlot("match_corr_2_strong_pos.pdf", x, y_2_strong_pos, 2)
MyPlot("match_corr_3_weak_pos.pdf", x, y_3_weak_pos, 3)
MyPlot("match_corr_4_weak_neg.pdf", x, y_4_weak_neg, 4)
