# load openintro package for colors ---------------------------------
library(openintro)

# create data -------------------------------------------------------

ideology = c(rep("Conservative", 372), rep("Moderate", 363), rep("Liberal", 175))
ideology = factor(ideology, levels = c("Conservative", "Moderate", "Liberal"))
dream = c(rep("Support", 186), rep("Not support", 151), rep("Not sure", 35), 
          rep("Support", 174), rep("Not support", 161), rep("Not sure", 28),
          rep("Support", 114), rep("Not support", 52), rep("Not sure", 9)
)
dream = factor(dream, levels = c("Support", "Not support", "Not sure"))


# mosaicplot --------------------------------------------------------

pdf("dream_act_mosaic.pdf", 7, 3)
par(mar=c(0.5,0,0.25,0.5), las=1, mgp=c(4,1,0))

mosaicplot(ideology ~ dream, main = "", cex.axis = 1.1, 
           xlab = "", ylab = "", color = COL[1])

dev.off()