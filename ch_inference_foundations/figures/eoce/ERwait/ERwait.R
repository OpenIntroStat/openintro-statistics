setwd("~/Desktop/Open Intro/EOCE - Second Edition/04/figures/eoce/ERwait")

oiB = "#3E9BC0"

###

pdf("ERwait.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 127
s = 39/sqrt(64)
u = 137.5
l = m - (137.5-m)

normTail(m = m, s = s, U = u, L = l, axes = FALSE, col = oiB)
axis(1, at = c(m - 3*s,l,m,u,m + 3*s), label = c(NA,l,m,u,NA), cex.axis = 1.25)

dev.off()

###

pdf("ERwait_power1_05.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1), cex.axis = 1.5, cex.lab = 1.5)

m = 128
s = 39/sqrt(64)
u = 137.555
l = 118.445

normTail(m = m, s = s, L = l, U = u, axes = FALSE, col = oiB)
axis(1, at = c(m - 3*s,l,m,u,m + 3*s), label = c(NA,expression(bar(x)[lower]), m,expression(bar(x)[upper]),NA))
text(x = u+2, y = 0.015, "0.025", cex = 1.25)
text(x = l-2, y = 0.015, "0.025", cex = 1.25)

dev.off()

###

pdf("ERwait_power2_05.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1), cex.axis = 1.25)

m = 135
s = 39/sqrt(64)
u = 137.555
l = 118.445

normTail(m = m, s = s, L = l, U = u, axes = FALSE, col = oiB, xlim = c(117,153))
axis(1, at = c(m - 3*s,l, m,u,m + 3*s), label = c(NA,l,m,u,NA))
axis(1, at = 140, tick = FALSE, label = "137.555")

dev.off()

###

pdf("ERwait_power1_01.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 128
s = 39/sqrt(64)
u = 139.36

normTail(m = m, s = s, U = u, axes = FALSE, col = oiB)
axis(1, at = c(m - 3*s,m,u,m + 3*s), label = c(NA,m,expression(bar(x)),NA), cex.axis = 1.25)
text(x = 141, y = 0.007, "0.01")

dev.off()

###

pdf("ERwait_power2_01.pdf", height = 3, width = 6)

par(mar=c(2,0,0,0), las=1, mgp=c(3,1,0), mfrow = c(1,1))

m = 137.5
s = 39/sqrt(64)
u = 139.36

normTail(m = m, s = s, U = u+2.1, axes = FALSE, col = oiB)
axis(1, at = c(m - 3*s,m,u+2.1,m + 3*s), label = c(NA,m,139.36,NA), cex.axis = 1)

dev.off()