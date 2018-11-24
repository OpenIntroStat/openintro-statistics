library(openintro)
library(dplyr)

set.seed(3)

exp_gp  <- rep(c("vaccine", "placebo"), c(14, 6))
outcome <- c(rep(c('infection', 'no infection'), c(5, 9)),
             rep(c('infection', 'no infection'), c(6, 0)))

nsim    <- 100
n       <- length(exp_gp)
success <- "infection"

SimulateTable <- function(exp_gp, outcome, ...) {
  table(sample(exp_gp), outcome)
}
# SimulateTable(exp_gp, outcome)

sim_tables <-
    lapply(1:nsim, SimulateTable,
        exp_gp = exp_gp,
        outcome = outcome)
result <- sim_tables %>%
    lapply(function(x) {
    	  x[1, 1] / sum(x[1, ]) - x[2, 1] / sum(x[2, ])
    	}) %>%
    	unlist()
sim_tables[1:5]
result[1:5]

pval <- sum(result >= 0.64) / nsim
values <- table(result)
diffs <- unique(result)

X <- c()
Y <- c()
for (i in 1:length(diffs)) {
  x   <- diffs[i]
  rec <- sum(result == x)
  X   <- append(X, rep(x, rec))
  Y   <- append(Y, 1:rec)
}


myPDF('malaria_rand_dot_plot.pdf', 6, 3.5,
      mar = c(3.4, 0.5, 0.5, 0.5),
      mgp = c(2.35, 0.6, 0))
plot(X, Y,
     xlim = range(diffs) + c(-1, 1) * sd(diffs) / 4,
     xlab = "Difference in Infection Rates",
     axes = FALSE,
     ylim = c(0, max(Y)),
     col = COL[1],
     pch = 20)
# at <- seq(-0.4, 0.4, 0.1)
# labels <- c(-0.4, "", -0.2, "", 0, "", 0.2, "", 0.4)
axis(1) #, at, labels)
abline(h = 0)
dev.off()
