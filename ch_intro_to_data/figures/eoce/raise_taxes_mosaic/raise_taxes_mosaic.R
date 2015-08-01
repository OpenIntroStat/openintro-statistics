# load openintro package for colors ---------------------------------
library(openintro)

# create data -------------------------------------------------------
# based on http://www.publicpolicypolling.com/pdf/2015/PPP_Release_National_30215.pdf

n = 691

n_dem = round(n * 0.40)
n_rep = round(n * 0.34)
n_indep = 691 - (n_dem + n_rep)

party =  c(rep("Democrat", n_dem), rep("Republican", n_rep), rep("Indep / Other", n_indep))
party = factor(party, levels = c("Democrat", "Republican", "Indep / Other"))
taxes = c(rep("Raise taxes on the rich", round(n_dem * 0.91)), 
          rep("Raise taxes on the poor", round(n_dem * 0.04)), 
          rep("Not sure", round(n_dem * 0.05)),
          rep("Raise taxes on the rich", round(n_rep * 0.47)), 
          rep("Raise taxes on the poor", round(n_rep * 0.10)), 
          rep("Not sure", round(n_rep * 0.43)),
          rep("Raise taxes on the rich", round(n_indep * 0.49)), 
          rep("Raise taxes on the poor", round(n_indep * 0.11)), 
          rep("Not sure", round(n_indep * 0.40)) 
)
taxes = factor(taxes, levels = c("Raise taxes on the rich", "Raise taxes on the poor", "Not sure"))


# mosaicplot --------------------------------------------------------

pdf("raise_taxes_mosaic.pdf", 7, 3)
par(mar=c(0.5,0,0.2,0.5), las=1, mgp=c(4,1,0))

mosaicplot(party ~ taxes, main = "", cex.axis = 1.1, 
           xlab = "", ylab = "", color = COL[1])

dev.off()