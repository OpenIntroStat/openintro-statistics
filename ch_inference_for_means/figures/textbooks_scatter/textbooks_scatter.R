library(openintro)
library(dplyr)

d <- select(ucla_textbooks_f18,
    subject, course_num, bookstore_new, amazon_new)
d$price_diff <- d$bookstore_new - d$amazon_new
d <- subset(d, !is.na(bookstore_new) & !is.na(amazon_new))
rownames(d) <- NULL

myPDF('textbooks_scatter.pdf', 6, 4,
      mar = c(3.7, 4.1, 0.5, 0.5),
      mgp = c(2.6, 0.55, 0))
plot(d$bookstore_new, d$amazon_new,
     pch = 19,
     col = COL[1, 2],
     cex = 1.2,
     xlab = 'UCLA Bookstore Price',
     ylab = '',
     axes = FALSE)
AxisInDollars(1, seq(0, 300, 50))
AxisInDollars(2, seq(0, 300, 50))
par(las = 0)
mtext("Amazon Bookstore Price", 2, line = 3)
dev.off()
