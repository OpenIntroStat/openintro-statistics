# load packages -----------------------------------------------------
library(openintro)
library(forcats)

# load data ---------------------------------------------------------
data(oscars)

# plot of oscar winner women and men ages ---------------------------
myPDF("oscars_winners_hist.pdf", 5, 3.15)
oscars %>%
  ggplot(aes(x = age)) +
    geom_histogram(binwidth = 10, fill = COL[1,1], color = COL[5,1], size = 0.3) +
    facet_wrap(~fct_rev(award), ncol = 1) +
    theme_minimal() +
    theme(strip.text = element_text(hjust = 0)) +
    labs(x = "Age (in years)", y = "")
dev.off()

# summary stats -----------------------------------------------------
oscars %>%
  group_by(award) %>%
  summarise(
    mean = mean(age),
    sd = sd(age),
    n = n()
  )
