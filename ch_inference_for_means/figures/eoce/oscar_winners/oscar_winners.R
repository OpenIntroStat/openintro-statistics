# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------
data(oscars)

# plot of oscar winner women and men ages ---------------------------
p <- oscars %>%
  mutate(award = ifelse(gender == "female", "Best Actress", "Best Actor")) %>%
  ggplot(aes(x = age)) +
    geom_histogram(binwidth = 10, fill = COL[1,1], color = COL[5,1], size = 0.3) +
    facet_wrap(~award, nrow = 2) +
    theme_minimal() +
    labs(x = "Age (in years)", y = "")

ggsave(p, file = "ch_inference_for_means/oscar_winners/figures/oscars_winners_hist.pdf",
       height = 6, width = 8)

# summary stats -----------------------------------------------------
oscars %>%
  group_by(gender) %>%
  summarise(
    mean = mean(age),
    sd = sd(age),
    n = n()
  )
