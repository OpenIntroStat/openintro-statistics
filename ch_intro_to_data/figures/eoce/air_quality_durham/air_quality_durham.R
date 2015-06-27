# load openintro package for colors ---------------------------------
library(openintro)

# load data ---------------------------------------------------------
pm25_durham = read.csv("pm25_2011_durham.csv", 
                       na.strings = ".", stringsAsFactors = FALSE)

# calculate sample size ---------------------------------------------
n = pm25_durham %>%
  filter(!is.na(DAILY_AQI_VALUE)) %>%
  nrow() # n = 91

# histogram parameters ----------------------------------------------
histo = hist(pm25_durham$DAILY_AQI_VALUE, plot = FALSE)
breaks = histo$breaks
width = breaks[2] - breaks[1]
counts = histo$counts
rel_freqs = round(counts / n, 2)

five_perc = n * 0.05

# relative frequency histogram --------------------------------------
pdf("air_quality_durham_rel_freq_hist.pdf", 5.5, 4.3)
par(mar = c(4, 4.1, 1, 1), las = 1, mgp = c(2.9, 0.7, 0), 
    cex.axis = 1.5, cex.lab = 1.5)
hist(pm25_durham$DAILY_AQI_VALUE, 
     main = "", xlab = "Daily AQI", ylab = "",
     col = COL[1], axes = FALSE, ylim = c(0,five_perc*4))
axis(1)
axis(2, at = seq(0, five_perc*4, five_perc), label = round(seq(0, 0.20, 0.05),2))
abline(h = seq(0, five_perc*4, five_perc), lty = 2, col = COL[6])
hist(pm25_durham$DAILY_AQI_VALUE, 
     main = "", xlab = "Daily AQI", ylab = "",
     col = COL[1], axes = FALSE, ylim = c(0,five_perc*4), add = TRUE)
dev.off()

# relative frequency histogram - solution ---------------------------
pdf("air_quality_durham_rel_freq_hist_soln.pdf", 5.5, 4.3)
par(mar = c(4, 4.1, 1, 1), las = 1, mgp = c(2.9, 0.7, 0), 
    cex.axis = 1.5, cex.lab = 1.5)
hist(pm25_durham$DAILY_AQI_VALUE, 
     main = "", xlab = "Daily AQI", ylab = "",
     col = COL[1], axes = FALSE, ylim = c(0, five_perc*4 + 1))
axis(1)
axis(2, at = seq(0, five_perc*4, five_perc), label = round(seq(0, 0.20, 0.05),2))
abline(h = seq(0, five_perc*4, five_perc), lty = 2, col = COL[6])
hist(pm25_durham$DAILY_AQI_VALUE, 
     main = "", xlab = "Daily AQI", ylab = "",
     col = COL[1], axes = FALSE, ylim = c(0, five_perc*4), add = TRUE)
text(x = breaks[-1] - width/2, y = counts + 1, 
     labels = paste(rel_freqs),
     col = COL[4], cex = 1)
dev.off()