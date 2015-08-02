# load packages -----------------------------------------------------
library(xtable)

# load data ---------------------------------------------------------

gpa_survey <- read.csv("gpa_survey.csv")

# gpa mlr -----------------------------------------------------------

m_gpa <- lm(gpa ~ studyweek + sleepnight + outnight + gender,
            data = gpa_survey)

xtable(summary(m_gpa), digits = 2)
