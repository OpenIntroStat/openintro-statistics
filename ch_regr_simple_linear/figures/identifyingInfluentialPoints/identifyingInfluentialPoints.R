library(openintro)
data(COL)

myPDF('identifyingInfluentialPoints.pdf', 7, 2.73,
      mar = c(0.35, 0.654, 0.35, 0.654))
myMat <- rbind(matrix(1:6, 2))
myW <- rep(1, 3)
myH <- c(1, 0.45)
layout(myMat, myW, myH)
set.seed(1)

n <- c(95, 50, 78)
m <- c(-4, 12, 7)
xr <- list(2.16, -0.4, 1.42)
yr <- list(xr[[1]] * m[1], 1, 5.5)
ss <- list(1:(n[1] - 1), 1:(n[2] - 1), 1:(n[3] - 3))
for (i in 1:3) {
  x <- runif(n[i])
  y <- m[i] * x + rnorm(n[i])
  x <- c(x, xr[[i]])
  y <- c(y, yr[[i]])
  linResPlot(x, y,
             col = COL[1, 2],
             subset = ss[[i]],
             yR = ifelse(i == 1, 0.12, 0.44))
}
dev.off()
