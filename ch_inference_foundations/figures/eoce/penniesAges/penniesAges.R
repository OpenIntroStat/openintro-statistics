library(openintro)
data(COL)
load("penniesAges.Rda")
oiB = COL[1]

# plot population

pdf("penniesAges_pop.pdf", height = 3, width = 5.8)

par(mar=c(3.7,2,1,0.5), las=1, mgp=c(2.5,0.7,0), mfrow = c(1,1), cex.lab = 1.25, cex.axis = 1.25)

histPlot(penniesAges$age, col = oiB, xlab = "Penny ages", ylab = "", axes = FALSE)
axis(1)

dev.off()

# sample n = 5

set.seed(123)
xbar = c()
for(i in 1:5000){
	sub = sample(c(1:nrow(penniesAges)), size = 5, replace = TRUE)
	xbar = c(xbar, mean(penniesAges$age[sub]))
}
xbar5 = xbar

# plot xbar, n = 5

myPDF("penniesAges_n5.pdf", 3, 2.4, mar=c(3.5,1,1,1), las=1, mgp=c(2.1,0.4,0))

histPlot(xbar5, col = oiB, xlab = expression(bar(x)[" n = 5"]), ylab = "", axes = FALSE)

axis(1)

dev.off()

# sample n = 30

xbar = c()
for(i in 1:5000){
	sub = sample(c(1:nrow(penniesAges)), size = 30, replace = TRUE)
	xbar = c(xbar, mean(penniesAges$age[sub]))
}
xbar30 = xbar

# plot xbar, n = 30

myPDF("penniesAges_n30.pdf", 3, 2.4, mar=c(3.5,1,1,1), las=1, mgp=c(2.1,0.4,0))

histPlot(xbar30, col = oiB, xlab = expression(bar(x)[" n = 30"]), ylab = "", axes = FALSE)

axis(1)

dev.off()

# sample n = 100

xbar = c()
for(i in 1:5000){
	sub = sample(c(1:nrow(penniesAges)), size = 100, replace = TRUE)
	xbar = c(xbar, mean(penniesAges$age[sub]))
}
xbar100 = xbar

# plot xbar, n = 100

myPDF("penniesAges_n100.pdf", 3, 2.4, mar=c(3.5,1,1,1), las=1, mgp=c(2.1,0.4,0))

histPlot(xbar100, col = oiB, xlab = expression(bar(x)[" n = 100"]), ylab = "", axes = FALSE)

axis(1)

dev.off()