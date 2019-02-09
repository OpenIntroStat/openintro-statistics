library(openintro)
data(COL)

make.bar <- function(at,
                     height,
                     thickness = NA,
                     col = NA) {
  if(is.na(thickness)){
    R <- range(at)
    minDiff <- min(diff(at))
    thickness <- min(minDiff, diff(R) / 12)
  }
  x1 <- at - thickness / 2
  x2 <- at + thickness / 2
  if(is.na(col)) {
    col <- 'grey'
  }
  for (i in 1:length(at)) {
    rect(x1[i], 0,
         x2[i], height[i],
         col = col)
  }
}

probDist <- function(x,
                     prob,
                     labels1 = NA,
                     labels2 = NA,
                     thickness = NA,
                     col = NA,
                     ylim = NULL,
                     ...) {
  R <- range(x)
  R <- R + c(-1, 1) * diff(R)/20
  Ry <- c(0, range(prob)[2])
  if(!is.null(ylim)[1]){
    Ry <- ylim
  }
  plot(x, prob,
       type = 'n',
       axes = FALSE,
       xlim = R,
       ylim = Ry,
       ...)
  if (is.na(labels1)[1]) {
    labels1 <- x
  }
  if (is.na(labels2)[1]) {
    labels2 <- TRUE
  }
  axis(1, at = x, labels = paste0("$", labels1))
  make.bar(x, prob, thickness = thickness, col = col)
}

myPDF('bookCostDist.pdf', 5, 2.3)
at <- c(0, 137, 170)
prob <- c(0.2, .55, .25)

par(mar = c(2.9, 4, 0.1, 0.5),
    mgp = c(1.7, 0.7, 0))
probDist(at, prob,
         xlab = 'Cost',
         ylab = '',
         ylim = c(-0.02, 0.55),
         col = COL[1])
axis(2, at = seq(0, 0.4, 0.2))
lines(c(-10, 180), c(0,0))
polygon(117.85 + c(-17, 17, 0),
        c(-0.08, -0.08, 0),
        col = COL[4])
par(las = 0)
mtext('Probability', side = 2, line = 2.8)
dev.off()
