# load packages -----------------------------------------------------
library(openintro)

# subset for accidents ----------------------------------------------
friday_acc <- friday[friday$type == "accident",]

# Hist of 6th vs. 13th accidents ------------------
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

myPDF("friday_13th_accident_hist.pdf", 7, 1.9 * 7.5 / 9,
    mar = c(3.2, 2.5, 0.5, 2.5),
    mgp = c(2, 0.7, 0),
    mfrow = c(1,3),
    cex.lab = 1.25)
H(friday_acc$sixth, "Friday the 6th")
H(friday_acc$thirteenth, "Friday the 13th")
H(friday_acc$sixth - friday_acc$thirteenth, "Difference")
dev.off()
