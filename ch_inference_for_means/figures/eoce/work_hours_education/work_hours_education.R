# load packages -----------------------------------------------------
library(openintro)
library(xtable)

# load data ---------------------------------------------------------
load("gss2010.Rda")
gss <- gss2010

# subset & clean data -----------------------------------------------
gss_sub <- gss[which(!is.na(gss$hrs1) & !is.na(gss$degree)), ]
gss_sub <- gss_sub[, which(names(gss_sub) == "degree" | names(gss_sub) == "hrs1")]
levels(gss_sub$degree) <- c("Less than HS","HS","Jr Coll","Bachelor's","Graduate")

# plot --------------------------------------------------------------

pdf("work_hours_education.pdf", height = 2.5, width = 8)

par(mar = c(2,3.5,0.5,.5), mgp = c(2.3,0.7,0), las = 1)

boxPlot(gss_sub$hrs1, fact = gss_sub$degree, 
        col = COL[1,2], ylab = "Hours worked per week", xlim=c(0.6, 5.4),
        lcol = COL[1], lwd = 1.5, medianLwd = 2.5)
dev.off()

# summary stats -----------------------------------------------------

round(by(gss_sub$hrs1, gss_sub$degree, mean),2)
round(by(gss_sub$hrs1, gss_sub$degree, sd),2)
by(gss_sub$hrs1, gss_sub$degree, length)

# anova -------------------------------------------------------------

xtable(anova(lm(gss_sub$hrs1 ~ gss_sub$degree)), digits = 2)
