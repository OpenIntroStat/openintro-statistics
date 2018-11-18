library(openintro)
tab <- table(loans_full_schema[,c('application_type', 'homeownership')])
attr(tab, "dimnames")$homeownership <- tolower(attr(tab, "dimnames")$homeownership)
tab  <- t(tab)

rp <- prop.table(tab, 1)
cp <- prop.table(tab, 2)

myPDF("loan_home_mosaic.pdf",
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
# colnames(tab)[1] <- "not\nspam"

myPDF("loan_app_type_home_mosaic.pdf",
      3,
      2.25,
      mar = c(0.25, 2, 1, 1))
levels(loans_full_schema$application_type)[1] <- "indiv."
MosaicPlot(homeownership ~ application_type, loans_full_schema,
           col = COL[c(2, 1, 4)],
           off = 0.02)
dev.off()

myPDF("loan_app_type_home_mosaic_rev.pdf",
      3 / 1.2,
      2.25 / 1.5,
      mar = rep(1, 4) / 4)
# colnames(tab)[1] <- "not spam"
mosaicplot(t(tab),
           main = '',
           xlab = '',
           ylab = '',
           col = COL[c(2, 1, 4)])
dev.off()

