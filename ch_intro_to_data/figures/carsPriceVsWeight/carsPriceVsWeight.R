library(openintro)
data(cars)
data(COL)

myPDF("carsPriceVsWeight.pdf", 5, 3.3,
      mar = c(3.6, 3.6, 1, 1),
      mgp = c(2.5, 0.7, 0))
plot(cars$weight, cars$price, 
     xlab = 'Weight (Pounds)', ylab = 'Price ($1000s)', 
     pch = 19, 
     col = COL[1, 2], 
     ylim = c(0, max(cars$price)))
g <- lm(price ~ weight + I(weight^2),
        cars,
        weights = 1/weight^2)
w <- seq(1000, 5000, 100)
lines(w,
      predict(g, data.frame(weight = w)),
      lty = 2,
      col = COL[5, 3])
dev.off()
