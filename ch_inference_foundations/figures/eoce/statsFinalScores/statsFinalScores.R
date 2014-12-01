oiB = "#3E9BC0"

###

pdf("statsFinalScores.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 70
s = 10/sqrt(40)
u = 75

normTail(m = m, s = s, U = u, col = oiB, axes = FALSE, xlim = c(65,75))
axis(1, at = c(m - 3*s,m,u,m + 3*s), label = c(NA,m,u,NA), cex.axis = 1.25)

dev.off()