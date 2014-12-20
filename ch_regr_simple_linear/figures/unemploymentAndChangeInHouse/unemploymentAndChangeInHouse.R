rm(list=ls())
library(openintro)
data(COL)
data(unempl)
data(house)
data(president)
h <- house
pres <- president


year   <- seq(1898, 2010, 4) + 1
n      <- length(year)
unemp  <- rep(0, n)
change <- rep(0, n)
presid <- rep("", n)
party  <- rep("", n)
for (i in 1:n) {
  urow <- which(unempl$year == year[i]-1)
  if (i < n) {
    prow <- which(pres$end > year[i])[1]
  } else {
    prow <- which(pres$potus == "Barack Obama")
  }
  hrow <- which(h$yearEnd >= year[i])[1]
  party[i] <- as.character(pres$party[prow])
  if (substr(h$p1[hrow], 1, 5) == substr(party[i], 1, 5)) {
    oldHouse <- h$np1[hrow] / h$seats[hrow]
  } else {
    oldHouse <- h$np2[hrow] / h$seats[hrow]
  }
  if (substr(h$p1[hrow + 1], 1, 5) == substr(party[i], 1, 5)) {
    newHouse <- h$np1[hrow + 1] / h$seats[hrow + 1]
  } else {
    newHouse <- h$np2[hrow + 1] / h$seats[hrow + 1]
  }
  change[i] <- (newHouse - oldHouse) / oldHouse * 100
  presid[i] <- as.character(pres$potus[prow])
  unemp[i]  <- unempl$unemp[urow]
}

unemployPres <- data.frame(year = year,
                           potus = presid,
                           party = party,
                           unemp = unemp,
                           change = change)

myPDF("unemploymentAndChangeInHouse.pdf", 7.2, 4.2,
      mar = c(3.2, 5, 0.5, 0.5))
th <- !year %in% c(1935, 1939)
plot(unemployPres$unemp[th], unemployPres$change[th],
     col = COL[ifelse(unemployPres$party[th] == "Republican", 4, 1)],
     pch = 19,
     xlim = c(3, 12),
     ylim = c(-30, 13),
     axes = FALSE,
     type = 'n',
     xlab = '',
     ylab = paste0("Percent change in seats of\n",
                  "president's party in House of Rep."))
mtext('Percent unemployment', 1, 2)
rect(-1000, -1000,
     1000, 1000,
     col = COL[7,3])
abline(h = seq(-100, 100, 10), col = '#FFFFFF', lwd = 2)
abline(h = seq(-105, 100, 10), col = '#FFFFFF', lwd = 0.7)
abline(h = 0, col = '#FFFFFF', lwd = 4)
abline(v = seq(-100, 100, 4), col = '#FFFFFF', lwd = 2)
abline(v = seq(-102, 100, 4), col = '#FFFFFF', lwd = 0.7)
repub <- (unemployPres$party[th] == "Republican")
points(unemployPres$unemp[th], unemployPres$change[th],
       col = COL[ifelse(repub, 4, 1)],
       pch = ifelse(repub, 17, 19))
axis(1, at = c(4, 8, 12))
axis(2)
box()
cases <- c(1, 22, 26, 27, 29)
for (i in 1:length(cases)) {
  potus  <- as.character(unemployPres$potus[cases[i]])
  potus  <- tail(strsplit(potus, " ")[[1]], 1)
  year   <- unemployPres$year[cases[i]]-1
  potus  <- paste0(potus, "\n", year)
  unem   <- unemployPres$unemp[cases[i]]
  change <- unemployPres$change[cases[i]]
  text(unem, change, potus, pos = 3, cex = 0.6)
}

summary(lm(change ~ unemp, unemployPres))

g <- lm(change ~ unemp, unemployPres[th,])
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
