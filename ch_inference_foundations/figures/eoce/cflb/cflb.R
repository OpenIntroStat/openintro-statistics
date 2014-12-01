oiB = "#3E9BC0"

###

pdf("cflb_pop.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 9000
s = 1000
u = 10500

normTail(m = m, s = s, U = u, col = oiB, axes = FALSE)
axis(1, at = c(m - 3*s,m,u,m + 3*s), label = c(NA,m,u,NA), cex.axis = 1.25)

dev.off()

###

pdf("cflb_n15.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 9000
s = 1000/sqrt(15)
u = 10500

normTail(m = m, s = s, U = u, col = oiB, axes = FALSE, xlim = c(8250,10750))
axis(1, at = c(m - 3*s,m,u,m + 3*s), label = c(NA,m,u,NA), cex.axis = 1.25)

dev.off()

###

pdf("cflb_sketch.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1))

# population

m = 9000
s = 1000

X <- seq((m - 3 * s),(m + 3 * s),10)
Y <- dnorm(X, m, s)

plot(X, Y, type='l', axes=F, xlim=c(min(X), max(X)), ylim=c(0, 0.0015), ylab = "", xlab = "")
lines(X, rep(0,length(X)))
axis(1, at = seq((m - 3 * s),(m + 3 * s),s), cex.axis = 1.25)

# sampling

m = 9000
s = 1000 / sqrt(15)

X <- seq((m - 3 * s),(m + 3 * s),10)
Y <- dnorm(X, m, s)

lines(X, Y, type='l', lty = 2, col = oiB)

legend("topright", c("Population","Sampling (n = 15)"), lty = c(1,2), col = c("black",oiB), inset = 0.03, cex = 1.25)

dev.off()