library(openintro)
d <- sp500_1950_2018  # read.csv("sp500_1950_2018.csv")
d <- subset(d, "2009-01-01" <= as.Date(Date) & as.Date(Date) <= "2018-12-31")
d. <- diff(d$Adj.Close)
mean(d. > 0)

# Not worrying about case where d. == 0.
R  <- ifelse(d. > 0, 1, 0)
CC <- table(diff(which(R == 1)))
CC[names(CC) == 7] <- sum(CC[names(CC) %in% 7:100])
CC <- CC[- which(names(CC) %in% 8:100)]
p  <- mean(R)
pr <- p * (1 - p)^(0:5)
pr <- append(pr, 1 - sum(pr))

p
(CC <- c(CC))
sum(CC)
C  <- rep(1:7, CC)
(EE <- round(pr * sum(CC)))
E  <- rep(1:7, EE)
(X2 <- sum((CC - EE)^2 / EE))
pchisq(X2, length(CC) - 1, lower.tail = FALSE)

myPDF('geomFitEvaluationForSP500.pdf', 7, 3.5,
      mar = c(3.2, 4.2, 0.2, 1),
      mgp = c(2.1, 0.7, 0))
ylim <- c(0, round(max(CC, EE) + 50, -2))
histPlot(C - 0.13,
         breaks = seq(0, 8, 0.25),
         xlim = c(0.5, 7.5),
         ylim = ylim,
         xlab = 'Wait Until Positive Day',
         ylab = '',
         axes = FALSE,
         col = COL[1])
histPlot(E + 0.13,
         breaks = seq(0, 8, 0.25),
         add = TRUE,
         col = COL[3])
axis(1, 1:7, c(1:6, "7+"))
axis(2, at = seq(0, ylim[2], 200))
par(las = 0)
mtext('Frequency', 2, line = 3)
legend('topright',
       fill = COL[c(1, 3)],
       legend = c('Observed', 'Expected'))
dev.off()

