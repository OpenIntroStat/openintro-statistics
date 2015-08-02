# load packages -----------------------------------------------------

library(openintro)

# load data ---------------------------------------------------------

load("orings.rda")
set.seed(17)

# plot probability of damage vs. temperature ------------------------

myPDF("challenger_disaster_damage_temp.pdf", 4.5, 2.7, 
      mar = c(3.2, 3.7, 0.8, 0.8), mgp = c(2.5, 0.55, 0))

these <- orings[,1] %in% c(67, 70, 76)
plot(orings[,1] + 
       c(rep(0, 5), c(-0.1, 0, 0.1), 0, 0, -0.07, -0.07, 0.07, 0.07, 
         rep(0, 4), -0.07, 0.07, 0, 0, 0), 
     orings[,2]/6, 
     xlab = "", ylab = "Probability of damage", 
     xlim = c(50, 82), ylim = c(0,1), 
     col = COL[1,2], pch = 19)
mtext("Temperature (Fahrenheit)", 1, 2)

dev.off()

# probability calculations ------------------------------------------

temperature <- c(51, 53, 55)
logitp <- 11.6630 - 0.2162 * temperature
p <- exp(logitp) / (1+exp(logitp))

# plot of predicted probabilities -----------------------------------

myPDF("challenger_disaster_pred_damage_temp.pdf", 4.5, 2.7, 
      mar=c(3.2, 3.7, 0.8, 0.8), mgp = c(2.5, 0.55, 0))

these <- orings[,1] %in% c(67, 70, 76)
plot(orings[,1] + 
       c(rep(0, 5), c(-0.1, 0, 0.1), 0, 0, -0.07, -0.07, 0.07, 0.07, 
         rep(0, 4), -0.07, 0.07, 0, 0, 0), 
     orings[,2]/6, 
     xlab = "", ylab = "Probability of damage", 
     xlim = c(50, 82), ylim = c(0,1), 
     col = COL[1,2], pch = 19)
mtext("Temperature (Fahrenheit)", 1, 2)
temperature <- seq(51, 75, 2)
logitp      <- 11.6630 - 0.2162*temperature
p           <- exp(logitp)/(1+exp(logitp))
points(temperature, p, col=COL[4], cex=0.7)
temperature <- seq(25, 100, 0.2)
logitp      <- 11.6630 - 0.2162 * temperature
p           <- exp(logitp) / (1+exp(logitp))
lines(temperature, p, col = COL[4])

dev.off()