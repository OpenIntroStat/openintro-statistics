library(openintro)
data(COL)

myPDF('pVForEbayAmazonComparison.pdf', 7, 2.2,
      mar = c(2, 0, 0.5, 0),
      mgp = c(3, 0.75, 0))
normTail(L  =  -4.9,
         df  =  30,
         col  =  COL[4],
         xlim  =  c(-6.5, 3.3),
         axes  =  FALSE)
abline(h  =  0)
axis(1, at = -4.9, label = expression(bar(x)*'  =  44.17'),
     cex.axis = 1.15)
par(mgp = c(3, 0.9, 0))
axis(1,
     at = c(-15, 0, 5),
     labels = expression(0, mu[0]*'  =  46.99', 0),
     cex.axis = 1.15)
lines(c(-15, -4.9), c(0,0),
      lwd = 4,
      col = COL[4])
yMax <- 0.4

arrows(-5.3, yMax / 2,
       -5.3, yMax / 10,
       length = 0.1,
       col = COL[4],
       lwd = 1.5)
text(-4.5, yMax / 2,
     paste0('The p-value is represented by\n',
            'the area to the left. The area is\n',
            'so slim we cannot see it.'),
     pos = 3,
     cex = 1.2,
     col = COL[4])
dev.off()
