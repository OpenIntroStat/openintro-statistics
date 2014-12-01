m = 72.6
s = 4.78

###

pdf("i5_gt70.pdf", height = 2, width = 4)
par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1), cex.lab = 1.25, cex.axis = 0.9)

l = NA
u = 70
M = NA

normTail(m = m, s = s, U = u, L = l, M = M, axes = FALSE, col = oiB)
axis(1, at = c(m - 3*s,l,m,u,M,m + 3*s), label = c(NA,l,m,NA,M,NA))
axis(1, at = c(m - 3*s,l,m,69,M,m + 3*s), label = c(NA,NA,NA,"70",NA,NA), tick = FALSE)

dev.off()

###
