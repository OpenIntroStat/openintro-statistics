# plot --------------------------------------------------------------
pdf('t_distribution.pdf', 4.3, 2.3)

par(mar=c(2, 0, 0, 0), mgp=c(5, 0.6, 0))
plot(c(-4.2, 4.2), c(0, dnorm(0)), type='n', axes=FALSE, xlab = "", ylab = "")
axis(1)
abline(h=0)

X <- seq(-5, 5, 0.01)
Y <- dnorm(X)
lines(X, Y, lwd = 0.7)

Y <- dt(X, 1)
lines(X, Y, lty=3)

Z <- dt(X, 5)
lines(X, Z, lty=5)

legend("topright", lty = c(1,5,3), c("solid","dashed","dotted"), inset = 0.01, box.col = "white")

dev.off()
