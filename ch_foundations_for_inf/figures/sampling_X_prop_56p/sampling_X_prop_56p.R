set.seed(4)
library(openintro)
data(COL)
source("../helpers.R")

p <- 0.56
# Must sub p's actual value into expression() below.
n.sim <- 50000
samp.size <- c(5, 25, 100) # , 1000)
mar <- c(3.5, 1.5, 2.3, 1.5)


myPDF('sampling_X_prop_56p.pdf', 4, 5,
    mfrow = c(3, 1),
    yaxs = "i",
    mar = mar,
    mgp = c(2.3, 0.6, 0))
for (ss in samp.size) {
  par(mar = c(3.5, 0.2, 2.3, 0.2))
  xlab <- ifelse(ss < 100, "", "Sample Proportion")
  RunSimulation(p, n.sim, ss, xlim = c(0, 1), xlab = xlab)
}
dev.off()
