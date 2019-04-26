library(openintro)

d <- penetrating_oil

myPDF("torque_on_rusty_bolt_dot_plot.pdf", 7, 3.2,
    mar = c(3.5, 6.5, 0.1, 0.3),
    mgp = c(2.3, 0.55, 0))
dotPlot(d$torque, d$treatment,
    pch = 19, col = COL[1, 2], cex = 2,
    vertical = FALSE,
    xlab = paste(
        "Torque Required to Loosen Rusty Bolt,",
        "in Foot-Pounds"),
    ylab = "")
abline(h = 1:8, col = COL[5, 7])
dev.off()

anova(lm(d$torque ~ d$treatment))

