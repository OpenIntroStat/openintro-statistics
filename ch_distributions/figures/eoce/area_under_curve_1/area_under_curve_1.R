# load packages -----------------------------------------------------

library(openintro)

# Z < -1.35 ---------------------------------------------------------

pdf("zltNeg.pdf", height = 3, width = 5)

par(mar = c(5,0,0,0), las = 1, mgp = c(3,1,0), mfrow = c(1,1))

m = 0
s = 1
l = -1.35
u = NA

normTail(m = m, s = s, L = l, U = u, 
         axes = FALSE, col = COL[1], 
         xlab = "(a)", cex.lab = 2)
axis(1, at = c(m - 3*s, l, m, u, m + 3*s), 
     label = c(NA,l,m,u,NA), cex.axis = 2)

dev.off()

# Z > 1.48 ----------------------------------------------------------

pdf("zgtPos.pdf", height = 3, width = 5)

par(mar = c(5,0,0,0), las = 1, mgp = c(3,1,0), mfrow = c(1,1))

m = 0
s = 1
l = NA
u = 1.48

normTail(m = m, s = s, L = l, U = u, 
         axes = FALSE, col = COL[1], 
         xlab = "(b)", cex.lab = 2)
axis(1, at = c(m - 3*s, l, m, u, m + 3*s), 
     label = c(NA,l,m,u,NA), cex.axis = 2)

dev.off()

# -0.4 < Z < 1.5-----------------------------------------------------

pdf("zBet.pdf", height = 3, width = 5)

par(mar = c(5,0,0,0), las = 1, mgp = c(3,1,0), mfrow = c(1,1))

m = 0
s = 1
l = NA
u = NA
M = c(-0.4,1.5)

normTail(m = m, s = s, L = l, U = u, M = M,
         axes = FALSE, col = COL[1], 
         xlab = "(c)", cex.lab = 2)
axis(1, at = c(m - 3*s, l, m, u, m + 3*s), 
     label = c(NA,l,m,u,NA), cex.axis = 2)

dev.off()

# -2 < Z < 2---------------------------------------------------------

pdf("zgtAbs.pdf", height = 3, width = 5)

par(mar = c(5,0,0,0), las = 1, mgp = c(3,1,0), mfrow = c(1,1))

m = 0
s = 1
l = -2
u = 2
M = NA

normTail(m = m, s = s, L = l, U = u, M = M,
         axes = FALSE, col = COL[1], 
         xlab = "(d)", cex.lab = 2)
axis(1, at = c(m - 3*s, l, m, u, m + 3*s), 
     label = c(NA,l,m,u,NA), cex.axis = 2)

dev.off()
