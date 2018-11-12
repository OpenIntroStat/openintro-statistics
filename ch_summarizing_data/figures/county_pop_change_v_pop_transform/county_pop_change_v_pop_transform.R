library(openintro)
data(COL)

x <- county$pop2010
y <- county$pop_change
cex <- 0.5
col <- COL[1, 4]
col.shell <- COL[1, 2]

myPDF("county_pop_change_v_pop_transform_i.pdf",
      4.5,
      3.3,
      mar = c(3, 3.9, 0.5, 1.2),
      mgp = c(2.8, 0.5, 0))
plot(x, y, type = "n",
     xlab = "",
     ylab = "Population Change",
     axes = FALSE)
abline(h = pretty(y), v = pretty(x), col = COL[7, 3])
points(x, y, pch = 19, cex = cex, col = col)
AxisInPercent(2, at = pretty(y))
at <- pretty(x)
axis(1, at, paste0(at / 1e6, "m"))
box()
points(x, y, cex = cex, col = col.shell)
mtext("Population Before Change (m = millions)", 1, 1.9)
dev.off()


myPDF("county_pop_change_v_pop_transform_log.pdf",
      4.5,
      3.3,
      mar = c(3, 4, 0.5, 1.2),
      mgp = c(1.8, 0.5, 0))
x. <- log(x, 10)
plot(x., y, type = "n",
     xlab = expression(log[10] * "(Population Before Change)"),
     ylab = "",
     axes = FALSE)
abline(h = pretty(y), v = pretty(x.), col = COL[7, 3])
points(x., y, pch = 19, cex = cex, col = col)
points(x., y, cex = cex, col = col.shell)
axis(1)
AxisInPercent(2, at = pretty(y))
par(las = 0)
mtext("Population Change", 2, 2.9)
box()
dev.off()
