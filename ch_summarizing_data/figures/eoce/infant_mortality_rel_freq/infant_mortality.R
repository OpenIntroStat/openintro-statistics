# load packages -----------------------------------------------------
library(openintro)
library(dplyr)

# load data ---------------------------------------------------------
load("factbook.rda")
# this dataset will also be available in the cia_factbook package
# with the same name

# calculate # of countries with life exp. & internet data -----------
cia_factbook %>%
  subset(!is.na(infant_mortality_rate)) %>%
  nrow() # n = 224

# histogram parameters ----------------------------------------------
histo = hist(cia_factbook$infant_mortality_rate, plot = FALSE)
breaks = histo$breaks
width = breaks[2] - breaks[1]
counts = histo$counts
n = sum(counts)
rel_freqs = round(counts / n, 2)

five_perc = n * 0.05

# rel. freq. histogram of infant mortality --------------------------
pdf("infant_mortality_rel_freq_hist.pdf", 5.5, 3)
par(mar = c(4, 4.1, 1, 1), las = 1, mgp = c(2.9, 0.7, 0), 
    cex.axis = 1.5, cex.lab = 1.5)
hist(cia_factbook$infant_mortality_rate, 
     main = "",
     xlab = "Infant Mortality (per 1000 Live Births)",
     ylab = "Fraction of Countries",
     col = COL[1], axes = FALSE, ylim = c(0,five_perc*8))
axis(1)
axis(2, at = seq(0, 8 * five_perc, 2 * five_perc),
     labels = seq(0, 0.4, 0.1))
axis(2, at = seq(five_perc, 7 * five_perc, 2 * five_perc),
     labels = rep("", 4), tcl = -0.25)
abline(h = seq(0, five_perc*8, five_perc), lty = 2, col = COL[6])
hist(cia_factbook$infant_mortality_rate, 
     main = "", xlab = "", ylab = "",
     col = COL[1], axes = FALSE, add = TRUE)
dev.off()

# rel. freq. histogram of infant mortality  - solution --------------
summary(cia_factbook$infant_mortality_rate)

pdf("infant_mortality_rel_freq_hist_soln.pdf", 6, 3.2)
par(mar = c(4, 4.1, 1, 1), las = 1, mgp = c(2.9, 0.7, 0), 
    cex.axis = 1.5, cex.lab = 1.5)
hist(cia_factbook$infant_mortality_rate, 
     main = "",
     xlab = "Infant Mortality (per 1000 Live Births)",
     ylab = "Fraction of Countries",
     col = COL[1], axes = FALSE, ylim = c(0,five_perc*8))
axis(1)
axis(2, at = seq(0, five_perc*8, five_perc), label = c(0, NA, 0.1, NA, 0.2, NA, 0.3, NA, 0.4))
abline(h = seq(0, five_perc*8, five_perc), lty = 2, col = COL[6])
hist(cia_factbook$infant_mortality_rate, 
     main = "", xlab = "", ylab = "",
     col = COL[1], axes = FALSE, add = TRUE)
text(x = breaks[-1] - width/2, y = counts + 5, 
     labels = paste(rel_freqs),
     col = COL[4], cex = 1)
dev.off()