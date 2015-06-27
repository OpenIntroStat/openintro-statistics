library(openintro)
data(email)
email$spam <- ifelse(email$spam == 0, "not spam", "spam")
tab <- table(email[,c('spam', 'number')])
tab  <- t(tab)

rp <- prop.table(tab, 1)
cp <- prop.table(tab, 2)

myPDF("emailNumberMosaic.pdf",
      2.625,
      2.25,
      mar = rep(1, 4) / 4)
mosaicplot(rowSums(tab),
           main = '',
           xlab = '',
           ylab = '',
           off = 4,
           col = COL[c(2,1,4)])
dev.off()
colnames(tab)[1] <- "not\nspam"

email$spam[email$spam == "not spam"] <- "not    \nspam"
myPDF("emailSpamNumberMosaic.pdf",
      3,
      2.25,
      mar = c(0.25, 2, 1, 1))
MosaicPlot(number ~ spam, email,
           col = COL[c(2, 1, 4)],
           off = 0.02)
dev.off()

myPDF("emailSpamNumberMosaicRev.pdf",
      3,
      2.25,
      mar = rep(1, 4) / 4)
colnames(tab)[1] <- "not spam"
mosaicplot(t(tab),
           main = '',
           xlab = '',
           ylab = '',
           col = COL[c(2, 1, 4)])
dev.off()

