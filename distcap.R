# setwd("~/Documents/Projects/unu-wider")
options(stringsAsFactors = FALSE)
# List of packages
pkg = c("dplyr", "sf","sp", "stringr")
# Checks if they are installed, install if not
if (length(setdiff(pkg, rownames(installed.packages()))) > 0) {
  install.packages(setdiff(pkg, rownames(installed.packages())))}
# Load
invisible(lapply(pkg, library, character.only = TRUE))

## DATA ------------------------------------

# Load capitales provincia
caps = read.csv("Data_2020/provcapitals.csv") %>% 
  select(prov_code, lat, long) %>% 
  st_as_sf(coords = c("long", "lat"), crs = 4326) %>%
  st_transform(crs = 32630)


shp <- st_read("Data_2020/spatial/recintos_municipales_inspire_peninbal_etrs89.shp")

shp_1 <- st_read("Data_2020/spatial/recintos_municipales_inspire_canarias_regcan95.shp")

shp_1 <- st_transform(shp_1, st_crs(shp))

shp <- rbind(shp, shp_1)

# Variable names
shp$INE <- str_sub(shp$NATCODE, start = -5)
shp$prov_code = as.integer(str_sub(shp$INE, -5L, -4L))
shp$dist_prov_cap = NA
shp$area_sqkm <- as.numeric(st_area(st_geometry(shp$geometry)))/1000000

# Project and reproject to UTM
shp <- st_transform(shp, crs = 32630)

# Loop for each province
for(p in unique(caps$prov_code)){
  shpprov <- shp[shp$prov_code == p, ]
  centr <- st_centroid(shpprov)
  points <- caps[caps$prov_code == p, ]
  distances <- st_distance(centr, points) / 1000
  shp$dist_prov_cap[shp$prov_code == p] <- distances
}



dist_cap = shp %>% select(INE, dist_prov_cap, area_sqkm) %>%
  st_drop_geometry()
write.csv(dist_cap, "Data_2020/distcap.csv", row.names = FALSE)

