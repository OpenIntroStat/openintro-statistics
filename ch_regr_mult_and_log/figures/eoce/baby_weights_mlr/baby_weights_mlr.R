# load packages -----------------------------------------------------
library(openintro)
library(xtable)

# load data ---------------------------------------------------------

babies <- read.csv("babies.csv")

# print out dataset -------------------------------------------------

babies_sub <- babies[c(1,2,nrow(babies)), ]
xtable(babies_sub)

# mlr for birth weight ----------------------------------------------

m_bwt_mlr <- lm(bwt ~ gestation + parity + age + 
                     height + weight + smoke , data = babies)

xtable(summary(m_bwt_mlr), digits = 2)
