library(openintro)
data(COL)

at <- c(0, 137, 170)
wt <- c(0.2, 0.55, 0.25)

createWtSystem <- function(at, wt, size = 1, label = TRUE){
  R <- range(at)
  r <- diff(R)
  W <- range(wt)
  M <- weighted.mean(at, wt)
  par(mar = rep(0, 4))
  plot(R + c(-1, 1) * r / 12,
       0:1,
       type = 'n')

  # make hanger
  x <- c(M, M)
  y <- c(0.7, 1.0)
  lines(x, y)

  # make the board
  rect(R[1],0.685,R[2],0.7)

  # add weights
  for(i in 1:length(at)) {
    createWt(at[i],wt[i], size)
  }

  # label
  if(label){
    text(at, rep(0.74, length(at)), at)
    text(M, 0.64, M)
  }
}

createWt <- function(at, wt, size = 1){
  # hook
  x <- rep(at, 2)
  y <- c(0.64, 0.6925)
  lines(x, y)

  # the weight
  x <- x + c(-1, 1) * size
  y <- c(0.64, 0.64 - wt)
  rect(x[1], y[1],
       x[2], y[2],
       col = COL[1])
}

myPDF('bookWts.pdf', 5.5, 3)
createWtSystem(at, wt, 5, TRUE)
dev.off()
