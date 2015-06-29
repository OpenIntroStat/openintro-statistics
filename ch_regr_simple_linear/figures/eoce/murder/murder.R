murder = read.csv("murder.csv")

library(openintro)
library(xtable)

# plot: annual_murders_per_mil vs. perc_pov
pdf("annual_murders_per_mil_perc_pov.pdf", 5.5, 4.3)
par(mgp = c(2.5, 0.7, 0), mar = c(4,4,1,1), cex.axis = 1.5, cex.lab = 1.5, las = 1)
plot(murder$annual_murders_per_mil ~ murder$perc_pov, pch = 19, col = COL[1], xlab = "% in poverty", ylab = "annual murders per million")
dev.off()

# cor: annual_murders_per_mil vs. perc_pov
cor(murder$annual_murders_per_mil, murder$perc_pov)

# model
murder_mod = lm(murder$annual_murders_per_mil ~ murder$perc_pov)
summary(murder_mod)
xtable(summary(murder_mod), digits = 3)
