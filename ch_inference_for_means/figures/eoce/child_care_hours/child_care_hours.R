# load packages -----------------------------------------------------
library(openintro)
library(xtable)

# load data ---------------------------------------------------------
china <- read.csv("china.csv")

# subset and clean data ---------------------------------------------
china <- china[!is.na(china$gender) & !is.na(china$child_care) 
               & !is.na(china$edu) & china$child_care != -99 & china$edu != 9,]

china$edu[china$edu == 1] <- "Primary school"
china$edu[china$edu == 2] <- "Lower middle school"
china$edu[china$edu == 3] <- "Upper middle school"
china$edu[china$edu == 4] <- "Technical or vocational"
china$edu[china$edu == 5] <- "College"
china$edu <- factor(china$edu, 
                    levels = c("Primary school", "Lower middle school", 
                               "Upper middle school", "Technical or vocational",
                               "College"))

# summary stats -----------------------------------------------------

by(china$child_care, china$edu, mean)
by(china$child_care, china$edu, sd)
by(china$child_care, china$edu, length)

# plot --------------------------------------------------------------

pdf("child_care_hours.pdf", height = 4, width = 15)

par(mar = c(2,4,1,5), las = 1, mgp = c(2.7,0.7,0), 
    cex.lab = 1.45, cex.axis = 1.45)
boxPlot(china$child_care, fact = china$edu, ylab = "Child care hours", 
        col = COL[1,2], xlim = c(0.6, 5.4),
        lcol = COL[1], lwd = 1.5, medianLwd = 2.5)
dev.off()

# anova -------------------------------------------------------------
xtable(anova(lm(china$child_care ~ china$edu)), digits = 2)