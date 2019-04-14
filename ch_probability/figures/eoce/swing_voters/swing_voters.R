# load openintro package for colors ---------------------------------
library("openintro")

# draw venn diagram -------------------------------------------------
venn.plot <- draw.pairwise.venn(
  area1 = 35,
  area2 = 23,
  cross.area = 11,
  category = c("Independent", "Swing"),
  fill = c(COL[1,3], COL[2,3]),
  lty = "blank",
  cex = 2,
  cat.cex = 2,
  cat.pos = c(310, 105),
  cat.dist = 0.09,
  cat.just = list(c(-1, -1), c(1, 1)),
  ext.pos = 30,
  ext.dist = -0.05,
  ext.length = 0.85,
  ext.line.lwd = 2,
  ext.line.lty = "dashed"
);
grid.draw(venn.plot)

tiff(filename = "swing_voters.tiff", compression = "lzw");
grid.draw(venn.plot);
dev.off();