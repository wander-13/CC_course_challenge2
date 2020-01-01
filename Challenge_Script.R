# Elena Dupen, 1 January 2020
# elena.dupen@gmail.com
# Testing for the 'Wiz of Data Viz' Challenge for the upcoming UoE Coding Club online course

### Load libraries ----
library(tidyverse)

### Load data ---- 
# Use the readRDS() function because they are not csv files!
nwss <- readRDS("data/NWSS.RDS")
nnr <- readRDS("data/SNH_national_reserves.RDS")

# Take a look at the data:
head(nwss)
glimpse(nwss)
unique(nwss$DOM_HABITA)

head(nnr)
glimpse(nnr)
unique(nnr$NAME)

# Filter the NWSS dataset so it only contains certain dominant habitat types:
nwss <- nwss %>% 
  filter(DOM_HABITA == "Native pinewood"|DOM_HABITA == "Upland birchwood"
         |DOM_HABITA == "Upland mixed ashwood"|DOM_HABITA == "Upland oakwood"
         |DOM_HABITA == "Wet woodland"|DOM_HABITA == "Lowland mixed deciduous woodland")

# Filter the NNR dataset so it contains only certain areas, then rename some areas using mutate(recode())
nnr2 <- nnr %>% 
  filter(NAME == "The Great Trossachs Forest"|NAME == "Glen Affric"|NAME == "Cairngorms"
         |NAME == "Mar Lodge Estate"|NAME == "Abernethy") %>% 
  mutate(NAME = recode_factor(NAME, "The Great Trossachs Forest" = "Trossachs")) %>% 
  mutate(NAME = recode_factor(NAME, "Mar Lodge Estate" = "Cairngorms")) %>% 
  mutate(NAME = recode_factor(NAME, "Abernethy" = "Cairngorms"))


