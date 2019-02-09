library(openintro)

x <- ami.occurrences$ami

myPDF("amiIncidencesOver100Days.pdf", 5, 2.4,
       mar = c(3, 3.5, 0.5, 1))
histPlot(x,
         breaks = (0:max(2 * x + 1)) / 2 - 0.25,
         axes = FALSE,
         col = COL[1],
         xlab = "",
         ylab = "")
at     <- 0:1000
labels <- rep("", length(at))
axis(1, at = at, labels = labels, tcl = -0.18)
axis(1, at = seq(0, 1000, 5), tcl = -0.35)
axis(2, at = seq(0, 1000, 20))
par(las = 0)
mtext("AMI Events (by Day)", 1, 1.8)
mtext("Frequency", 2, 2.4)
dev.off()
