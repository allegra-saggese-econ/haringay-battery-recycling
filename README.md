# haringay-battery-recycling

Creation of a map and explainer on household battery recycling points in Haringay, North London. This pulls data from multiple websites, including LondonRecycles, Haringay Council website, and RecycleNow. 

## steps to create the map 
1. Aggregate 'recycling drop off points' from multiple online sources including (1) Haringey Council website, RecycleNow, London Recycling information centre, website of private companies that operate in Haringey for waste management, including Vieola. 
2. Contact these 'drop off points' to confirm that the recycling site was still present and te recycling was still be processed regularly. 
3. Identify the geo-code (lat/long) via manual process using Google's free Geocoding service. 
4. Overlaying the manually collecting recycling point data with publicly provided London spatial data (map of boroughs, wards, and eventually traffic/bus routes/bike lanes.
5. Create an RShiny HTML to host the map.

## Next steps  
- Add features including 'hover' to the map so that you may see more information about the drop off site. This includes what they told me over the phone and anything I could find online. 
- Add additional location features such as (a) bus stops within 1km radius of the drop off point for nearest stop
- Highlighting/overlaying the map with Cycle Routes so that you may see how accessible a drop off point is from a cycle route. 
- Create an input box so that you may map yourself to the nearest location for drop offs. 
- Creating a password protected Google Sheet that plugs into the RShiny app so we may crowd source more information on recycling points and update it in real time

### As always - contact with queries!
If anyone has thoughts on helping with the Next steps! Please let me know! Reach out and let's do this together :) 
