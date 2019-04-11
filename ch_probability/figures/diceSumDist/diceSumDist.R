library(openintro)
data(COL)

probDist <- function(x,
                     prob,
                     labels1 = NA,
                     labels2 = NA,
                     thickness = NA,
                     col = NA,
                     ylim = NULL,
                     ...) {
  R <- range(x)
  R <- R + c(-1,1)*(R[2]-R[1])/20
  Ry <- c(0, range(prob)[2])
  if (!is.null(ylim)[1]) {
    Ry <- ylim
  }
  plot(x, prob, type = 'n', axes = F, xlim = R, ylim = Ry, ...)
  if(is.na(labels1)[1]) labels1 <- x
  if(is.na(labels2)[1]) labels2 <- TRUE
  axis(1, at = x, labels = labels1)
  make.bar(x, prob, thickness = thickness, col = col)
}

make.bar <- function(at,
                     height,
                     thickness = NA,
                     col = NA) {
  if (is.na(thickness)) {
    R <- range(at)
    minDiff <- min(diff(at))
    thickness <- min(c(minDiff), (R[2]-R[1])/12)
  }
  x1 <- at - thickness/2
  x2 <- at + thickness/2
  if (is.na(col)) {
    col <- 'grey'
  }
  for (i in 1:length(at)) {
    rect(x1[i], 0, x2[i], height[i], col = col)
  }
}

at = 2:12
prob = c(1:6, 5:1)/36

myPDF('diceSumDist.pdf', 5.5, 3,
      mar = c(3.3, 4.5, 0.8, 1),
      mgp = c(2, 0.55, 0))
probDist(at, prob,
         xlab = 'Dice Sum',
         ylab = '',
         thickness = 0.5,
         col = COL[1])
abline(h = 0)
axis(2)
mtext('Probability', side = 2, 3.3, las = 0)
dev.off()
