library(openintro)
data(COL)
set.seed(2)
x <- exp(c(rnorm(100, log(7.5), 0.15),
           rnorm(10, log(10), 0.196)))
x <- x - mean(x) + 7.42
t.test(x, mu = 7)
mean(x)
sd(x)
length(x)

fn <- paste0('histOfSleepForCollege',
             'ThatWasCheckingForMoreThan7Hours.pdf')
myPDF(fn, 5, 3,
      mar = c(3.2, 3.5, 1, 1),
      mgp = c(1.9, 0.7, 0))
histPlot(x,
         xlab = 'Nightly sleep (hours)',
         ylab = '',
         col = COL[1],
         axes = FALSE)
axis(1, at = c(5, 10, 15))
axis(2, at = seq(0, 30, 10))
mtext('Freqency', side = 2, line = 2.3, las = 0)
dev.off()
