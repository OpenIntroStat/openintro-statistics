library(openintro)
data(MLB)
data(COL)

myPDF("histMLBSalariesReg.pdf",
      4,
      3,
      mar = c(3.4, 2.4, 0.5, 0.5),
      mgp = c(2.1, 0.5, 0))
hist(MLB$salary/1000,
     breaks = 15,
     main = "",
     xlab = "Salary (millions of dollars)",
     ylab = "",
     axes = FALSE,
     col = COL[1])
axis(1, seq(0, 40, 10))
axis(2, c(0, 500))
axis(2,
     seq(100, 400, 100),
     rep("", 4),
     tcl = -0.2)
dev.off()

myPDF("histMLBSalariesLog.pdf",
      4,
      3,
      mar = c(3.4, 2.4, 0.5, 0.5),
      mgp = c(2.2, 0.5, 0))
expr <- expression(log[e]*"(Salary), where Salary is in millions USD")
hist(log(MLB$salary/1000),
     main = "",
     breaks = 15,
     xlab = expr,
     axes = FALSE,
     ylab = "",
     col = COL[1])
axis(1)
axis(2, seq(0, 300, 100))
dev.off()
