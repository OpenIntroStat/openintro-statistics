# load packages -----------------------------------------------------
library(openintro)
library(xtable)

# load data ---------------------------------------------------------

babies <- read.csv("babies.csv")

# birth weight vs. gestation ----------------------------------------

m_bwt_gestation <- lm(bwt ~ gestation, data = babies)

round(summary(m_bwt_gestation)$coefficients[2,4], 4) # p-val
round(summary(m_bwt_gestation)$adj.r.squared, 4) # adj r-sq

# birth weight vs. parity ----------------------------------------

m_bwt_parity <- lm(bwt ~ parity, data = babies)

round(summary(m_bwt_parity)$coefficients[2,4], 4) # p-val
round(summary(m_bwt_parity)$adj.r.squared, 4) # adj r-sq

# birth weight vs. age --------------------------------------------

m_bwt_age <- lm(bwt ~ age, data = babies)

round(summary(m_bwt_age)$coefficients[2,4], 4) # p-val
round(summary(m_bwt_age)$adj.r.squared, 4) # adj r-sq

# birth weight vs. height ------------------------------------------

m_bwt_height <- lm(bwt ~ height, data = babies)

round(summary(m_bwt_height)$coefficients[2,4], 4) # p-val
round(summary(m_bwt_height)$adj.r.squared, 4) # adj r-sq

# birth weight vs. weight ------------------------------------------

m_bwt_weight <- lm(bwt ~ weight, data = babies)

round(summary(m_bwt_weight)$coefficients[2,4], 4) # p-val
round(summary(m_bwt_weight)$adj.r.squared, 4) # adj r-sq

# birth weight vs. smoke ------------------------------------------

m_bwt_smoke <- lm(bwt ~ smoke, data = babies)

round(summary(m_bwt_smoke)$coefficients[2,4], 4) # p-val
round(summary(m_bwt_smoke)$adj.r.squared, 4) # adj r-sq