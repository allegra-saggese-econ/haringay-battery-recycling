# AS - cleaning of battery drop off points
# feed into RShiny dashboard of map

library(tidyr)
library(readr)
library(ggplot2)
# include packages for geocoding and location service
library(ggmap)
library(mapview)
# include packages for handling spatial data
library(sp)
library(sf)
library(ggrepel)
library(ggspatial)
library(raster) # can use for SP
library(exactextractr)

# upload store data
drop_df <- read_csv("battery_recycling_points_full.csv", 
                      col_types = cols(Lat = col_number(), 
                      Long = col_number(), `Confirmed via call` = col_factor(levels = c("Y", 
   
                                                                                        
                                                                                        
                                                                                                           "N")), `Battery drop off present?` = col_factor(levels = c("Y", "N")))) # upload data - make Y/N column a factor
# recode as spatial object, set object equal to google maps CRS
drop_sp <- st_as_sf(drop_df, coords = c("Long", "Lat"), crs = 4326) 
ggplot(data = drop_sp) + geom_sf()


# upload London data 
## from ONS - WARD LEVEL
wards <- st_read(file.path(getwd(), "London-wards-2018/London-wards-2018_ESRI/London_Ward_CityMerged.shp"))
class(wards)
ggplot(data = wards) + geom_sf()

## from City of London - BOROUGH LEVEL
boroughs <- st_read(file.path(getwd(), "gis-boundaries/ESRI/London_Borough_Excluding_MHW.shp"))
ggplot(data = boroughs) + geom_sf()

# test CRS - to align across drop site df and borough map projection
st_crs(boroughs) == st_crs(drop_sp) # proving false - no explanation
# changing the drop_sp CRS to match boroughs
drop_sp_adjust <- st_transform(drop_sp, st_crs(boroughs))
st_crs(boroughs) == st_crs(drop_sp_adjust) # to sense check it worked 

# plot overlay of drop sites and borough map 
p3 <- ggplot() +
    geom_sf(data = boroughs) +
    geom_sf(data = drop_sp_adjust, color = "red")

# trim boroughs data to a radius outside of haringey



# upload bus and bike route data for overlay (step 2)
## TBD ## 

# take test output and put it into Shiny

# create hover function (more information) for each store

# more advanced - enter your address and map closest store - tbd 