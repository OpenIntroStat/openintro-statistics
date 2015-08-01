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

pdf("association_plots.pdf", 5.5, 4.3)
par(mar = c(2.5, 0.5, 0.5, 0.5), las = 1, mgp = c(1, 0.5, 0), 
    cex.lab = 1.75, pch = 20, mfrow = c(2,2), 
    yaxt = "n", xaxt = "n")
plot(y_poslin ~ x,  xlab = "(1)", ylab = "", col = COL[1])
plot(y_none ~ x, xlab = "(2)", ylab = "", col = COL[1])
plot(y_poscur ~ x, xlab = "(3)", ylab = "", col = COL[1])
plot(y_neglin ~ x, xlab = "(4)", ylab = "", col = COL[1])
dev.off()