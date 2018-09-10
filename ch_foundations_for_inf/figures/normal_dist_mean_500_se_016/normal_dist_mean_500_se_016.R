require(openintro)
data(COL)

fn1 <- 'normal_dist_mean_500_se_016.pdf'
fn2 <- 'normal_dist_mean_500_se_016_with_upper.pdf'

GenerateGraph <- function(show.tails = FALSE) {
  normTail(0.5, 0.016, L = 0.37, U = 0.63, col = COL[1],
      xlim = c(0.32, 0.68), axes = FALSE)
  at <- c(-1, 0.37, 0.5, 0.63, 2)
  font.36 <- 1
  if (!show.tails) {
    at <- c(-1, 0.37, 0.5, 2)
    font.36 <- 2
  }
  axis(1, at, cex.axis = 0.9)
  if (show.tails) {
    lines(c(-1, 0.37), rep(0, 2), lwd = 5, col = COL[1])
    arrows(0.37, 7, 0.35, 1,
           length = 0.1,
           lwd = 2,
           col = COL[1])
    expr <- expression("Tail Area for "*hat(p))
    text(0.39, 7, expr, pos = 3, col = COL[1],
        font = font.36)
    lines(c(1, 0.63), rep(0, 2), lwd = 5, col = COL[1])
    arrows(0.63, 7, 0.65, 1,
           length = 0.1,
           lwd = 2,
           col = COL[1])
    expr <- expression("Equally unlikely if "*H[0]*" is true")
    text(0.61, 7, expr, pos = 3, col = COL[1], cex = 0.8)
  } else {
    arrows(0.38, 7, 0.371, 1,
           length = 0.1,
           lwd = 2,
           col = COL[1])
    expr <- expression("Observed "*hat(p)*" = 0.37")
    text(0.39, 7, expr, pos = 3, col = COL[1],
        font = font.36)
  }
}


myPDF(fn1, 5, 1.5,
      mar = c(1.55, 0, 0.1, 0),
      mgp = c(3, 0.5, 0))
GenerateGraph()
dev.off()

myPDF(fn2, 5, 1.5,
      mar = c(1.55, 0, 0.1, 0),
      mgp = c(3, 0.5, 0))
GenerateGraph(TRUE)
dev.off()
