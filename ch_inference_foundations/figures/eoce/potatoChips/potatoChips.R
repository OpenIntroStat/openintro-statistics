oiB = "#3E9BC0"

###

pdf("potatochips.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 130
s = 17/sqrt(35)
l = 126
u = 134

normTail(m = m, s = s, L = l, U = u, axes = FALSE, col = oiB)
axis(1, at = c(m - 3*s,l,m,u,m + 3*s), label = c(NA,l,m,u,NA), cex.axis = 1.25)

dev.off()