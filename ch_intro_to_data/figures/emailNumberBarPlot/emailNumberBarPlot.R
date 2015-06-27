require(openintro)
data(email)
data(COL)

myPDF('emailNumberBarPlot.pdf',
      7,
      3,
      mar = c(3.6, 4.5, 1, 1.5),
      mgp = c(3.4, 0.7, 0),
      mfrow = 1:2)
t <- table(email$number)
barplot(t,
        axes = TRUE,
        xlab = '',
        ylab = 'count',
        main = '',
        ylim = c(0,2700),
        col = COL[1])
abline(h = 0)
mtext("number", 1, 2.4)

par(mar = c(3.6, 4.7, 1, 1))
barplot(t / sum(t),
        axes = FALSE,
        xlab = 'number',
        ylab = '',
        main = '',
        ylim = c(0, 2700) / sum(t),
        col = COL[1])
at <- seq(0, 0.6, 0.2)
axis(2, at)
par(las = 0)
mtext('proportion', side = 2, line = 2.7)
mtext("number", 1, 2.4)
abline(h = 0)
dev.off()

table(email$number, email$spam)
