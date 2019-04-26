library(openintro)

set.seed(1)
n.plots <- 16

n <- 2 * round(runif(n.plots, 25, 75))
b0 <- runif(n.plots, -50, 50)
b1 <- runif(n.plots, -5, 5)
b2 <- runif(n.plots, -0.5, 0.5)
b3 <- runif(n.plots, -0.1, 0.1)
x <- lapply(1:n.plots, function(i) {
  c(runif(n[i] / 2, 0, 10), rnorm(n[i] / 2, 7, 2))
})
s <- runif(n.plots, 0.5, 20)
pow <- 2 * round(runif(n.plots, 0.5, 3) / 2, 1)
y <- lapply(1:n.plots, function(i) {
  noise <- rnorm(n[i], s[i])^pow[i]
  if (any(is.nan(noise))) {
    noise <- rnorm(n[i], s[i])
  }
  b0[i] + b1[i] * x[[i]] + b2[i] * x[[i]]^2 + b3[i] * x[[i]]^3 + noise
})
sapply(x, length)
sapply(y, length)
# par(mfrow = rep(sqrt(n.plots), 2))
tmp <- sapply(1:n.plots, function(i) {
  # plot(x[[i]], y[[i]])
  cor(x[[i]], y[[i]])
})




these <- c(3, 9, 11, 15)
tmp[these]

for (j in 1:length(these)) {
  i <- these[j]
  myPDF(paste0("scatter_", j, ".pdf"),
      4.5, 3.7,
      mar = c(2.6, 1, 0.5, 1),
      mgp = c(1.2, 0.7, 0),
      cex.lab = 2)
  plot(y[[i]] ~ x[[i]],
      xlab = paste0("(", j, ")"), ylab = "", 
      yaxt = "n", xaxt = "n", 
      pch = 19, col = COL[1, 2], cex = 1.5)
  dev.off()
}
