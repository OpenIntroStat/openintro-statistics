# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------
cle_sac <- read.table("cleveland_sacramento.txt", h = T, sep = "\t")

# take a sample -----------------------------------------------------
cle_sac = cle_sac[!is.na(cle_sac$Total_personal_income),]

set.seed(8957)
sac = sample(cle_sac$Total_personal_income[cle_sac$Metropolitan_area_Detailed == "Sacramento_ CA"], 17)
cle = sample(cle_sac$Total_personal_income[cle_sac$Metropolitan_area_Detailed == "Cleveland_ OH"], 21)

# plot of total personal income in Cle and Sac ----------------------
pdf("cleveland_sacramento_hist.pdf", height = 5, width = 7)

par(mar = c(3.7, 2, 1,1), las = 1, mgp = c(2.5, 0.7, 0), 
    mfrow = c(2,1), cex.lab = 1.25)

histPlot(cle, xlim = c(0, 180000), ylim = c(0,10),
         ylab = "", xlab = "", col = COL[1], breaks = 8, axes = FALSE)
axis(1, at = seq(0,180000,45000))
axis(2, at = seq(0,10,5))
text(x = 120000, y = 8, labels = "Cleveland, OH", pos = 4, cex = 1.25)

histPlot(sac, xlim = c(0,180000), ylim = c(0,10), 
         ylab = "", xlab = "Total personal income", col = COL[1], breaks = 8,
         axes = FALSE)
axis(1, at = seq(0,180000,45000))
axis(2, at = seq(0,10,5))
text(x = 120000, y = 8, labels = "Sacramento, CA", pos = 4, cex = 1.25)

dev.off()

# summary stats -----------------------------------------------------
mean(cle, na.rm = TRUE)
sd(cle, na.rm = TRUE)
length(cle)

mean(sac, na.rm = TRUE)
sd(sac, na.rm = TRUE)
length(sac)
