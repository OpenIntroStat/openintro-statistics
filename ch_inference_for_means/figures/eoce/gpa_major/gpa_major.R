library(openintro)
library(xtable)

survey <- read.csv("survey.csv")

# subset for meaningful gpa -----------------------------------------
survey <- subset(survey,
    !is.na(survey$gpa) &
    !is.na(survey$major) &
    survey$gpa <= 4)

# set major level names ---------------------------------------------
levels(survey$major) <- c(
    "Arts and Humanities",
    "Natural Sciences",
    "Social Sciences")

# boxplot -----------------------------------------------------------
myPDF("gpa_major.pdf", 7.2, 2.7,
    mar = c(2.2,4.7,0.5,1),
    mgp = c(3.5,0.7,0),
    cex.lab = 1.25,
    cex.axis = 1.25)

boxPlot(survey$gpa, fact = survey$major, col = COL[1], 
        ylab = "GPA", axes = FALSE,
        xlim = c(0.6, 3.4),
        ylim = c(2.5, 4),
        lcol = COL[1], lwd = 1.5, medianLwd = 2.5)
axis(1, at = c(1,2,3), 
     labels = c("Arts and Humanities", "Natural Sciences", "Social Sciences"))
axis(2, at = seq(2.5, 4, 0.5))
dev.off()

# anova output ------------------------------------------------------
xtable(anova(lm(survey$gpa ~ survey$major)), digits = 2)

# summary stats -----------------------------------------------------
round(by(survey$gpa, survey$major, mean),2)
round(by(survey$gpa, survey$major, sd),2)
by(survey$gpa, survey$major, length)