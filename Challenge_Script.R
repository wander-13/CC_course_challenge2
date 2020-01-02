# Elena Dupen, 1 January 2020
# elena.dupen@gmail.com
# Testing for the 'Wiz of Data Viz' Challenge for the upcoming UoE Coding Club online course

### Load libraries ----
library(tidyverse)
library(sp)  # classes for spatial data
library(raster)  # grids, rasters
library(rasterVis)  # raster visualisation
library(maptools)
library(rgeos)
library(dismo) # allows us to access static maps
library(rgdal) # goes with dismo

### Load data ---- 
# Use the readRDS() function because they are not csv files!
nwss <- readRDS("data/NWSS.RDS")
structure <- readRDS("data/species_structure.RDS")
nnr <- readRDS("data/SNH_national_reserves.RDS")

# Take a look at the data:
head(nwss)
glimpse(nwss)
unique(nwss$DOM_HABITA)

head(nnr)
glimpse(nnr)
unique(nnr$NAME)

# Filter the NWSS dataset so it only contains certain dominant habitat types:
nwss2 <- nwss %>% 
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

# Create a map of each of the three areas
# This did not work (I need package after package, which isn't efficient with my slow internet)
# scotmap <- gmap("Scotland", type = "satellite", exp = 3)
# plot(scotmap)

# Another crack at plotting the shape files, this time specifically using the rgdal package
# Code from this website: https://www.r-graph-gallery.com/168-load-a-shape-file-into-r.html
map1 <- readOGR( 
  dsn= paste0(nnr2) , 
  verbose=FALSE
)
plot(nnr2$geometry)

# 3. Calculate the percentage of land covered by each habitat in the 3 areas
# and display it in a stacked bar graph

# This wasn't in the 'Specific tasks' section but I think I need to merge nwss2 and structure
habitats3 <- merge(nwss2, structure, by = "SCPTDATA_I", all = FALSE)
# How do these data correspond to the data in the nnr2 dataframe?





