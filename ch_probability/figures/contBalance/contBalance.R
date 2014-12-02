library(openintro)
data(COL)

x <- seq(0, 22, 0.01)
y <- dchisq(x, 5)
M <- weighted.mean(x, y)

pdf('contBalance.pdf', 4, 2.2)
par(mar = c(1.65, 0, 0, 0), mgp = c(5, 0.5, 0))
plot(x, y + 0.035,
     type = 'l',
     ylim = range(c(0.025, y + 0.035)),
     axes = FALSE)
axis(1, at = c(-100, M, 100), labels = c('', expression(mu), ''))
lines(c(0, 22), rep(0.035, 2))
polygon(x, y + 0.035, col = COL[1])
polygon(c(M - 20, M + 20, M),
        c(-0.2, -0.2, 0.035),
        col = COL[4])
dev.off()
