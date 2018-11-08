library(openintro)
data(countyComplete)
cc <- countyComplete
data(COL)

w3  <- 1 == 0
ind <- 413

if(w3){
  myPNG("MHP.png", 1200, 800,
        mar = c(3, 3.5, 0.5, 0.5),
        mgp = c(2.4, 0.5, 0),
        cex = 2)
} else {
  myPDF("multiunitsVsOwnership.pdf", 6, 3.5,
        mar = c(3, 3.5, 0.5, 0.5),
        mgp = c(2.4, 0.4, 0))
}
pch    <- 1
cex    <- sqrt(cc$pop2017 / 1e6)
colPop <- fadeColor(ifelse(cex > 0.35, COL[4], COL[1]),
                    substr(gray(0.6 + cex * 0.1), 2, 3))
colSm  <- colPop
cexF   <- 2
if(!w3){
  cex <- 0.7
  pch <- 20
  gp1 <- cex < 0.32
  colSm  <- COL[1, 3]
  colPop <- COL[1, 3]
  cexF   <- 1
}
x <- cc$housing_multi_unit
y <- cc$home_ownership
plot(x[gp1], y[gp1],
     pch = pch,
     col = colSm,
     xlab = "",
     ylab = "Percent of Homeownership",
     axes = FALSE,
     cex = ifelse(cex < 0.32, 0.32, cex)[gp1],
     xlim = c(0, 100), # range(x, na.rm = TRUE),
     ylim = range(y, na.rm = TRUE))
at  =  seq(0, 100, 20)
axis(1, at, paste0(at, "%"))
axis(2, at, paste0(at, "%"))
abline(h = at, v = at, col = COL[7, 2])
box()
points(x[!gp1], y[!gp1],
       pch = pch,
       col = colPop,
       xlab = "",
       ylab = "Percent of Homeownership",
       cex = ifelse(cex < 0.32, 0.32, cex)[!gp1])
points(cc$housing_multi_unit[!gp1],
       cc$home_ownership[!gp1],
       pch = '.')
t1 <- x[ind]
t2 <- y[ind]
lines(c(t1, t1), c(-1e5, t2),
      lty = 2,
      col = COL[4])
lines(c(-1e5, t1), c(t2, t2),
      lty = 2,
      col = COL[4])
points(t1, t2,
       col = COL[4])
mtext("Percent of Units in Multi-Unit Structures",
      1,
      1.9,
      cex = ifelse(w3, 2, 1))

if(w3){
  usr <- par("usr")
  szs <- c(0.1, 0.4, 2, 5)
  cex <- sqrt(szs) # *c(1.2, 1.1, 1, 1)
  szs <- format(szs)
  szs[1] <- paste("<", szs[1])
  text(102, 95-5, "Population Size", pos = 2)
  colPop <- rgb(ifelse(cex > 0.35, 1, 0),
                0.15 * cex, 0.05 * cex,
                0.6 + cex * 0.1)
  for(i in 1:4){
    points(82, 89 - 5 * i,
           cex = cex[i],
           col = colPop[i])
    txt <- paste(szs[i], "million")
    text(101, 89 - 5 * i, txt, pos = 2)
  }
  rect(78, 63, 120, 120)
  text(25, 10,
       "Counties with >100,000 people are colored red")
}

dev.off()

county[ind, ]
