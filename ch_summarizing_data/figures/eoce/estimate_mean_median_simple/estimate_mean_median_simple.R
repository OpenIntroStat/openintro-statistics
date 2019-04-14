# load packages -----------------------------------------------------
library(openintro)

# create data -------------------------------------------------------
set.seed(9823)
x <- 100 * rbeta(400, 12, 3)

# plot --------------------------------------------------------------
myPDF("estimate_mean_median_simple.pdf", 6, 2,
      mar = c(1.7, 2.2, 0.2, 0.4), cex = 1.1)
h <- hist(
    x,
    col = COL[1],
    xlab = "",
    ylab = "",
    main = "",
    axes = FALSE)
axis(1)
at <- pretty(par("yaxp")[1:2])
axis(2)
abline(h = at, col = COL[6, 2], lty = 2)
hist(x, col = COL[1, 2], add = TRUE)
dev.off()
