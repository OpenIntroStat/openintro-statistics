library(openintro)

x <- print(chisq.test(table(ask[2:3])))$statistic

myPDF('iPodChiSqTail.pdf', 5, 2.25,
    mar = c(2, 1, 1, 1),
    mgp = c(2.1, 0.7, 0))
ChiSquareTail(x, 2,
              c(0, 50),
              col = COL[1])
text(x, 0, "Tail area (1 / 500 million)\nis too small to see", pos = 3)
lines(c(x, 1000 * x), rep(0, 2), col = COL[1], lwd = 3)
dev.off()
