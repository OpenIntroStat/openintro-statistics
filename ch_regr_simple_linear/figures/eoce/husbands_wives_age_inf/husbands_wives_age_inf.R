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

m_h_w_age <- lm(hw$age_wife ~ hw$age_husband)

xtable(summary(m_h_w_age))

# plot wife vs. husband age -----------------------------------------

pdf("husbands_wives_age.pdf", 5.5, 4.3)

par(mar = c(3.75, 3.75, 0.5, 0.5), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1.5, cex.axis = 1.5)

plot(hw$age_wife ~ hw$age_husband, 
     xlab = "Husband's age (in years)", 
     ylab = "Wife's age (in years)", 
     pch = 19, col = COL[1,2], 
     xlim = c(18, 66), ylim = c(16, 66), axes = FALSE)
axis(1, at = seq(20,60,20))
axis(2, at = seq(20,60,20))
box()

dev.off()