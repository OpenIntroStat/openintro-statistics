

pdf("admission_gt1787.pdf", height = 2, width = 4)
par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1), cex.lab = 1.25, cex.axis = 1.25)

m = 1750
s = 23
l = NA
u = 1787
M = NA

normTail(m = m, s = s, U = u, L = l, M = M, axes = FALSE, col = oiB)
axis(1, at = c(m - 3*s,l,m,u,M,m + 3*s), label = c(NA,l,m,u,M,NA))

dev.off()

###

pdf("admission_gt1787_corr.pdf", height = 2, width = 4)
par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1), cex.lab = 1.25, cex.axis = 1.25)

m = 1750
s = 23
l = NA
u = 1786.5
M = NA

normTail(m = m, s = s, U = u, L = l, M = M, axes = FALSE, col = oiB)
axis(1, at = c(m - 3*s,l,m,u,M,m + 3*s), label = c(NA,l,m,u,M,NA))

dev.off()
