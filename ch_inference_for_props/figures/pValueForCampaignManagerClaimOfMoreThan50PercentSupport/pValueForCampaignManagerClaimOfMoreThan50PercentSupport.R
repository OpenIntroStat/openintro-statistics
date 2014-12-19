require(openintro)
data(COL)

fn <- paste0('pValueForCampaignManagerClaimOf',
             'MoreThan50PercentSupport.pdf')
myPDF(fn, 3.5, 1.7,
      mar=c(1.7, 0, 0.1, 0),
      mgp=c(3, 0.5, 0))
normTail(U = 0.89, col = COL[1], axes = FALSE)
at <- c(-5, 0, 0.89, 5)
labels <- expression(0, 0.50, 0.52, 0)
axis(1, at, labels, cex.axis=0.9)
dev.off()
