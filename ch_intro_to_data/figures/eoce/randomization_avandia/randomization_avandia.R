# load openintro package for colors -----------------------
library(openintro)

# create data ---------------------------------------------
gr <- c(rep("rosig", 67593), rep("piog",159978))
out <- c(rep(c("y", "n"), c(2593, 67593-2593)), 
         rep(c("y", "n"), c(5386, 159978-5386)))

set.seed(13)
N <- 10^2
rand_dist <- rep(NA, N)
for(i in 1:N){
  rand_group <- sample(gr)
  rand_dist[i] <- sum(out[rand_group == "rosig"] == "y")
}

# plot randomization distribution -----------------------------------
pdf("randomization_avandia.pdf", 6, 4)
par(mar = c(4,2.7,0,0), las = 1 , mgp = c(2.7, 0.9, 0), 
    cex.lab = 1.5, cex.axis = 1.5)
histPlot(rand_dist, main="", 
         xlab = "Simulated rosiglitazone cardiovascular events", ylab="", 
         col = COL[1], axes = FALSE)
axis(1, at = seq(2250, 2550, 100))
axis(2, at = (0:4)*N/20, labels = c(0, NA, 2, NA, 4)/20)
abline(h = 0)
dev.off()