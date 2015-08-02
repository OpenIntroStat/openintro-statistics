# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------

exam_data <- read.table("exam_grades.txt", h = T, sep = "\t")

# plot course grade vs. exam 1 --------------------------------------

pdf("exam_grades_1.pdf", 5.5, 4.3)

par(mar = c(3.75, 3.75, 0.5, 0.5), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1.5, cex.axis = 1.5)

plot(exam_data$course_grade ~ exam_data$exam1, 
     pch = 19, col = COL[1,2], 
     xlab = "Exam 1", ylab = "Final Exam", 
     xlim = c(40,100), ylim = c(40,100), axes=FALSE)
axis(1, at = seq(40,100,20))
axis(2, at = seq(40,100,20))
box()

m_course_grade_exam1 = lm(exam_data$course_grade ~ exam_data$exam1)
abline(m_course_grade_exam1, col = COL[2], lwd = 2)

dev.off()

# plot course grade vs. exam 2 --------------------------------------

pdf("exam_grades_2.pdf", 5.5, 4.3)

par(mar = c(3.75, 3.75, 0.5, 0.5), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1.5, cex.axis = 1.5)

plot(exam_data$course_grade ~ exam_data$exam2, 
     pch = 19, col = COL[1,2], 
     xlab = "Exam 2", ylab = "Final Exam", 
     xlim = c(40,100), ylim = c(40,100), axes=FALSE)
axis(1, at = seq(40,100,20))
axis(2, at = seq(40,100,20))
box()

m_course_grade_exam2 = lm(exam_data$course_grade ~ exam_data$exam2)
abline(m_course_grade_exam2, col = COL[2], lwd = 2)

dev.off()