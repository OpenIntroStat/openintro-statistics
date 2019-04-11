library(openintro)
data(COL)

props <- c(0, 0.1, 0.2, 0.50, 0.8, 0.9)
samp.size.1 <- c(0, 10, 25)
samp.size.2 <- c(50, 100, 250)

plot.width <- 7
plot.height <- 10


SetupLayout <- function(show) {
  myMat <- rbind(matrix(1:18, nrow = 6, ncol = 3, byrow = TRUE))
  if (show) {
    myW <- c(0.5, rep(1, 2))
  } else {
    myW <- rep(1, 3)
  }
  myH <- c(0.5, rep(1, 5))
  layout(myMat, myW, myH)
}

PlotSampDist <- function(n, p, main) {
  par(mar = mar)
  x <- seq(0, n)
  y <- dbinom(x, n, p)
  p.hat <- x / n
  width <- 0.2 / n
  plot(p.hat, y, type = "n", axes = FALSE,
      xlab = "", ylab = "")
  axis(1)
  rect(p.hat - width, 0, p.hat + width, y, border = COL[1], col = COL[1])
  abline(h = 0)
}

TextPlot <- function(text, cex = 2.5, vertical = FALSE) {
  plot(0:1, 0:1, axes = FALSE, type = "n", xlab = "", ylab = "")
  text(0.5, 0.5, text, cex = cex)
}

BuildGrid <- function(props, samp.size) {
  for (p in props) {
    for (n in samp.size) {
      par(mar = rep(0, 4))
      if (p == 0 && n == 0) {
        TextPlot("")
      } else if (p > 0 && n == 0) {
        TextPlot(paste("p =", p))
      } else if (p == 0 && n > 0) {
        TextPlot(paste("n =", n))
      } else {
        PlotSampDist(n, p)
      }
    }
  }
}


mar <- c(3.5, 1.5, 0.7, 1.5)

myPDF('clt_prop_grid_1.pdf', plot.width, plot.height,
    mgp = c(2.3, 0.6, 0),
    yaxs = "i",
    mfrow = c(5, 2))
SetupLayout(TRUE)
BuildGrid(props, samp.size.1)
dev.off()


myPDF('clt_prop_grid_2.pdf', plot.width, plot.height,
    mar = c(3.5, 3, 0.7, 0.2),
    mgp = c(2.3, 0.6, 0),
    yaxs = "i",
    mfrow = c(5, 2))
SetupLayout(FALSE)
BuildGrid(props, samp.size.2)
dev.off()
