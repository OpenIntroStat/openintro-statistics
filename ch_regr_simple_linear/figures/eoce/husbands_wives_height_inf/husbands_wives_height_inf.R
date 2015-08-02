# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------

hw <- read.table("husbands_wives.txt", h = T, sep = "\t")

# converts heights to inches ----------------------------------------

hw$ht_husband_in <- hw$ht_husband / 25.4
hw$ht_wife_in <- hw$ht_wife / 25.4

# remove cases where wife's age is missing --------------------------

hw <- hw[!is.na(hw$age_wife),]

# model summary -----------------------------------------------------

m_h_w_height <- lm(hw$ht_wife_in ~ hw$ht_husband_in)

xtable(summary(m_h_w_height))

# plot wife vs. husband height --------------------------------------

pdf("husbands_wives_height.pdf", 5.5, 4.3)

par(mar = c(3.75, 3.75, 0.5, 0.5), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1.5, cex.axis = 1.5)

plot(hw$ht_wife_in ~ hw$ht_husband_in, 
     xlab = "Husband's height (in inches)", 
     ylab = "Wife's height (in inches)", 
     pch = 19, col = COL[1,2], 
     xlim = c(60, 77), ylim = c(55, 70), axes = FALSE)
axis(1, at = seq(60, 75, 5))
axis(2, at = seq(55, 70, 5))
box()

dev.off()