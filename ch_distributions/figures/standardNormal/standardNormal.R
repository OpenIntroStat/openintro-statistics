library(openintro)

set.seed(1)
x <- rnorm(1e5)
hold <- hist(x, breaks = 50, plot = FALSE)

myPDF("standardNormal.pdf", 1250 / 255, 650 / 255,
      mar = c(2, 0, 0.5, 0))

X <- seq(-4, 4, 0.01)
Y <- dnorm(X)

plot(X, Y,
     type = 'l',
     axes = FALSE,
     xlim = c(-3.4, 3.4))
axis(1, at = -3:3)
for(i in 1:length(hold$counts)){
  rect(hold$breaks[i], 0,
       hold$breaks[i+1], hold$density[i],
       border = '#DDDDDD',
       col = '#F4F4F4')
}
lines(X, Y)
abline(h = 0)

dev.off()
