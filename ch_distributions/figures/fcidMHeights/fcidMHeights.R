library(openintro)

obs <- male_heights_fcid$height_inch
source("fcidMHeights-helpers.R")

hold <- hist(obs, plot = FALSE)

myPDF("fcidMHeights.pdf", 6, 2.7,
      mfrow = c(1, 2),
      mgp = c(2, 0.7, 0),
      mar = c(3, 0.2, 1, 0.8))
NormalHist(obs, hold, mean(obs), sd(obs), COL[1])

par(mar = c(3,4,1,0))
qqnorm(obs,
       cex = 0.7,
       main = '',
       axes = FALSE,
       ylab = 'Male Heights (inches)',
       col = COL[1])
axis(1)
axis(2)
qqline(obs)
dev.off()
