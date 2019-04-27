library(openintro)
d <- climate70$dx90_2018 - climate70$dx90_1948
mean(d)
sd(d)
length(d)
t.test(d)


myPDF("global_warming_v2_1_diffs.pdf", 4, 3,
    mar = c(3.9, 2, 0.5, 0.5))
histPlot(d, col = COL[1], 
    xlab = "Differences in Number of Days",
    ylab = "")
axis(1)
dev.off()