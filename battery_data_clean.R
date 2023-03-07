# AS - cleaning of battery drop off points
# feed into RShiny dashboard of map

library(tidyr)
library(readr)
library(ggplot2)
# include packages for geocoding and location service
library(ggmap)
library(mapview)
# include packages for handling spatial data


# upload store data
drop_df <- read_csv("battery_recycling_points_full.csv", 
                      col_types = cols(Lat = col_number(), 
                      Long = col_number(), `Confirmed via call` = col_factor(levels = c("Y", 
                      "N")), `Battery drop off present?` = col_factor(levels = c("Y", "N")))) # upload data - make Y/N column a factor

# geocode addresses for map use
## cannot geocode beause I need to set up billing - given the low number of 
## addresses, I'm just going to manually check for lat/long
#re-upload data with geocoded lat/long


# upload geo-data including borough, ward. LSOA boundary maps



# upload bus and bike route data for overlay (step 2)

# merge and make map 

# take test ourput and put it into Shiny

# create hover function (more information) for each store

# more advanced - enter your address and map closest store - tbd 