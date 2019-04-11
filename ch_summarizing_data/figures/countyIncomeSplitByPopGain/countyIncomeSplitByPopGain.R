library(openintro)
data(countyComplete)
data(COL)

cc  <- county
pop <- sign(cc$pop2017 - cc$pop2010 - 0.5)
sum(is.na(pop))
pov <- cc$median_hh_income

set.seed(1)
these <- sample(sum(pop == -1, na.rm = TRUE), 50)
sampL <- round(pov[pop == -1][these] / 1000, 1)
these <- sample(sum(pop == 1, na.rm = TRUE), 100)
sampG <- round(pov[pop == 1][these] / 1000, 1)
M  <- matrix(c(sampG, rep("", 2), sampL, rep("", 1)), 17)
DB <- 6
for(i in 1:nrow(M)){
  for(j in 1:ncol(M)){
    cat(M[i,j])
    if (j == DB) {
      cat(" && ")
    } else if (j == ncol(M)) {
      cat(" \\\\")
    } else {
      cat(" & ")
    }
  }
  cat("\n")
}
pop[pop == 1] <- "Gain"
pop[pop == -1] <- "No Gain"


myPDF("countyIncomeSplitByPopGain.pdf", 7.5, 4,
      mar = c(3.6, 4.6, 1, 0.5),
      mgp = c(2.4, 0.7, 0),
      mfrow = 1:2)
boxPlot(pov, pop,
        axes = FALSE,
        xlim = c(0.5, 2.5),
        xlab = 'Change in Population',
        ylab = '',
        lcol = "#00000000",
        col = "#00000000")
axis(1, at = 1:2, c("Gain", "No Gain"))
AxisInDollars(2, at = pretty(pov))
par(las = 0)
mtext("Median Household Income", 2, 3.6)
par(las = 1)
boxPlot(pov[pop == "Gain"],
        lcol = COL[1],
        col = COL[1,3],
        add = 1)
boxPlot(pov[pop == "No Gain"],
        lcol = COL[4],
        col = COL[4,3],
        add = 2)

par(mar = c(3.6, 0.5, 1, 1))

xlim <- range(pov[pop == 'No Gain'], na.rm = TRUE)
histPlot(pov[pop == 'No Gain'],
         breaks = 50,
         col = '#ffffff00',
         border = COL[4],
         probability = TRUE,
         xlim = xlim,
         xlab = 'Median Household Income',
         ylab = '',
         hollow = TRUE,
         axes = FALSE,
         lty = 3,
         lwd = 4)
histPlot(pov[pop == 'No Gain'],
         breaks = 50,
         col = '#ffffff00',
         border = COL[4],
         probability = TRUE,
         add = TRUE,
         hollow = TRUE,
         lty = 3,
         lwd = 2)
histPlot(pov[pop == 'No Gain'],
         breaks = 50,
         col = '#ffffff00',
         border = COL[4],
         probability = TRUE,
         add = TRUE,
         hollow = TRUE,
         lty = 3,
         lwd = 1)
histPlot(pov[pop == 'Gain'],
         breaks = 50,
         col = '#ffffff00',
         border = COL[1],
         probability = TRUE,
         add = TRUE,
         hollow = TRUE,
         lty = 1,
         lwd = 2)
AxisInDollars(1, at = pretty(xlim))
legend('topright',
       col = COL[c(1,4)],
       lty = c(1,3),
       lwd = c(2,2.8),
       legend = c('Gain', 'No Gain'))
legend('topright',
       col = c(rgb(0,0,0,0), COL[4]),
       lty = c(1, 3),
       lwd = c(2,1.4),
       legend = c('Gain', 'No Gain'),
       bg = rgb(0,0,0,0),
       box.col = rgb(0,0,0,0),
       text.col = rgb(0,0,0,0))
legend('topright',
       col = c(rgb(0,0,0,0), COL[4]),
       lty = c(1, 3),
       lwd = c(2,0.7),
       legend = c('Gain', 'No Gain'),
       bg = rgb(0,0,0,0),
       box.col = rgb(0,0,0,0),
       text.col = rgb(0,0,0,0))
dev.off()

