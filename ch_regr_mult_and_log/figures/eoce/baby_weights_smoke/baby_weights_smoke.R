# load packages -----------------------------------------------------
library(openintro)
library(xtable)

# load data ---------------------------------------------------------

babies <- read.csv("babies.csv")

# model birth weight vs. smoking ------------------------------------

m_bwt_smoke <- lm(bwt ~ as.factor(smoke), data = babies)

xtable(summary(m_bwt_smoke), digits = 2)
