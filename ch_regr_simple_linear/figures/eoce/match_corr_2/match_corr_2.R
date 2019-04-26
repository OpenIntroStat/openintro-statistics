# load packages -----------------------------------------------------
library(openintro)

# simulate data -----------------------------------------------------

set.seed(1234)

x <- seq(0, 6, by = 0.05)

y_1_strong_neg_curved <-  -0.5 * x^2 + x + rnorm(length(x), mean = 0, sd = 2)
y_2_weak_pos <-  x + rnorm(length(x), mean = 0, sd = 3)
y_3_n <- -(x-3)^2 - 4 + rnorm(length(x), mean = 0, sd = 0.98)
y_4_weak_neg <- -3 * x + rnorm(length(x), mean = 0, sd = 10)

# calculate correlations --------------------------------------------
# note that these correlations are slightly off from
# those in the textbook due to not having set a seed 
# when the figures were produced (to be fixed for 4th edition)

round(cor(x, y_1_strong_neg_curved), 2)
round(cor(x, y_2_weak_pos), 2)
round(cor(x, y_3_n), 2)
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
MyPlot("match_corr_1_strong_neg_curved.pdf", x, y_1_strong_neg_curved, 1)
MyPlot("match_corr_2_weak_pos.pdf", x, y_2_weak_pos, 2)
MyPlot("match_corr_3_n.pdf", x, y_3_n, 3)
MyPlot("match_corr_4_weak_neg.pdf", x, y_4_weak_neg, 4)
