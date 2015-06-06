library(openintro)
source("SamplingMethodsFunctions.R")
data(COL)
set.seed(4)
N <- 108
n <- 18
colSamp <- COL[4]
PCH <- rep(c(1, 3, 20)[3], 3)

col <- rep(COL[1], N)
pch <- PCH[match(col, COL)]

# BuildSystematic()


set.seed(4)
myPDF("simple_stratified.pdf", 7.4, 7.5,
      mar = rep(0.5,4), mfrow = c(2,1))
BuildSRS()
BuildStratified()
dev.off()


set.seed(4)
myPDF("cluster_multistage.pdf", 7.4, 7.5,
      mar = rep(0.5,4), mfrow = c(2,1))
BuildCluster()
BuildMultistage()
dev.off()
