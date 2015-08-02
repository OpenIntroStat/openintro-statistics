# load packages -----------------------------------------------------
library(xtable)
library(MASS)

# load data ---------------------------------------------------------
data(quine)

# convert categorical variables to 0/1 ------------------------------

quine$Eth <- as.character(quine$Eth)
quine$Eth[quine$Eth == "A"] <- 0
quine$Eth[quine$Eth == "N"] <- 1
quine$Eth <- as.factor(quine$Eth)

quine$Sex <- as.character(quine$Sex)
quine$Sex[quine$Sex == "F"] <- 0
quine$Sex[quine$Sex == "M"] <- 1
quine$Sex <- as.factor(quine$Sex)

quine$Lrn <- as.character(quine$Lrn)
quine$Lrn[quine$Lrn == "AL"] <- 0
quine$Lrn[quine$Lrn == "SL"] <- 1
quine$Lrn <- as.factor(quine$Lrn)

# add Ethnicity -----------------------------------------------------

mlr_absent_eth <- lm(Days ~ Eth, data = quine)

round(summary(mlr_absent_eth)$coefficients[2,4], 4)

round(summary(mlr_absent_eth)$adj.r.squared, 4)

# add Sex -----------------------------------------------------------

mlr_absent_sex <- lm(Days ~ Sex, data = quine)

round(summary(mlr_absent_sex)$coefficients[2,4], 4)

round(summary(mlr_absent_sex)$adj.r.squared, 4)

# add Lrn -----------------------------------------------------------

mlr_absent_lrn <- lm(Days ~ Lrn, data = quine)

round(summary(mlr_absent_lrn)$coefficients[2,4], 4)

round(summary(mlr_absent_lrn)$adj.r.squared, 4)
