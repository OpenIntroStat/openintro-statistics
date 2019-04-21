# load packages -----------------------------------------------------
library(openintro)
library(ggplot2)

# load data ---------------------------------------------------------
data(diamonds)

# calculate ppc: price per carat ------------------------------------
diamonds$ppc <- diamonds$price / (diamonds$carat * 100)

# subset for cara = 1 or carat = 0.99 -------------------------------
diamonds_100_99 <- diamonds[diamonds$carat == 1 | diamonds$carat == 0.99,]

# take samples ------------------------------------------------------
nn <- diamonds_100_99$ppc[diamonds_100_99$carat == 0.99]

set.seed(123)
one <- sample(diamonds_100_99$ppc[diamonds_100_99$carat == 1], size = 23, replace = FALSE)

# create variables --------------------------------------------------
ppc <- c(nn, one)
carat <- c(rep("0.99 carats",23), rep("1 carat",23))

# box plots ---------------------------------------------------------
pdf("diamonds_box.pdf", height = 3, width = 4)
par(mar = c(2, 4, 1, 1), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1.25, cex.axis = 1.25)
boxPlot(ppc, fact = carat, ylab = "Point price (in dollars)", axes = FALSE,
		lcol = COL[1], lwd = 1.5, medianLwd = 2.5)
axis(1, at = c(1,2), labels = c("0.99 carats", "1 carat"))
axis(2, at = seq(20, 80, 20))
dev.off()