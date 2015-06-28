library(openintro)
data(textbooks)
data(COL)
d <- textbooks

myPDF('textbooksS10HTTails.pdf', 5, 1.6,
      mar = c(1.7, 0, 0, 0),
      mgp = c(3, 0.5, 0))
normTail(L = -6.5,
         U = 6.5,
         df = 20,
         xlim = c(-8, 8),
         col = COL[4],
         border = COL[4],
         axes = FALSE)
at <- c(-10, 0, 6.5, 10)
labels <- expression(0, mu[0]*' = 0', bar(x)[diff]*" = 12.76", 0)
axis(1, at, labels, cex.axis = 0.9)
segments(c(-9, 9), rep(0, 2),
         c(-6.5, 6.5), rep(0, 2),
         col = COL[4, 2], lwd = 4)
arrows(c(-7, 7), rep(0.1, 2),
       c(-7, 7), rep(0.015, 2),
       length = 0.08,
       col = COL[4])
text(c(-7, 7), rep(0.1, 2),
     c("left tail", "right tail"),
     pos = 3,
     col = COL[4])
dev.off()
