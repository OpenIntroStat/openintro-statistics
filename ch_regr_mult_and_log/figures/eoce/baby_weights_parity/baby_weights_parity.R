# load packages -----------------------------------------------------
library(openintro)
library(xtable)

# load data ---------------------------------------------------------

babies <- read.csv("babies.csv")

# model birth weight vs. parity -------------------------------------

m_bwt_parity <- lm(bwt ~ as.factor(parity), data = babies)

xtable(summary(m_bwt_parity), digits = 2)
