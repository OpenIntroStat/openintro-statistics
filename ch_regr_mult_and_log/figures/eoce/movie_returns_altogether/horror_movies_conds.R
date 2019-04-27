# load packages ----------------------------------------------------------------
library(tidyverse)
library(lubridate)
library(openintro)
library(broom)

# load data --------------------------------------------------------------------
movie_profit <- read_csv("mine-new/ch_regr_mult_and_log/horror_movies/figures/movie_profit.csv") %>%
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

# histogram of residuals -------------------------------------------------------

pdf("horror_movies_conds_hist_res.pdf", 5.5, 4.3)

par(mar = c(4, 4.1, 1, 1), las = 1, mgp = c(2.9, 0.7, 0), 
    cex.axis = 1.5, cex.lab = 1.5)
histPlot(m_aug$.resid, breaks = seq(-25, 100, 5), 
         col = COL[1], 
         axes = FALSE, xlab="Residuals", ylab="")
axis(1)
axis(2, at = seq(0, 600, 200))

dev.off()

# residuals against fitted -----------------------------------------------------

cols <- c(
  "Action" = COL[1,1],
  "Adventure" = COL[2,1],
  "Comedy" = COL[3,1],
  "Drama" = COL[4,1],
  "Horror" = COL[5,1]
)

ggplot(m_aug, aes(y = .resid, x = .fitted, color = genre)) + 
  geom_point(alpha = 0.7) +
  theme_minimal() + 
  labs(x = "Fitted values", y = "Residuals", color = "Genre") +
  scale_color_manual(values = cols) +
  geom_hline(yintercept = 0, linetype = "dashed", size = 0.2)

ggsave(filename = "horror_movies_conds_res_genre_fitted.pdf",
       width = 5.5, height = 4.3)

# residuals in order of their data collection -----------------------

pdf("horror_movies_conds_res_order.pdf", 5.5, 4.3)

par(mar = c(3.7, 3.9, 0.5, 1), las = 1, mgp = c(2.7,0.7,0),
    cex.lab = 1.5, cex.axis = 1.5)

plot(m_aug$.resid ~ c(1:length(m$residuals)), 
     ylab = "Residuals", xlab = "Order of collection",
     pch = 19, col = COL[1,2],
     axes = FALSE)
axis(1, at = seq(0, 1000, 200))
axis(2, at = seq(-20, 80, 20))

abline(h = 0, lty = 2)

dev.off()

# residuals vs. release year ---------------------------------------------------

pdf("horror_movies_conds_res_year.pdf", 5.5, 4.3)

par(mar = c(3.9, 3.9, 0.5, 0.5), las = 1, mgp = c(2.7, 0.7,0),
    cex.lab = 1.5, cex.axis = 1.5)

plot(m_aug$.resid ~ m_aug$release_year, 
     ylab = "Residuals", xlab = "Release year", 
     pch = 19, col = COL[1,2],
     axes = FALSE)
axis(1, at = seq(2010, 2018, 1))
axis(2, at = seq(-20, 80, 20))

abline(h = 0, lty = 2)

dev.off()

# residuals vs. genre -------------------------------------------

ggplot(m_aug, aes(y = .resid, x = genre, color = genre)) +
  geom_jitter(alpha = 0.7) + 
  guides(color = FALSE) +
  scale_color_manual(values = cols) +
  theme_minimal() + 
  labs(x = "Genre", y = "Residuals") +
  geom_hline(yintercept = 0, linetype = "dashed", size = 0.2)

ggsave(filename = "horror_movies_conds_res_genre.pdf",
       width = 5.5, height = 4.3)
