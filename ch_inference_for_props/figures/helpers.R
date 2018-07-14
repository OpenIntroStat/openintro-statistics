
RunSimulation <- function(p, n.sim, samp.size, xlim, xlab, show = "n") {

  samples <- matrix(sample(0:1, n.sim * samp.size, TRUE, c(1 - p, p)), n.sim)
  results <- apply(samples, 1, mean)
  breaks <- seq(-0.0025, 1.0025, 0.005)
  if (samp.size < 100) {
    breaks <- seq(-0.01, 1.01, 0.02)
  }
  if (missing(xlim)) {
    xlim <- range(results)
  }
  if (missing(xlab)) {
    xlab <- "Sample Proportions"
  }
  histPlot(results,
      col = COL[1], breaks = breaks,
      xlim = xlim,
      xlab = xlab,
      ylab = "",
      axes = FALSE)
  spread <- format(c(0.001, round(sqrt(p * (1 - p) / samp.size), 3)))[2]
  main <- bquote(
      "n = "*.(samp.size)~~~~~
      mu[hat(p)]*" = "*.(p)~~~~~
      sigma[hat(p)]*" = "*.(spread))
  if (show == "p") {
    main <- bquote(
        "p = "*.(p)~~~~~
        sigma[hat(p)]*" = "*.(spread))
  }
  mtext(main, line = 0.4, cex = 0.9)
  if (all(xlim == c(0, 1))) {
    at1 <- seq(0, 1, 0.1)
    at2 <- seq(0, 1, 0.2)
  } else {
    at1 <- seq(0, 1, 0.025)
    at2 <- seq(0, 1, 0.05)
  }
  axis(1, at = at1, labels = rep("", length(at1)))
  axis(1, at = at2)
  # axis(2, at = seq(0, 1200, 100), label = rep("", 13))
  # axis(2, at = seq(0, 1200, 200))
  results
}
