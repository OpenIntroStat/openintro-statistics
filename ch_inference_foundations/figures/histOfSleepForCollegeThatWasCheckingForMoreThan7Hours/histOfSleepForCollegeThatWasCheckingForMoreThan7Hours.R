library(openintro)
data(COL)
data(student.sleep)
x <- student.sleep$hours
t.test(x, mu = 7)
mean(x)
sd(x)
length(x)

fn <- paste0('histOfSleepForCollege',
             'ThatWasCheckingForMoreThan7Hours.pdf')
myPDF(fn, 5, 2.3,
      mar = c(2.65, 3.5, 0, 1),
      mgp = c(1.6, 0.45, 0))
histPlot(x,
         xlab = 'Nightly sleep (hours)',
         ylab = '',
         col = COL[1],
         axes = FALSE)
axis(1, at = c(5, 10, 15))
axis(2, at = seq(0, 30, 10))
mtext('Freqency', side = 2, line = 2.3, las = 0)
dev.off()
