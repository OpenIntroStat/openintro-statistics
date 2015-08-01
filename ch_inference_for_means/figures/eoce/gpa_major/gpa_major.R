# load packages -----------------------------------------------------
library(openintro)
library(xtable)

# load data ---------------------------------------------------------
survey <- read.csv("survey.csv")

# subset for meaningful gpa -----------------------------------------
survey <- survey[!is.na(survey$gpa) & !is.na(survey$major) & survey$gpa <= 4,]

# set major level names ---------------------------------------------
levels(survey$major) <- c("Arts and Humanities", "Natural Sciences", "Social Sciences")

# boxplot -----------------------------------------------------------
pdf("gpa_major.pdf", height = 3, width = 8)

par(mar=c(2,4.5,0,3), mgp=c(2.5,0.7,0), las = 1, cex.lab = 1.25, cex.axis = 1.25)

boxPlot(survey$gpa, fact = survey$major, col = COL[1], 
        ylab = "GPA", axes = FALSE, xlim=c(0.6, 3.4))
axis(1, at = c(1,2,3), 
     labels = c("Arts and Humanities", "Natural Sciences", "Social Sciences"))
axis(2, at = seq(2.7,3.9,0.3))

dev.off()

# anova output ------------------------------------------------------
xtable(anova(lm(survey$gpa ~ survey$major)), digits = 2)

# summary stats -----------------------------------------------------
round(by(survey$gpa, survey$major, mean),2)
round(by(survey$gpa, survey$major, sd),2)
by(survey$gpa, survey$major, length)