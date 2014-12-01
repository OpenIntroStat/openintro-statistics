library(openintro)
oiB = "#3E9BC0"

load("surveyS12.Rdata")

###

myPDF("rel_hist.pdf", height = 2.4, width = 5, mar=c(3.3,2.2,1,1), las=1, mgp=c(2.2,0.55,0), mfrow = c(1,1))

histPlot(survey$excl_relation, breaks=-1:10+0.5, col = oiB, xlab = "Number of exclusive relationships", ylab = "", axes = FALSE, xlim=c(0.2, 10.7))
axis(2, at = c(0,25,50))
axis(1) #, at = c(1:10), labels = c(1,NA,NA,4,NA,NA,7,NA,NA,10))
abline(h = 0)

dev.off()