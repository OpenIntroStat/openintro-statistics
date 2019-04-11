library(openintro)

pdf('outlierPlots.pdf', 7, 7)
myMat <- rbind(matrix(1:6, 2),
               matrix(7:12, 2))
myW <- rep(1, 3)
myH <- c(0.95, 0.5, 1, 0.45)
layout(myMat, myW, myH)

for(i in 1:6){
  par(mar = c(0.25, 0.5, 1.75, 0.5))
  these <- simulated_scatter$group == 23 + i
  x <- simulated_scatter$x[these]
  y <- simulated_scatter$y[these]
  yR <- c(rep(0.13, 3), 0.5, 0.1, 0.1)
  linResPlot(x, y,
             col = COL[1, 2],
             marRes = c(ifelse(i < 4, 4, 1), 2, 1, 2) / 4,
             yR = yR[i],
             main = paste0("(", i, ")"))
}
dev.off()

