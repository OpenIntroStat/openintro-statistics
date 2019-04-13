# load packages ----------------------------------------------------------------
library(tidyverse)
library(sf)
library(openintro)
library(nycflights13)
library(janitor)
library(measurements)

# data sources -----------------------------------------------------------------
# shapefile: https://catalog.data.gov/dataset/2013-cartographic-boundary-file-state-for-united-states-1-20000000
# Downloaded 2018-08-13

# set colors -------------------------------------------------------------------
lgray <- COL[7,4]
dgray <- COL[6,1]

# load spatial data ------------------------------------------------------------
# and filter out non-contigious states
usa_49 <- st_read("data/cb_2013_us_state_20m/cb_2013_us_state_20m.shp") %>%
  filter(!(NAME %in% c("Alaska", "Hawaii", "Puerto Rico")))

# load usairports data ------------------------------------------------------------
data(usairports, package = "openintro")

# clean airport data -----------------------------------------------------------
usairports <- usairports %>%
  filter(
    !str_detect(arp_latitude, "S"),
    !str_detect(state, "AK|HI|PR|MQ|GU|CQ|VI")
    ) %>%
  mutate(
    lat_dms = str_replace(arp_latitude, "N", "") %>%
      str_replace_all("-", " "),
    lon_dms = str_replace(arp_longitude, "W", "") %>%
      str_replace_all("-", " "),
    lat_dd = conv_unit(lat_dms, from = "deg_min_sec", to = "dec_deg") %>% as.numeric(),
    lon_dd = -1 * (conv_unit(lon_dms, from = "deg_min_sec", to = "dec_deg") %>% as.numeric())
  ) %>%
  filter(ownership %in% c("PR", "PU")) %>%   # only want public and private owned
  mutate(
    ownership = case_when(
      ownership == "PR" ~ "Privately owned",
      ownership == "PU" ~ "Publicly owned"
    ),
    use = case_when(
      use == "PR" ~ "Private use",
      use == "PU" ~ "Public use"
    ),
    region = case_when(
      region == "AAL" ~ "Alaska",
      region == "ACE" ~ "Central",
      region == "AEA" ~ "Eastern",
      region == "AGL" ~ "Great Lakes",
      region == "ANE" ~ "New England",
      region == "ANM" ~ "Northwest Mountain",
      region == "ASO" ~ "Southern",
      region == "ASW" ~ "Southwest",
      region == "AWP" ~ "Western-Pacific"
    )
  )
  
# plot -------------------------------------------------------------------------
ggplot(data = usa_49) +
  geom_sf(fill = lgray, color = dgray, size = 0.2) +
  geom_point(data = usairports, 
             aes(x = lon_dd, y = lat_dd, color = region),
             alpha = 0.3, show.legend = FALSE) +
  #scale_colour_manual(values = c(blue, green)) +
  coord_sf(xlim = c(-130, -60),
           ylim = c(20, 50)) +
  facet_grid(ownership ~ use) +
  labs(x = "", y = "", color = "Use") +
  theme_minimal()

# save plot --------------------------------------------------------------------
ggsave("airports.png", width = 7, height = 4)
