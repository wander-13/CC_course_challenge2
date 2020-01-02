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

# I thought I should save the dataframe as a csv to make the color palette in problem 2 easier
# But this code did not work, even when I 
# I read this StackOverflow thread which led me to the following line of code, 
# but it turned the dataframe into a huge list, rather than unlisting the data:
# https://stackoverflow.com/questions/15434138/function-write-csv-returns-an-error
# nwss2 <- sapply(nwss2, unlist)
# write.csv(nwss2, file = "nwss2.csv", rownames = FALSE)

# Filter the NNR dataset so it contains only certain areas, then rename some areas using mutate(recode())
nnr2 <- nnr %>% 
  filter(NAME == "The Great Trossachs Forest"|NAME == "Glen Affric"|NAME == "Cairngorms"
         |NAME == "Mar Lodge Estate"|NAME == "Abernethy") %>% 
  mutate(NAME = recode_factor(NAME, "The Great Trossachs Forest" = "Trossachs")) %>% 
  mutate(NAME = recode_factor(NAME, "Mar Lodge Estate" = "Cairngorms")) %>% 
  mutate(NAME = recode_factor(NAME, "Abernethy" = "Cairngorms"))

# 2. Create a map of each of the three areas
# How many priority habitat types are there?
unique(nwss2$DOM_HABITA)
# Only six priority habitats (so we will only need six colors in our color palette)

# Create a color palette for the habitat types
habitat_colors <- c('#d73027','#fc8d59','#fee090','#e0f3f8','#91bfdb','#4575b4')

# The following line of code doesn't work because there are technically 35 levels
# in the nwss2 dataframe even though only six are actually included
# names(habitat_colors) <- levels(nwss2$DOM_HABITA)

# Let's make another color palette with 35 colors (colors by ColorBrewer):
habitat_colors2 <- c('#a6cee3','#1f78b4','#b2df8a','#33a02c','#fb9a99','#e31a1c',
                      '#fdbf6f','#ff7f00','#cab2d6','#6a3d9a','#ffff99','#b15928',
                     '#8dd3c7','#ffffb3','#bebada','#fb8072','#80b1d3','#fdb462',
                      '#b3de69','#fccde5','#d9d9d9','#bc80bd','#ccebc5','#ffed6f',
                     '#9e0142','#d53e4f','#f46d43','#fdae61','#fee08b','#ffffbf',
                      '#e6f598','#abdda4','#66c2a5','#3288bd','#5e4fa2')

# Now the following line of code works, associating the colors with individual habitat types
names(habitat_colors2) <- levels(nwss$DOM_HABITA)


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





