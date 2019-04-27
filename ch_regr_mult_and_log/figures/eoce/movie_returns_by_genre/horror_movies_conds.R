# load packages ----------------------------------------------------------------
library(tidyverse)
library(lubridate)
library(openintro)
library(broom)

# load data --------------------------------------------------------------------
movie_profit <- read_csv("movie_profit.csv") %>%
  select(-X1)


# fix dates --------------------------------------------------------------------
movie_profit <- movie_profit %>%
  mutate(
    release_date = mdy(release_date),
    release_year = year(release_date),
    oct_release = ifelse(month(release_date) == 10, "yes", "no"),
    dom_gross_to_prod = domestic_gross / production_budget,
    ww_gross_to_prod = worldwide_gross / production_budget
    ) 

# subset for movies after 2000 -------------------------------------------------
movie_profit_2000 <- movie_profit %>%
  filter(
    release_year >= 2010,
    release_year < 2019
    )

# mlr --------------------------------------------------------------------------

m <- lm(ww_gross_to_prod ~ release_year + genre, data = movie_profit_2000)
m_aug <- augment(m)

# residuals against fitted -----------------------------------------------------

cols <- c(
  "Action" = COL[1,1],
  "Adventure" = COL[2,1],
  "Comedy" = COL[3,1],
  "Drama" = COL[4,1],
  "Horror" = COL[5,1]
)

ggplot(m_aug, aes(y = .fitted, x = ww_gross_to_prod, color = genre)) + 
  geom_point(alpha = 0.5) +
  facet_wrap(~genre, scales = "free_x") +
  theme_minimal() + 
  labs(x = "Actual ROI", y = "Predicted ROI", color = "Genre") +
  scale_color_manual(values = cols) +
  guides(color = FALSE) +
  geom_abline(yintercept = 0, slope = 1)
  
ggsave(filename = "horror_movies_by_genre.pdf",
       width = 5.5, height = 4.3)
