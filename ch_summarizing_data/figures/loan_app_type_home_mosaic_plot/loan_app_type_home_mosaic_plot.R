if ("loans_full_schema" %in% ls()) {
  rm(loans_full_schema)
}
library(openintro)

# There are some levels for the factor variables below that don't
# have any observations, so they create zeros and break the visuals.
# The next lines address that while ensuring a consistent order of
# the levels for the plots.
application_type_order <- c("individual", "joint")
loans_full_schema$application_type <- factor(
  as.character(loans_full_schema$application_type),
  levels = application_type_order
)
homeownership_order <- c("rent", "mortgage", "own")
loans_full_schema$homeownership <- factor(
  tolower(as.character(loans_full_schema$homeownership)),
  levels = homeownership_order
)

tab <- table(loans_full_schema[,c('application_type', 'homeownership')])
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

