library(openintro)
data(COL)

pdf('outlierPlots.pdf', 7, 7)
myMat <- rbind(matrix(1:6, 2),
               matrix(7:12, 2))
myW <- rep(1, 3)
myH <- c(0.95, 0.5, 1, 0.45)
layout(myMat, myW, myH)
set.seed(1)

n <- c(50, 25, 78, 55, 70, 150)
m <- c(12, -4, 7, -19, 0, 40)
xr <- list(0.3, 2, 1.42,
           runif(4, 1.45, 1.55),
           5.78, -0.6)
yr <- list(-4, -8, 19,
           c(-17, -20, -21, -19),
           12, -23.2)
for(i in 1:6){
  par(mar = c(0.25, 0.5, 1.75, 0.5))
  x <- runif(n[i])
  y <- m[i] * x + rnorm(n[i])
  x <- c(x, xr[[i]])
  y <- c(y, yr[[i]])
  yR <- c(rep(0.13, 3), 0.5, 0.1, 0.1)
  linResPlot(x, y,
             col = COL[1, 2],
             marRes = c(ifelse(i < 4, 4, 1), 2, 1, 2) / 4,
             yR = yR[i],
             main = paste0("(", i, ")"))
}
dev.off()
