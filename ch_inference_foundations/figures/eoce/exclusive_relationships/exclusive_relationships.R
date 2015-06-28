# load packages -----------------------------------------------------
library(openintro)
library(dplyr)

# load data ---------------------------------------------------------
survey <- read.csv("survey.csv")

# sample size -------------------------------------------------------
n <- survey %>%
  filter(!is.na(excl_relation)) %>%
  nrow() # 203

# histogram ---------------------------------------------------------

pdf("exclusive_relationships_rel_hist.pdf", height = 2.3, width = 5.5)
par(mar=c(3.3,2.2,0.3,0.5), las=1, mgp=c(2.2,0.55,0))
histPlot(survey$excl_relation, col = COL[1], xlab = "Number of exclusive relationships", ylab = "")
dev.off()