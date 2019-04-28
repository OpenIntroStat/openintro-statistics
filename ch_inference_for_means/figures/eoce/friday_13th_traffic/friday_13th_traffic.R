# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------
data(friday)

# subset for accidents ----------------------------------------------
friday_tr <- friday[friday$type == "traffic",]

# Hist of 6th vs. 13th vs. diff traffic -------------------------
H <- function(x, xlab) {
  tmp <- hist(x,
      col = COL[1],
      xlab = xlab,
      ylab = "",
      main = "",
      axes = FALSE)
  axis(1, at = pretty(tmp$breaks, n = 3))
  axis(2, at = seq(0, max(tmp$counts)))
  # rug(x)
  return(tmp)
}

myPDF("friday_13th_traffic_hist.pdf", 9, 2,
    mar = c(4, 2.5, 0.5, 2.5),
    mgp = c(2.9, 0.7, 0),
    mfrow = c(1,3),
    cex.lab = 1.25)
H(friday_tr$sixth, "Friday the 6th")
H(friday_tr$thirteenth, "Friday the 13th")
H(friday_tr$sixth - friday_tr$thirteenth, "Difference")
dev.off()

