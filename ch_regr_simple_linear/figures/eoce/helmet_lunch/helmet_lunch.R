# load packages -----------------------------------------------------
library(openintro)

# create data -------------------------------------------------------

lunch <- c(50, 11, 2, 19, 26, 73, 81, 51, 11, 2, 19, 25)
helmet <- c(22.1, 35.9, 57.9, 22.2, 42.4, 5.8, 
            3.6, 21.4, 55.2, 33.3, 32.4, 38.4)

# summary stats -----------------------------------------------------

round(mean(lunch), 1)
round(mean(helmet), 1)

round(sd(lunch), 1)
round(sd(helmet), 1)

cor(lunch, helmet)

# model helmet vs. lunch --------------------------------------------

m_helmet_lunch <- lm(helmet ~ lunch)

summary(m_helmet_lunch)

round(summary(m_helmet_lunch)$r.squared, 2)
  
# plot helmet vs. lunch ---------------------------------------------

pdf("helmet_lunch.pdf", 5.5, 4.3)

par(mar = c(3.7, 3.7, 0.5, 0.5), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1.5, cex.axis = 1.5)

plot(helmet ~ lunch, 
     xlab = "% Receiving reduced-fee lunch", ylab = "% Wearing helmets", 
     pch = 19, col = COL[1],
     ylim = c(0, 60), axes = FALSE)
axis(1, at = seq(0, 80, 20))
axis(2, at = seq(0, 60, 20))
box()

dev.off()