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

# mlr for absent days  ----------------------------------------------

mlr_absent_full <- lm(Days ~ Eth + Sex + Lrn, data = quine)

round(summary(mlr_absent_full)$adj.r.squared, 4)

# no Ethnicity ------------------------------------------------------

mlr_absent_no_eth <- lm(Days ~ Sex + Lrn, data = quine)

round(summary(mlr_absent_no_eth)$adj.r.squared, 4)

# no Sex ------------------------------------------------------------

mlr_absent_no_sex <- lm(Days ~ Eth + Lrn, data = quine)

round(summary(mlr_absent_no_sex)$adj.r.squared, 4)

# no Lrn ------------------------------------------------------------

mlr_absent_no_lrn <- lm(Days ~ Eth + Sex, data = quine)

round(summary(mlr_absent_no_lrn)$adj.r.squared, 4)
