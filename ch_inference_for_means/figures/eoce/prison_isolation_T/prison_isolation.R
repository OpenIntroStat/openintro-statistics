# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------
prison <- read.csv("prison_isolation.csv")

# calculate diffs ---------------------------------------------------

diff1 = prison$PreTrt1 - prison$PostTrt1
diff2 = prison$PreTrt2 - prison$PostTrt2
diff3 = prison$PreTrt3 - prison$PostTrt3

diff = c(diff1, diff2, diff3)
tr = c(rep("Tr 1", 14), rep("Tr 2", 14), rep("Tr 3", 14))

# hists ------------------------------------------
H <- function(x, xlab) {
  tmp <- hist(x,
      col = COL[1],
      xlab = xlab,
      ylab = "",
      main = "",
      axes = FALSE)
  axis(1, at = pretty(tmp$breaks, n = 3))
  axis(2, at = pretty(c(0, max(tmp$counts)), n = 3))
  # rug(x)
  return(tmp)
}

myPDF("prison_isolation_hist.pdf", 9, 2,
    mar = c(4, 2.5, 0.5, 2.5),
    mgp = c(2.9, 0.7, 0),
    mfrow = c(1,3),
    cex.lab = 1.25)
for (i in 1:3) {
  H(diff[tr == paste("Tr", i)], paste("Treatment", i))
}
dev.off()
