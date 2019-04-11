require(openintro)

fn <- 'paydayCC_norm_pvalue.pdf'
myPDF(fn, 4, 1.5,
      mar = c(1.55, 0, 0.1, 0),
      mgp = c(3, 0.5, 0))
normTail(0.5, 0.017, L = 0.49, U = 0.51, col = COL[1])
dev.off()
