# load openintro package for colors ---------------------------------
library(openintro)

# load data ---------------------------------------------------------
load("factbook.rda")
# this dataset will also be available in the cia_factbook package
# with the same name

# calculate % of internet users -------------------------------------
cia_factbook$internet_perc = cia_factbook$internet_users / cia_factbook$population * 100

# calculate # of countries with life exp. & internet data -----------
cia_factbook %>%
  filter(!is.na(internet_perc)) %>%
  filter(!is.na(life_exp_at_birth)) %>%
  nrow() # n = 208

# scatterplot of gpa vs. study hours --------------------------------
pdf("internet_life_expactancy.pdf", 5.5, 4.3)
par(mar = c(4, 4.1, 1, 1), las = 1, mgp = c(2.9, 0.7, 0), 
    cex.axis = 1.5, cex.lab = 1.5)
plot(cia_factbook$life_exp_at_birth ~ cia_factbook$internet_perc, 
     xlab = "% Internet users", ylab = "Life expectancy at birth", 
     pch = 20, col = COL[1,2], cex.lab = 1.5, cex.axis = 1.5, xlim = c(0,100))
dev.off()