rm(list=ls())
library(openintro)

d <- midterms_house

myPDF("unemploymentAndChangeInHouse.pdf", 7.2, 4.2,
      mar = c(3.2, 5.3, 0.5, 0.5),
      mgp = c(3.2, 0.55, 0))
th <- !d$year %in% c(1935, 1939)
plot(d$unemp[th], d$house_change[th],
     # col = COL[ifelse(d$party[th] == "Republican", 4, 1)],
     pch = 19,
     xlim = c(3, 12),
     ylim = c(-30, 13),
     axes = FALSE,
     type = 'n',
     xlab = '',
     ylab = paste0("Percent Change in Seats of\n",
                  "President's Party in House of Rep."))
mtext('Unemployment Rate', 1, 2)
abline(h = seq(-100, 100, 10), col = COL[7, 3], lwd = 2)
abline(h = seq(-105, 100, 10), col = COL[7, 3], lwd = 0.7)
abline(v = seq(-100, 100, 4), col = COL[7, 3], lwd = 2)
abline(v = seq(-102, 100, 4), col = COL[7, 3], lwd = 0.7)
repub <- (d$party[th] == "Republican")
points(d$unemp[th], d$house_change[th],
       col = COL[ifelse(repub, 4, 1)],
       pch = ifelse(repub, 17, 19))
AxisInPercent(1, at = seq(0, 20, 4))
AxisInPercent(2, at = seq(-100, 100, 10))
box()
cases <- c(1, 22, 25, 27, 29, 31)
for (i in 1:length(cases)) {
  potus  <- as.character(d$potus[cases[i]])
  potus  <- tail(strsplit(potus, " ")[[1]], 1)
  year   <- d$year[cases[i]]-1
  potus  <- paste0(potus, "\n", year)
  unem   <- d$unemp[cases[i]]
  change <- d$house_change[cases[i]]
  text(unem, change, potus, pos = 3, cex = 0.6)
}

summary(lm(house_change ~ unemp, d))

g <- lm(house_change ~ unemp, d[th,])
summary(g)
abline(g, col = COL[5])
legend('topright',
       bg = "#FFFFFF",
       pch = c(19, 17),
       col = COL[c(1, 4)],
       legend = c("Democrat", "Republican"))
dev.off()

# library(xtable)
# xtable(g)
# acf(g$residual)
