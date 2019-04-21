# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------
data(oscars)

# plot of oscar winner women and men ages ---------------------------
p <- oscars %>%
  ggplot(aes(x = age)) +
    geom_histogram(binwidth = 10, fill = COL[1,1], color = COL[5,1], size = 0.3) +
    facet_wrap(~fct_rev(award), ncol = 1) +
    theme_minimal() +
    theme(strip.text = element_text(hjust = 0)) +
    labs(x = "Age (in years)", y = "")

ggsave(p, file = "ch_intro_to_data/oscar_winners/figures/oscars_winners_hist.pdf",
       height = 6, width = 8)

# summary stats -----------------------------------------------------
oscars %>%
  group_by(award) %>%
  summarise(
    mean = mean(age),
    sd = sd(age),
    n = n()
  )
