# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------
data(ageAtMar)

# histogram of age at first marriage --------------------------------
pdf("age_at_first_marriage_intro_hist.pdf", height = 2.7, width = 6)
par(mar=c(3.3,2.7,0.5,0.5), las=1, mgp=c(2.2,0.55,0), cex.lab = 1.1)
histPlot(ageAtMar$age, col = COL[1], xlab = "Age at first marriage", ylab = "")
dev.off()