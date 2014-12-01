

pdf("tri_L.pdf", height = 2, width = 4)
par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1), cex.lab = 1.25, cex.axis = 1.1)

m = 4313
s = 583
l = NA
u = 4948
M = NA

normTail(m = m, s = s, U = u, L = l, M = M, axes = FALSE, col = oiB)
axis(1, at = c(m - 3*s,l,m,u,M,m + 3*s), label = c(NA,l,m,u,M,NA))

dev.off()

###

pdf("tri_M.pdf", height = 2, width = 4)
par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1), cex.lab = 1.25, cex.axis = 1.1)

m = 5261
s = 807
l = NA
u = 5513
M = NA

normTail(m = m, s = s, U = u, L = l, M = M, axes = FALSE, col = oiB)
axis(1, at = c(m - 3*s,l,m,u,M,m + 3*s), label = c(NA,NA,m,NA,NA,NA))
axis(1, at = c(m - 3*s,l,m,u+400,M,m + 3*s), label = c(NA,l,NA,"5513",M,NA), tick = FALSE)

dev.off()

