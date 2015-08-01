# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------
data(oscars)

# create male and female subsets ------------------------------------
oscar_f <- oscars$age[oscars$gender == "female"]
oscar_m <- oscars$age[oscars$gender == "male"]

# plot of oscar winner women and men ages ---------------------------
pdf("oscars_winners_hist.pdf", height = 6, width = 8)

par(mar=c(3.7,2,1,1), las=1, mgp=c(2.5,0.7,0), mfrow = c(2,1), cex.lab = 1.25, cex.axis = 1.25)

histPlot(oscar_f, ylab = "", xlab = "", 
         col = COL[1], xlim = c(20,80), breaks = 12, axes = FALSE)
axis(1, at = seq(20,80,20))
axis(2, at = seq(0,20,10))
text(x = 60, y = 18, labels = "Best actress", pos = 4, cex = 1.25)

histPlot(oscar_m, ylab = "", xlab = "Ages (in years)", 
         col = COL[1], xlim = c(20,80), breaks = 12, axes = FALSE)
axis(1, at = seq(20,80,20))
axis(2, at = seq(0,20,10))
text(x = 60, y = 18, labels = "Best actor", pos = 4, cex = 1.25)

dev.off()

# summary stats -----------------------------------------------------
mean(oscar_f, na.rm = TRUE)
sd(oscar_f, na.rm = TRUE)
length(oscar_f)

mean(oscar_m, na.rm = TRUE)
sd(oscar_m, na.rm = TRUE)
length(oscar_m)