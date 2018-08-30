set.seed(4)
library(openintro)
data(COL)
source("../helpers.R")

p <- c(0.03, 0.20, 0.50, 0.80, 0.97)
# Must sub p's actual value into expression() below.
n.sim <- 50000
samp.size <- 100
mar <- c(3.5, 1.5, 2.3, 1.5)


myPDF('sampling_100_prop_X_12.pdf', 8, 2.8,
    mfrow = c(1, 2),
    yaxs = "i",
    mar = mar,
    mgp = c(2.3, 0.6, 0))
for (p. in p[1:2]) {
  if (p. == 0.05) {
    par(mar = c(3.5, 0.2, 2.3, 2))
  } else if (p. == 0.2) {
    par(mar = c(3.5, 2, 2.3, 0.2))
  }
  xlab <- ""
  RunSimulation(p., n.sim, samp.size, xlab = xlab, show = "p")
}
dev.off()

myPDF('sampling_100_prop_X_3.pdf', 4.5, 2.8,
    yaxs = "i",
    mar = mar,
    mgp = c(2.3, 0.6, 0))
for (p. in p[3]) {
  par(mar = c(3.5, 0.2, 2.3, 0.2))
  xlab <- ""
  RunSimulation(p., n.sim, samp.size, xlab = xlab, show = "p")
}
dev.off()

myPDF('sampling_100_prop_X_45.pdf', 8, 2.8,
    mfrow = c(1, 2),
    yaxs = "i",
    mar = mar,
    mgp = c(2.3, 0.6, 0))
for (p. in p[4:5]) {
  if (p. %in% c(0.80)) {
    par(mar = c(3.5, 0.2, 2.3, 2))
  } else {
    par(mar = c(3.5, 2, 2.3, 0.2))
  }
  xlab <- "Sample Proportion"
  RunSimulation(p., n.sim, samp.size, xlab = xlab, show = "p")
}
dev.off()
