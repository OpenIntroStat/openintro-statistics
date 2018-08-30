# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------
load("penniesAges.Rda")

# plot population ---------------------------------------------------
pdf("pennies_ages_pop.pdf", height = 3, width = 5.8)
par(mar=c(2,2,0.5,0.5), las=1, mgp=c(2.5,0.7,0), 
    cex.lab = 1.5, cex.axis = 1.5)
histPlot(penniesAges$age, col = COL[1], xlab = "Penny ages", 
         ylab = "", axes = FALSE)
axis(1)
dev.off()

# plot sampling, n = 5 ----------------------------------------------

set.seed(123)
xbar = c()
for(i in 1:5000){
	sub = sample(c(1:nrow(penniesAges)), size = 5, replace = TRUE)
	xbar = c(xbar, mean(penniesAges$age[sub]))
}
xbar5 = xbar

myPDF("pennies_ages_sampling_n5.pdf", 3, 2.4, 
      mar=c(3.5,0.5,0.5,0.5), las=1, mgp=c(2.1,0.4,0))
histPlot(xbar5, col = COL[1], 
         xlab = expression(bar(x)[" n = 5"]), ylab = "", 
         axes = FALSE)
axis(1)
dev.off()

# plot sampling, n = 30 ----------------------------------------------

set.seed(234)
xbar = c()
for(i in 1:5000){
  sub = sample(c(1:nrow(penniesAges)), size = 30, replace = TRUE)
  xbar = c(xbar, mean(penniesAges$age[sub]))
}
xbar30 = xbar

myPDF("pennies_ages_sampling_n30.pdf", 3, 2.4, 
      mar=c(3.5,0.5,0.5,0.5), las=1, mgp=c(2.1,0.4,0))
histPlot(xbar30, col = COL[1], 
         xlab = expression(bar(x)[" n = 30"]), ylab = "", 
         axes = FALSE)
axis(1)
dev.off()

# plot sampling, n = 100 --------------------------------------------

set.seed(345)
xbar = c()
for(i in 1:5000){
  sub = sample(c(1:nrow(penniesAges)), size = 100, replace = TRUE)
  xbar = c(xbar, mean(penniesAges$age[sub]))
}
xbar100 = xbar

myPDF("pennies_ages_sampling_n100.pdf", 3, 2.4, 
      mar=c(3.5,0.5,0.5,0.5), las=1, mgp=c(2.1,0.4,0))
histPlot(xbar100, col = COL[1], 
         xlab = expression(bar(x)[" n = 100"]), ylab = "", 
         axes = FALSE)
axis(1)
dev.off()