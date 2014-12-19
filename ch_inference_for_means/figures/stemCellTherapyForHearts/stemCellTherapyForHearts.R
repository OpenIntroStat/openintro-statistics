library(openintro)
data(COL)
data(stem.cells)
d <- stem.cells

change <- d$after - d$before
t.test(change ~ d[,1])

myPDF('stemCellTherapyForHearts.pdf', 4, 5,
      mar=c(4, 1.8, 3, 0.7),
      mgp=c(2, 0.45, 0),
      mfrow=c(2, 1))
histPlot(change[d[,1] == 'esc'],
         xlim=c(-10, 15),
         axes=FALSE,
         xlab='',
         main='',
         breaks=seq(-10, 15, 2.5),
         col=COL[1])
x.axis.at <- seq(-10, 15, 5)
x.axis.labels <- paste0(seq(-10, 15, 5), "%")
cex.axis <- 0.85
axis(1, x.axis.at, x.axis.labels, cex.axis=cex.axis)
mtext('Embryonic stem cell transplant', line=1.5, cex=1.25)
mtext('Change in heart pumping function', 1, line=1.5, cex=0.9)
par(mgp=c(2, 0.6, 0))
axis(2, at=0:3, cex.axis=0.925)

par(mar=c(2.6, 1.8, 4, 0.7),
    mgp=c(2, 0.5, 0))
histPlot(change[d[,1] == 'ctrl'],
         xlim=c(-10, 15),
         axes=FALSE,
         xlab='',
         main='',
         breaks=seq(-10, 15, 2.5),
         col=COL[1])
axis(1, x.axis.at, x.axis.labels, cex.axis=cex.axis)
par(mgp=c(2, 0.6, 0))
axis(2, at=0:3, cex.axis=0.925)
mtext('Control (no treatment)', line=1.5, cex=1.25)
mtext('Change in heart pumping function', 1, line=1.5, cex=0.9)
dev.off()
