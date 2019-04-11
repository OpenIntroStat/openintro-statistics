library(openintro)
source("makeTubeAdv.R")
data(COL)

# load the makeTube function (ch7 folder)
pch <- 20
cex <- 1.75
col <- COL[1, 3]

myPDF('whatCanGoWrongWithLinearModel.pdf', 10, 2.8,
      mar = rep(0.5, 4))
layout(matrix(1:8, 2),
       rep(1, 4),
       c(2, 1))

these <- simulated_scatter$group == 20
x <- simulated_scatter$x[these]
y <- simulated_scatter$y[these]
plot(x, y,
     axes = FALSE,
     pch = pch,
     cex = cex,
     col = "#00000000")
box()
makeTube(x, y,
         type = 'quad',
         addLine = FALSE,
         col = COL[7, 3])
points(x, y,
       pch = pch,
       cex = cex,
       col = COL[1, 2])
g <- lm(y ~ x)
abline(g)
yR <- range(g$residuals)
yR <- yR + c(-1, 1) * diff(yR) / 10
plot(x, g$residuals,
     axes = FALSE,
     pch = pch,
     cex = cex,
     col = COL[1, 2],
     ylim = yR)
abline(h = 0, lty = 2)
box()

these <- simulated_scatter$group == 21
x <- simulated_scatter$x[these]
y <- simulated_scatter$y[these]
plot(x, y,
     axes = FALSE,
     pch = pch,
     cex = cex,
     col = "#00000000")
box()
makeTube(x, y,
         addLine = FALSE,
         col = COL[7, 3])
points(x, y,
       pch = pch,
       cex = cex,
       col = COL[1,2])
g <- lm(y ~ x)
abline(g)
yR <- range(g$residuals)
yR <- yR + c(-1, 1) * diff(yR) / 10
plot(x, g$residuals,
     axes = FALSE,
     pch = pch,
     cex = cex,
     col = COL[1, 2],
     ylim = yR)
abline(h = 0, lty = 2)
box()

these <- simulated_scatter$group == 22
x <- simulated_scatter$x[these]
y <- simulated_scatter$y[these]
plot(x, y,
     axes = FALSE,
     pch = pch,
     cex = cex,
     col = "#00000000")
box()
makeTubeAdv(x, y,
            type = 'l',
            variance = 'l',
            bw = 0.03,
            Z = 1.7,
            col = COL[7, 3])
points(x, y,
       pch = pch,
       cex = cex,
       col = COL[1, 2])
g <- lm(y ~ x)
abline(g)
yR <- range(g$residuals)
yR <- yR + c(-1, 1) * diff(yR) / 10
plot(x, g$residuals,
     axes = FALSE,
     pch = pch,
     cex = cex,
     col = COL[1, 2],
     ylim = yR)
abline(h = 0, lty = 2)
box()

these <- simulated_scatter$group == 23
x <- simulated_scatter$x[these]
y <- simulated_scatter$y[these]
plot(x, y,
     axes = FALSE,
     pch = pch,
     cex = cex,
     col = "#00000000")
box()
makeTube(x, y,
         addLine = FALSE,
         col = COL[7, 3])
points(x, y,
       pch = pch,
       cex = cex,
       col = COL[1, 2])
g <- lm(y ~ x)
abline(g)
yR <- range(g$residuals)
yR <- yR + c(-1, 1) * diff(yR) / 10
plot(x, g$residuals,
     axes = FALSE,
     pch = pch,
     cex = cex,
     col = COL[1, 2],
     ylim = yR)
abline(h = 0, lty = 2)
box()

makeTubeAdv(x,y, col = COL[7,3])

dev.off()
