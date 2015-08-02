# load packages -----------------------------------------------------
library(openintro)
library(xtable)

# load data ---------------------------------------------------------

babies <- read.csv("babies.csv")

# mlr for birth weight ----------------------------------------------

m_bwt_mlr <- lm(bwt ~ gestation + parity + age + 
                     height + weight + smoke , data = babies)

round(summary(m_bwt_mlr)$adj.r.squared, 4)

# no gestation ------------------------------------------------------

m_bwt_mlr_no_gestation <- lm(bwt ~ parity + age + 
                               height + weight + smoke , data = babies)

round(summary(m_bwt_mlr_no_gestation)$adj.r.squared, 4)

# no parity ---------------------------------------------------------

m_bwt_mlr_no_parity <- lm(bwt ~ gestation + age + 
                            height + weight + smoke , data = babies)

round(summary(m_bwt_mlr_no_parity)$adj.r.squared, 4)

# no age ------------------------------------------------------------

m_bwt_mlr_no_age <- lm(bwt ~ gestation + parity + 
                         height + weight + smoke , data = babies)

round(summary(m_bwt_mlr_no_age)$adj.r.squared, 4)

# no height ---------------------------------------------------------

m_bwt_mlr_no_height <- lm(bwt ~ gestation + parity + 
                         age + weight + smoke , data = babies)

round(summary(m_bwt_mlr_no_height)$adj.r.squared, 4)

# no weight ---------------------------------------------------------

m_bwt_mlr_no_weight <- lm(bwt ~ gestation + parity + 
                            age + height + smoke , data = babies)

round(summary(m_bwt_mlr_no_weight)$adj.r.squared, 4)

# no smoking --------------------------------------------------------

m_bwt_mlr_no_smoking <- lm(bwt ~ gestation + parity + 
                            age + height + weight , data = babies)

round(summary(m_bwt_mlr_no_smoking)$adj.r.squared, 4)
