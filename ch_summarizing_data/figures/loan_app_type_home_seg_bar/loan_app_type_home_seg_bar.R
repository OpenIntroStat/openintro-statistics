library(openintro)

tab <- table(loans_full_schema[, c("application_type", "homeownership")])
tab <- t(tab)

rp <- prop.table(tab, 1)
cp <- prop.table(tab, 2)

myPDF("loan_app_type_home_seg_bar.pdf",
      4.5,
      3.5,
      mar = c(2, 3, 0.5, 0.5),
      mgp = c(2.2, 0.6, 0))
barplot(apply(tab, 1, sum),
        col = COL[3])
tabTemp <- tab[,1]
names(tabTemp) <- NULL
barplot(tabTemp,
        col = COL[1],
        add = TRUE,
        axes = FALSE)
abline(h = 0)
legend("topright",
       fill = COL[c(3,1)],
       legend = c("joint", "individual"))
dev.off()

myPDF("loan_app_type_home_seg_bar_standardized.pdf",
      4.5,
      3.5,
      mar = c(2, 2.5, 0.5, 0.5),
      mgp = c(2.2, 0.6, 0))
barplot(apply(tab, 1, sum) / apply(tab, 1, sum), col = COL[3])
tabTemp <- rp[, 1]
names(tabTemp) <- NULL
barplot(tabTemp,
        col = COL[1],
        add = TRUE,
        axes = FALSE)
abline(h = 0)
dev.off()

