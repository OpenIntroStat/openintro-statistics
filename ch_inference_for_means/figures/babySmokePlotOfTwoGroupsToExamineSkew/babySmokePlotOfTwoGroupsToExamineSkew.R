library(openintro)
data(COL)
data(births)
d <- births


myPDF('babySmokePlotOfTwoGroupsToExamineSkew.pdf', 2 * 4.5, 2.3,
      mfrow = 1:2, #2:1,
      mar = c(3, 1, 2.5, 1),
      mgp = c(1.7, 0.55, 0))
xlab.start <- 'Newborn Weights (lbs)'
histPlot(d$weight[d$smoke == 'smoker'],
         xlim = c(0, 11),
         axes = FALSE,
         xlab = xlab.start,
         main = 'Mothers Who Smoked',
         col = COL[1])
axis(1)

# par(mar = c(2.8, 1, 0.5, 1))
histPlot(d$weight[d$smoke == 'nonsmoker'],
         xlim = c(0, 11),
         axes = FALSE,
         xlab = xlab.start,
         main = 'Mothers Who Did Not Smoke',
         col = COL[1])
axis(1)
dev.off()
