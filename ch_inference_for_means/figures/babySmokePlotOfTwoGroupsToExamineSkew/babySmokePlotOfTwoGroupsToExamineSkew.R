library(openintro)
data(COL)
data(births)
d <- births


myPDF('babySmokePlotOfTwoGroupsToExamineSkew.pdf', 4.5, 4.5,
      mfrow = 2:1,
      mar = c(3.5, 1, 0.5, 1),
      mgp = c(1.7, 0.55, 0))
xlab.start <- 'Newborn weights (lbs) from mothers who'
histPlot(d$weight[d$smoke == 'smoker'],
         xlim = c(0, 11),
         axes = FALSE,
         xlab = paste(xlab.start, 'smoked'),
         col = COL[1])
axis(1)

histPlot(d$weight[d$smoke == 'nonsmoker'],
         xlim = c(0, 11),
         axes = FALSE,
         xlab = paste(xlab.start, 'did not smoke'),
         col = COL[1])
axis(1)
dev.off()
