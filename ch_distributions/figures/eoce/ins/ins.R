m = 1650
s = 223.88

###

pdf("ins_1800.pdf", height = 2, width = 5)
par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1), cex.lab = 1.25, cex.axis = .8)

l = NA
u = 1800
M = NA

normTail(m = m, s = s, U = u, L = l, M = M, axes = FALSE, col = oiB)
axis(1, at = c(m - 3*s,l,m,u,M,m + 3*s), label = c(NA,l,m,u,M,NA))
text(x = 1890, y = 0.00012, "0.25", col = "white")

dev.off()