oiB = "#3E9BC0"

###

pdf("sprayPaint_pop.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 25
s = 3
u = 27

normTail(m = m, s = s, U = u, col = oiB, axes = FALSE)
axis(1, at = c(m - 3*s,m,u,m + 3*s), label = c(NA,m,u,NA), cex.axis = 1.25)

dev.off()

###

pdf("sprayPaint_n20.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 25
s = 3/sqrt(20)
u = 27

normTail(m = m, s = s, U = u, col = oiB, axes = FALSE)
axis(1, at = c(m - 3*s,m,u,m + 3*s), label = c(NA,m,u,NA), cex.axis = 1.25)

dev.off()