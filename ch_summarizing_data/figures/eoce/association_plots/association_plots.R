# load openintro package for colors ---------------------------------
library(openintro)

# set seed ----------------------------------------------------------
set.seed = 2306

# create x ----------------------------------------------------------
x = seq(0, 10, 0.1)

# create y_poslin: positive linear with x ---------------------------
y_poslin = x * runif(1, min = 0, max = 4) + 
  rnorm(length(x), mean = 0, sd = runif(1, min = 3, max = 4)) - 
  runif(1, min = 0, max = 3)

# create y_neglin: negative linear with x ---------------------------
y_neglin = x * -runif(1, min = 0, max = 4) + 
  rnorm(length(x), mean = 0, sd = runif(1, min = 3, max = 4)) - 
  runif(1, min = 0, max = 5)

# create y_poscur: curved positive with x ---------------------------
y_poscur = x^2 + rnorm(length(x), mean = 0, sd = runif(1, min = 3, max = 4))

# create y_none: no association with x ------------------------------
y_none = x + rnorm(length(x), mean = 0, sd = runif(1, min = 30, max = 40))

# plot the associations --------------------------------------------- 
Plot <- function(x, y, i) {
  plot(y ~ x,
      xlab = paste0("(", i, ")"),
      ylab = "",
      col = COL[1, 2],
      cex = 1.5)
}

pdf("association_plots.pdf", 10, 2.5)
par(mar = c(2.4, 0.5, 0.5, 0.5), las = 1, mgp = c(0.9, 0.5, 0), 
    cex.lab = 1.75, pch = 19, mfrow = c(1, 4), 
    yaxt = "n", xaxt = "n")
Plot(x, y_poslin, 1)
Plot(x, y_none, 2)
Plot(x, y_poscur, 3)
Plot(x, y_neglin, 4)
dev.off()