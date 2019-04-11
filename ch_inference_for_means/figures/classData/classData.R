library(openintro)
data(COL)
library(xtable)
data(classdata)

myPDF("classDataSBSBoxPlot.pdf", 5.5, 2.7,
      mgp = c(2.3, 0.5, 0),
      mar = c(3.4, 3.2, 0.5, 0.5))
boxPlot(classdata$m1, classdata$lecture,
        axes = FALSE,
        xlab = "Lecture",
        ylab = "Midterm Scores",
        lcol = COL[1],
        lwd = 1.3,
        medianLwd = 2.5)
axis(1, c(-50, 1:3, 50), c("", "A", "B", "C", ""))
axis(2, seq(0, 100, 20))
dev.off()

by(classdata$m1, classdata$lecture, length)
by(classdata$m1, classdata$lecture, mean)
by(classdata$m1, classdata$lecture, sd)

anova(lm(m1 ~ lecture, classdata))
summary(lm(m1 ~ lecture, classdata))
xtable(anova(lm(m1 ~ lecture, classdata)))
