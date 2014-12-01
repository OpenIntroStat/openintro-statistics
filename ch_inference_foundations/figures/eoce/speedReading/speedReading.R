oiB = "#3E9BC0"

###

pdf("speedReading.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 500
s = 220/sqrt(100)
l = 415

normTail(m = m, s = s, L = l, axes = FALSE, col = oiB, xlim = c(400,600))
axis(1, at = c(m - 3*s,l,m,m + 3*s), label = c(NA,l,m,NA), cex.axis = 1.25)

dev.off()