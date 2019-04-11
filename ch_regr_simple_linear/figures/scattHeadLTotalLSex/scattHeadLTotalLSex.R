library(openintro)

myPDF('scattHeadLTotalLSex.pdf', 5, 3,
    mar = c(3.5, 3.5, 0.5, 0.5),
    mgp = c(2.4, 0.55, 0))
plot(possum$totalL, possum$headL,
    pch = ifelse(possum$sex == "m", 1, 3),
    col = ifelse(possum$sex == "m", COL[1, 1], COL[4, 1]),
    lwd = ifelse(possum$sex == "m", 2, 3),
    cex = ifelse(possum$sex == "m", 1.2, 0.7),
    xlab = 'Total Length (cm)',
    ylab = 'Head Length (mm)')
legend("topleft", pch = c(1, 3), col = COL[c(1, 4)], cex = 0.9,
    legend = c("Male", "Female"))
dev.off()
