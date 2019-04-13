# load packages ----------------------------------------------------------------
library(tidyverse)
library(openintro)
library(unvotes)
library(lubridate)

# plot unvotes by issues -------------------------------------------------------

un_votes %>%
  mutate(country = ifelse(country == "United States of America", "US", country)) %>%
  filter(country %in% c("US", "Mexico", "Canada")) %>%
  inner_join(un_roll_calls, by = "rcid") %>%
  inner_join(un_roll_call_issues, by = "rcid") %>%
  mutate(
    issue = ifelse(issue == "Nuclear weapons and nuclear material", "Nuclear weapons and materials", issue),
    vote = fct_relevel(vote, "yes", "no", "abstain")
    ) %>%
  group_by(country, year = year(date), issue) %>%
  summarize(
    votes = n(),
    percent_yes = mean(vote == "yes")
  ) %>%
  filter(votes > 5) %>%  # only use records where there are more than 5 votes
  ggplot(mapping = aes(x = year, y = percent_yes, color = country)) +
    geom_point(alpha = 0.5) +
    geom_smooth(method = "loess", se = FALSE) +
    facet_wrap(~ issue) +
    labs(
      y = "% Yes",
      x = "Year",
      color = "Country"
    ) +
    theme_minimal() +
    scale_color_manual(values = c(COL[1,1], COL[2,1], COL[4,1]))

# save plot --------------------------------------------------------------------
ggsave(here::here("ch_intro_to_data/unvotes/figures/", "unvotes.png"), width = 7, height = 4)
