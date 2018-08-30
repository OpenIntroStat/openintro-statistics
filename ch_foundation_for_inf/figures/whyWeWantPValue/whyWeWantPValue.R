library(openintro)
data(COL)

BuildWhyWeWantPValuePlot <- function(
    file.name = 'whyWeWantPValue.pdf',
    expression1 = expression('Distribution of '*bar(x)),
    expression2 = expression('observed '*bar(x))) {

  myPDF(file.name, 6.3, 2.5,
        mar = c(2, 1, 0.5, 1),
        mgp = c(2.1, 0.6, 0))
  normTail(L = -5, df = 20,
           axes = FALSE, xlim = c(-6, 3),
           lwd = 2.5, curveColor = COL[5])
  at <- seq(-10, 5, 5)
  labels <- expression('', 'null value '*-5*'×SE   ',
                       'null value', '')
  axis(1, at, labels)
  yMax <- 0.4
  text(0, yMax / 2 - 0.02,
      expression1,
      cex = 1.1, col = COL[5])
  text(0, yMax / 3 - 0.01,
      expression('if '*H[0]*' was true'),
      cex = 1.1, col = COL[5])
  arrows(-5, yMax / 3, -5, yMax / 20,
      length = 0.1, lwd = 2, col = COL[1])
  text(-5, yMax / 3, expression2,
      cex = 1.1, pos = 3, col = COL[1])
  dev.off()
}

BuildWhyWeWantPValuePlot()
BuildWhyWeWantPValuePlot(
    "whyWeWantPValueProp.pdf",
    expression("Distribution of "*hat(p)*","),
    expression("Observed " *hat(p)))  # "Observed proportion")
