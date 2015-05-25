require(openintro)
data(COL)

fn <- 'mammogramPValue.pdf'
myPDF(fn, 4, 1.2,
      mar = c(1.5, 0, 0.1, 0),
      mgp = c(3, 0.3, 0))
normTail(L = -0.17, U = 0.17,
        col = COL[1],
        axes = FALSE,
        xlim = c(-3.2, 3.2))
at <- c(-10, -2, 0, 2, 10)
labels <- c(0, -0.0014, 0, 0.0014, 0)
axis(1, at, labels, cex.axis = 0.9)
# lines(rep(0, 2), c(0, dnorm(0)), col = COL[4])
dev.off()
