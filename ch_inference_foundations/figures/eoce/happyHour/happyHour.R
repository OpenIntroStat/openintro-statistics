oiB = "#3E9BC0"

###

pdf("happyHour.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 18
s = 3.02/sqrt(70)
u = 19.25

normTail(m = m, s = s, U = u, axes = FALSE, col = oiB, xlim = c(16.5,19.5))
axis(1, at = c(m - 3*s,m,u,m + 3*s), label = c(NA,m,u,NA), cex.axis = 1.25)

dev.off()