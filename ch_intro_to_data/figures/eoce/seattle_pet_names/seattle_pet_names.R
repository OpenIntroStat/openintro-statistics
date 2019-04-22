# load packages ----------------------------------------------------------------
library(tidyverse)
library(openintro)
library(ggimage)

# load data --------------------------------------------------------------------
data(seattlepets)

# create data for viz ----------------------------------------------------------
name_props <- seattlepets %>% 
  filter(
    !is.na(animals_name),
    species %in% c("Dog", "Cat")
    ) %>%
  group_by(species) %>% 
  count(animals_name, sort = TRUE) %>%
  mutate(prop = n / sum(n))

cat_name_props <- name_props %>%
  filter(species == "Cat") %>%
  rename(cat_prop = prop) %>%
  slice(1:30)

dog_name_props <- name_props %>%
  filter(species == "Dog") %>%
  rename(dog_prop = prop) %>%
  slice(1:30)

comb_name_props <- inner_join(cat_name_props, dog_name_props, by = "animals_name") %>%
  ungroup() %>%
  select(animals_name, cat_prop, dog_prop)

# create viz -------------------------------------------------------------------
p <- ggplot(comb_name_props, aes(x = cat_prop, y = dog_prop)) +
  geom_abline(intercept = 0, color = COL[7,10], alpha = 0.8, size = 1.5) +
  geom_text_repel(aes(label = animals_name), segment.color = COL[6,3], 
                   seed = 291252, max.iter = 10000) +
  geom_point(color = COL[1,3]) +
  theme_bw() +
  labs(x = "Proportion of cats", y = "Proportion of dogs") +
  xlim(0.002, 0.01) +
  ylim(0.002, 0.01) +
  ggimage::geom_emoji(image = "1f436", aes(x = 0.003, y = 0.009), size = 0.1) +
  ggimage::geom_emoji(image = "1f431", aes(x = 0.009, y = 0.003), size = 0.1)

ggsave(filename = "mine-new/ch_intro_to_data/seattle_pet_names/figures/seattle_pet_names.pdf", p, width = 5.5, height = 4.3)
  
