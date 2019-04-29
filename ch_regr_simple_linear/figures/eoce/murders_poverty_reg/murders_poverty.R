# load packages -----------------------------------------------------
library(openintro)
library(xtable)

# load data ---------------------------------------------------------

murders <- read.csv("murders.csv")

# model murders vs. poverty -----------------------------------------

m_murders_poverty <- lm(murders$annual_murders_per_mil ~ murders$perc_pov)

xtable(summary(m_murders_poverty), digits = 3)

round(summary(m_murders_poverty)$r.squared, 4)
round(summary(m_murders_poverty)$adj.r.squared, 4)
  
# plot murders vs. poverty ------------------------------------------

pdf("murders_poverty.pdf", 5.5, 4.3)

par(mar = c(3.7, 3.7, 0.5, 0.5), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1.5, cex.axis = 1.5)

plot(murders$annual_murders_per_mil ~ murders$perc_pov, 
     xlab = "Percent in Poverty",
     ylab = "Annual Murders per Million", 
     pch = 19, col = COL[1],
     xlim = c(14, 27), ylim = c(5, 40), axes = FALSE)
AxisInPercent(1, at = seq(14, 26, 4))
axis(2, at = seq(10, 40, 10))
box()

dev.off()