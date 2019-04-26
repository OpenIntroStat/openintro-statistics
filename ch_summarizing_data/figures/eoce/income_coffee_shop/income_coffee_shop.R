# load openintro package for colors ---------------------------------
library(openintro)

# generate data -----------------------------------------------------
set.seed(956)

sal_symmetric = rnorm(40, mean = 65000, sd = 2000)
sal_skewed = c(sal_symmetric, 225000, 250000)

options(scipen=2)

# histograms --------------------------------------------------------
pdf("income_coffee_shop.pdf", 5.5, 4.3)
par(mar = c(3.6, 2, 0.5, 1), las = 1, mgp = c(2.5, 0.7, 0), 
    mfrow = c(2,1), cex.lab = 1.5, cex.axis = 1)

histPlot(sal_symmetric, xlim = c(60000, 70000), 
         xlab = "(1)", ylim = c(0,12), col = COL[1], 
         axes = FALSE, ylab = "")
AxisInDollars(1, at = seq(0, 1000000, 2500))
axis(2, at = seq(0,12,4))

histPlot(sal_skewed, xlab = "(2)", ylim = c(0,12), 
         breaks = seq(0, 260000, by = 1000), col = COL[1], 
         axes = FALSE, xlim = c(60000,260000), ylab = "")
AxisInDollars(1, at = seq(60000, 260000, 50000))
axis(2, at = seq(0,12,4))

dev.off()

# summary stats -----------------------------------------------------
library(xtable)

summary_table = as.data.frame(cbind(summary(sal_symmetric), summary(sal_skewed)))
names(summary_table) = c("(1)","(2)")
summary_table = rbind(c(length(sal_symmetric), length(sal_skewed)), 
                      summary_table, c(sd(sal_symmetric), sd(sal_skewed)))
rownames(summary_table)[1] = "n"
rownames(summary_table)[dim(summary_table)[1]] = "SD"

xtable(summary_table, digits = 0)