# load packages -----------------------------------------------------
library(openintro)

# set input data ----------------------------------------------------

mean_v = 151
sd_v = 7
sophia_v = 160
sophia_v_Z = (sophia_v - mean_v) / sd_v

mean_q = 153
sd_q = 7.67
sophia_q = 157  
sophia_q_Z = (sophia_q - mean_q) / sd_q

# gre_intro ---------------------------------------------------------

pdf("gre_intro.pdf", height = 3, width = 5)

par(mar = c(0,0,0,0), las = 1, mgp = c(3,1,0))

m = 0
s = 1

X <- m + s*seq(-3.2,3.2,0.01)
Y <- dnorm(X, m, s)

plot(X, Y, type='l', axes = F, 
     xlim = c(-3.4,3.4), ylim = c(-0.11, 0.4), 
     ylab = "")
lines(X, rep(0,length(X)))

lines(c(0,0), dnorm(0)*c(0.01,0.99), col = COL[6], lty=3)

z = sophia_v_Z
text(x = z+0.1, dnorm(z)*1.05, "VR", pos=3, col= COL[1], cex = 1.5)
text(x = z + 0.5, y = -0.03, paste("Z =", round(sophia_v_Z, 2)), 
     col = COL[1], cex = 1.5)
lines(c(z,z), dnorm(z, m, s)*c(0.01,0.99), lty=2, col= COL[1])

z = sophia_q_Z
text(x = z+0.1, dnorm(z)*1.05, "QR", pos=3, col= COL[4], cex = 1.5)
text(x = z - 0.5, y = -0.03, paste("Z =", round(sophia_q_Z, 2)), 
     col = COL[4], cex = 1.5)
lines(c(z,z), dnorm(z, m, s)*c(0.01,0.99), lty=2, col= COL[4])

dev.off()

# gre_intro_VR ---------------------------------------------------------

pdf("gre_intro_VR.pdf", height = 2, width = 4)

par(mar = c(2,0,0,0), las = 1, mgp = c(3,1,0), 
    cex.lab = 1.25, cex.axis = 0.9)

normTail(m = mean_v, s = sd_v, L = sophia_v, col = COL[1])

dev.off()

# gre_intro_QR ---------------------------------------------------------

pdf("gre_intro_QR.pdf", height = 2, width = 4)

par(mar = c(2,0,0,0), las = 1, mgp = c(3,1,0), 
    cex.lab = 1.25, cex.axis = 0.9)

normTail(m = mean_q, s = sd_q, L = sophia_q, col = COL[1])

dev.off()