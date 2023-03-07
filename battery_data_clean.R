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

# upload store data
drop_df <- read_csv("battery_recycling_points_full.csv", 
                      col_types = cols(Lat = col_number(), 
                      Long = col_number(), `Confirmed via call` = col_factor(levels = c("Y", 
                      "N")), `Battery drop off present?` = col_factor(levels = c("Y", "N")))) # upload data - make Y/N column a factor
# recode as spatial object
drop_sp <- st_as_sf(drop_df, coords = c("Lat", "Long"), crs = 4326) 
ggplot(data = drop_sp) + geom_sf()

# upload geo-data including borough, ward. LSOA boundary maps
getwd()
# from ONS - WARD LEVEL
wards <- st_read(file.path(getwd(), "London-wards-2018/London-wards-2018_ESRI/London_Ward_CityMerged.shp"))
class(wards)
ggplot(data = wards) + geom_sf()

# from City of London - BOROUGH LEVEL
boroughs <- st_read(file.path(getwd(), "gis-boundaries/ESRI/London_Borough_Excluding_MHW.shp"))
ggplot(data = boroughs) + geom_sf()

# reduce borough data only to haringey
har <- boroughs$NAME =="Haringey"
haringey_bound <- boroughs[boroughs$NAME == "Haringey",]

# set same CRS for data layers
drop_crs <- st_transform(drop_sp, st_crs(haringey_bound))

# need to align boundary boxes
proj = "+proj=tmerc +lat_0=49 +lon_0=-2 +k=0.9996012717 +x_0=400000 +y_0=-100000 +ellps=airy +nadgrids=OSTN15_NTv2_OSGBtoETRS.gsb +units=m +no_defs +type=crs"


ggplot() + geom_sf(data = joined_df)


# upload bus and bike route data for overlay (step 2)
## TBD ## 

# take test output and put it into Shiny

# create hover function (more information) for each store

# more advanced - enter your address and map closest store - tbd 