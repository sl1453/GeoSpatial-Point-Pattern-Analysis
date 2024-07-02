# R script for UDel R workshop, 16\&17 July copy and learning
#S.Li
#setwd("~/Documents/R workshop 2017/Script_10_27_21")
#Read Excel
library(readxl)
library(tidyverse)
library(sf)
#Creating spatstat objects
library(spatstat)
library(maptools)
setwd("~/Documents/R workshop 2017/project x/analysis")
#Create the Polygon Window
giardia.polygon <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/60h_BioRep3_4_6_21.xlsx",sheet=7)
#already in microns
giardia.polygon.df <- data.frame(
  lon = c(giardia.polygon$x_coordinate),
  lat = c(giardia.polygon$y_coordinate))

polygonarea <- giardia.polygon.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326) %>%
  summarise(geometry = st_combine(geometry)) %>%
  st_cast("POLYGON")
polygonarea
plot(polygonarea)

########12h data ##########
#12h Giardia Control Ceiling Data
giardia.control_ceiling_12h <- read_excel("data/12h_BioRep3_4_6_21.xlsx",sheet=1) 

giardia.control_ceiling_12h.df <- data.frame(
  lon = c(giardia.control_ceiling_12h$x_coordinate),
  lat = c(giardia.control_ceiling_12h$y_coordinate)
)
giardia.control_ceiling_12h.points <- giardia.control_ceiling_12h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)
#12h Giardia Control floor Data
giardia.control_floor_12h <- read_excel("data/12h_BioRep3_4_6_21.xlsx",sheet=2)
  
giardia.control_floor_12h.df <- data.frame(
  lon = c(giardia.control_floor_12h$x_coordinate),
  lat = c(giardia.control_floor_12h$y_coordinate)
)
giardia.control_floor_12h.points <- giardia.control_floor_12h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)
#Giardia methylcell_rep1 Ceiling Data
giardia.methylcell_rep1_ceiling_12h <- read_excel("data/12h_BioRep3_4_6_21.xlsx",sheet=3)

giardia.methylcell_rep1_ceiling_12h.df <- data.frame(
  lon = c(giardia.methylcell_rep1_ceiling_12h$x_coordinate),
  lat = c(giardia.methylcell_rep1_ceiling_12h$y_coordinate)
)

giardia.methlcell_rep1_ceiling_12h.points <- giardia.methylcell_rep1_ceiling_12h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)
#Giardia methylcell_rep1 floor Data
giardia.methylcell_rep1_floor_12h <- read_excel("data/12h_BioRep3_4_6_21.xlsx",sheet=4)

giardia.methylcell_rep1_floor_12h.df <- data.frame(
  lon = c(giardia.methylcell_rep1_floor_12h$x_coordinate),
  lat = c(giardia.methylcell_rep1_floor_12h$y_coordinate)
)

giardia.methlcell_rep1_floor_12h.points <- giardia.methylcell_rep1_floor_12h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)
########24h data ##########
#24h Giardia Control Ceiling Data
giardia.control_ceiling_24h <- read_excel("data/24h_BioRep3_4_6_21.xlsx",sheet=1) 

giardia.control_ceiling_24h.df <- data.frame(
  lon = c(giardia.control_ceiling_24h$x_coordinate),
  lat = c(giardia.control_ceiling_24h$y_coordinate)
)
giardia.control_ceiling_24h.points <- giardia.control_ceiling_24h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)
#24h Giardia Control floor Data
giardia.control_floor_24h <- read_excel("data/24h_BioRep3_4_6_21.xlsx",sheet=2)

giardia.control_floor_24h.df <- data.frame(
  lon = c(giardia.control_floor_24h$x_coordinate),
  lat = c(giardia.control_floor_24h$y_coordinate)
)
giardia.control_floor_24h.points <- giardia.control_floor_24h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)
#24h Giardia methylcell_rep1 Ceiling Data
giardia.methylcell_rep1_ceiling_24h <- read_excel("data/24h_BioRep3_4_6_21.xlsx",sheet=3)
giardia.methylcell_rep1_ceiling_24h.df <- data.frame(
  lon = c(giardia.methylcell_rep1_ceiling_24h$x_coordinate),
  lat = c(giardia.methylcell_rep1_ceiling_24h$y_coordinate)
)

giardia.methlcell_rep1_ceiling_24h.points <- giardia.methylcell_rep1_ceiling_24h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#24h Giardia methylcell_rep1 floor Data
giardia.methylcell_rep1_floor_24h <- read_excel("data/24h_BioRep3_4_6_21.xlsx",sheet=4)

giardia.methylcell_rep1_floor_24h.df <- data.frame(
  lon = c(giardia.methylcell_rep1_floor_24h$x_coordinate),
  lat = c(giardia.methylcell_rep1_floor_24h$y_coordinate)
)

giardia.methlcell_rep1_floor_24h.points <- giardia.methylcell_rep1_floor_24h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

########36h data ##########
#36h Giardia Control Ceiling Data
giardia.control_ceiling_36h <- read_excel("data/36h_BioRep3_4_6_21.xlsx",sheet=1) 

giardia.control_ceiling_36h.df <- data.frame(
  lon = c(giardia.control_ceiling_36h$x_coordinate),
  lat = c(giardia.control_ceiling_36h$y_coordinate)
)
giardia.control_ceiling_36h.points <- giardia.control_ceiling_36h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#36h Giardia Control floor Data
giardia.control_floor_36h <- read_excel("data/36h_BioRep3_4_6_21.xlsx",sheet=2)

giardia.control_floor_36h.df <- data.frame(
  lon = c(giardia.control_floor_36h$x_coordinate),
  lat = c(giardia.control_floor_36h$y_coordinate)
)
giardia.control_floor_36h.points <- giardia.control_floor_36h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#36h Giardia methylcell_rep1 Ceiling Data
giardia.methylcell_rep1_ceiling_36h <- read_excel("data/36h_BioRep3_4_6_21.xlsx",sheet=3)

giardia.methylcell_rep1_ceiling_36h.df <- data.frame(
  lon = c(giardia.methylcell_rep1_ceiling_36h$x_coordinate),
  lat = c(giardia.methylcell_rep1_ceiling_36h$y_coordinate)
)

giardia.methlcell_rep1_ceiling_36h.points <- giardia.methylcell_rep1_ceiling_36h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#36h Giardia methylcell_rep1 floor Data
giardia.methylcell_rep1_floor_36h <- read_excel("data/36h_BioRep3_4_6_21.xlsx",sheet=4)

giardia.methylcell_rep1_floor_36h.df <- data.frame(
  lon = c(giardia.methylcell_rep1_floor_36h$x_coordinate),
  lat = c(giardia.methylcell_rep1_floor_36h$y_coordinate)
)

giardia.methlcell_rep1_floor_36h.points <- giardia.methylcell_rep1_floor_36h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

########48h data ##########
#48h Giardia Control Ceiling Data
giardia.control_ceiling_48h <- read_excel("data/48h_BioRep3_4_6_21.xlsx",sheet=1) 

giardia.control_ceiling_48h.df <- data.frame(
  lon = c(giardia.control_ceiling_48h$x_coordinate),
  lat = c(giardia.control_ceiling_48h$y_coordinate)
)
giardia.control_ceiling_48h.points <- giardia.control_ceiling_48h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#48h Giardia Control floor Data
giardia.control_floor_48h <- read_excel("data/48h_BioRep3_4_6_21.xlsx",sheet=2)

giardia.control_floor_48h.df <- data.frame(
  lon = c(giardia.control_floor_48h$x_coordinate),
  lat = c(giardia.control_floor_48h$y_coordinate)
)
giardia.control_floor_48h.points <- giardia.control_floor_48h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#48h Giardia methylcell_rep1 Ceiling Data
giardia.methylcell_rep1_ceiling_48h <- read_excel("data/48h_BioRep3_4_6_21.xlsx",sheet=3)

giardia.methylcell_rep1_ceiling_48h.df <- data.frame(
  lon = c(giardia.methylcell_rep1_ceiling_48h$x_coordinate),
  lat = c(giardia.methylcell_rep1_ceiling_48h$y_coordinate)
)

giardia.methlcell_rep1_ceiling_48h.points <- giardia.methylcell_rep1_ceiling_48h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#48h Giardia methylcell_rep1 floor Data
giardia.methylcell_rep1_floor_48h <- read_excel("data/48h_BioRep3_4_6_21.xlsx",sheet=4)

giardia.methylcell_rep1_floor_48h.df <- data.frame(
  lon = c(giardia.methylcell_rep1_floor_48h$x_coordinate),
  lat = c(giardia.methylcell_rep1_floor_48h$y_coordinate)
)

giardia.methlcell_rep1_floor_48h.points <- giardia.methylcell_rep1_floor_48h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

########60h data ##########
#60h Giardia Control Ceiling Data
giardia.control_ceiling_60h <- read_excel("data/60h_BioRep3_4_6_21.xlsx",sheet=1) 

giardia.control_ceiling_60h.df <- data.frame(
  lon = c(giardia.control_ceiling_60h$x_coordinate),
  lat = c(giardia.control_ceiling_60h$y_coordinate)
)
giardia.control_ceiling_60h.points <- giardia.control_ceiling_60h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#60h Giardia Control floor Data
giardia.control_floor_60h <- read_excel("data/60h_BioRep3_4_6_21.xlsx",sheet=2)

giardia.control_floor_60h.df <- data.frame(
  lon = c(giardia.control_floor_60h$x_coordinate),
  lat = c(giardia.control_floor_60h$y_coordinate)
)
giardia.control_floor_60h.points <- giardia.control_floor_60h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#60h Giardia methylcell_rep1 Ceiling Data
giardia.methylcell_rep1_ceiling_60h <- read_excel("data/60h_BioRep3_4_6_21.xlsx",sheet=3)

giardia.methylcell_rep1_ceiling_60h.df <- data.frame(
  lon = c(giardia.methylcell_rep1_ceiling_60h$x_coordinate),
  lat = c(giardia.methylcell_rep1_ceiling_60h$y_coordinate)
)

giardia.methlcell_rep1_ceiling_60h.points <- giardia.methylcell_rep1_ceiling_60h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#60h Giardia methylcell_rep1 floor Data
giardia.methylcell_rep1_floor_60h <- read_excel("data/60h_BioRep3_4_6_21.xlsx",sheet=4)

giardia.methylcell_rep1_floor_60h.df <- data.frame(
  lon = c(giardia.methylcell_rep1_floor_60h$x_coordinate),
  lat = c(giardia.methylcell_rep1_floor_60h$y_coordinate)
)

giardia.methlcell_rep1_floor_60h.points <- giardia.methylcell_rep1_floor_60h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)
#####################End of 60 h Data #########################
#####################Load rep 2 data ##########################
#12h Giardia Control Ceiling Data
giardia.control_ceiling_12h_2 <- read_excel("data/12h_BioRep3_4_6_21.xlsx",sheet='control_rep2_c') 

giardia.control_ceiling_12h_2.df <- data.frame(
  lon = c(giardia.control_ceiling_12h_2$x_coordinate),
  lat = c(giardia.control_ceiling_12h_2$y_coordinate)
)
giardia.control_ceiling_12h_2.points <- giardia.control_ceiling_12h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#12h Giardia Control floor Data
giardia.control_floor_12h_2 <- read_excel("data/12h_BioRep3_4_6_21.xlsx",sheet='control_rep2_f')

giardia.control_floor_12h_2.df <- data.frame(
  lon = c(giardia.control_floor_12h_2$x_coordinate),
  lat = c(giardia.control_floor_12h_2$y_coordinate)
)
giardia.control_floor_12h_2.points <- giardia.control_floor_12h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)


#Giardia methylcell_rep2 Ceiling Data
giardia.methylcell_ceiling_12h_2 <- read_excel("data/12h_BioRep3_4_6_21.xlsx",sheet='mCell_rep2_c')

giardia.methylcell_ceiling_12h_2.df <- data.frame(
  lon = c(giardia.methylcell_ceiling_12h_2$x_coordinate),
  lat = c(giardia.methylcell_ceiling_12h_2$y_coordinate)
)

giardia.methlcell_ceiling_12h_2.points <- giardia.methylcell_ceiling_12h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#Giardia methylcell_rep2 floor Data
giardia.methylcell_floor_12h_2 <- read_excel("data/12h_BioRep3_4_6_21.xlsx",sheet='mCell_rep2_f')

giardia.methylcell_floor_12h_2.df <- data.frame(
  lon = c(giardia.methylcell_floor_12h_2$x_coordinate),
  lat = c(giardia.methylcell_floor_12h_2$y_coordinate)
)

giardia.methlcell_floor_12h_2.points <- giardia.methylcell_floor_12h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

########24h data ##########
#24h Giardia Control Ceiling Data
giardia.control_ceiling_24h_2 <- read_excel("data/24h_BioRep3_4_6_21.xlsx",sheet="control_rep2_c") 

giardia.control_ceiling_24h_2.df <- data.frame(
  lon = c(giardia.control_ceiling_24h_2$x_coordinate),
  lat = c(giardia.control_ceiling_24h_2$y_coordinate)
)
giardia.control_ceiling_24h_2.points <- giardia.control_ceiling_24h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#24h Giardia Control floor Data
giardia.control_floor_24h_2 <- read_excel("data/24h_BioRep3_4_6_21.xlsx",sheet='control_rep2_f')

giardia.control_floor_24h_2.df <- data.frame(
  lon = c(giardia.control_floor_24h_2$x_coordinate),
  lat = c(giardia.control_floor_24h_2$y_coordinate)
)
giardia.control_floor_24h_2.points <- giardia.control_floor_24h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#24h Giardia methylcell_rep2 Ceiling Data
giardia.methylcell_ceiling_24h_2 <- read_excel("data/24h_BioRep3_4_6_21.xlsx",sheet='mCell_rep2_c')

giardia.methylcell_ceiling_24h_2.df <- data.frame(
  lon = c(giardia.methylcell_ceiling_24h_2$x_coordinate),
  lat = c(giardia.methylcell_ceiling_24h_2$y_coordinate)
)

giardia.methlcell_ceiling_24h_2.points <- giardia.methylcell_ceiling_24h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#24h Giardia methylcell_rep2 floor Data
giardia.methylcell_floor_24h_2 <- read_excel("data/24h_BioRep3_4_6_21.xlsx",sheet='mCell_rep2_f')

giardia.methylcell_floor_24h_2.df <- data.frame(
  lon = c(giardia.methylcell_floor_24h_2$x_coordinate),
  lat = c(giardia.methylcell_floor_24h_2$y_coordinate)
)

giardia.methlcell_floor_24h_2.points <- giardia.methylcell_floor_24h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

########36h data ##########
#36h Giardia Control Ceiling Data
giardia.control_ceiling_36h_2 <- read_excel("data/36h_BioRep3_4_6_21.xlsx",sheet='control_rep2_c') 

giardia.control_ceiling_36h_2.df <- data.frame(
  lon = c(giardia.control_ceiling_36h_2$x_coordinate),
  lat = c(giardia.control_ceiling_36h_2$y_coordinate)
)
giardia.control_ceiling_36h_2.points <- giardia.control_ceiling_36h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#36h Giardia Control floor Data
giardia.control_floor_36h_2 <- read_excel("data/36h_BioRep3_4_6_21.xlsx",sheet='control_rep2_f')

giardia.control_floor_36h_2.df <- data.frame(
  lon = c(giardia.control_floor_36h_2$x_coordinate),
  lat = c(giardia.control_floor_36h_2$y_coordinate)
)
giardia.control_floor_36h_2.points <- giardia.control_floor_36h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#36h Giardia methylcell_rep2 Ceiling Data
giardia.methylcell_ceiling_36h_2 <- read_excel("data/36h_BioRep3_4_6_21.xlsx",sheet='mCell_rep2_c')

giardia.methylcell_ceiling_36h_2.df <- data.frame(
  lon = c(giardia.methylcell_ceiling_36h_2$x_coordinate),
  lat = c(giardia.methylcell_ceiling_36h_2$y_coordinate)
)

giardia.methlcell_ceiling_36h_2.points <- giardia.methylcell_ceiling_36h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#36h Giardia methylcell_rep2 floor Data
giardia.methylcell_floor_36h_2 <- read_excel("data/36h_BioRep3_4_6_21.xlsx",sheet='mCell_rep2_f')

giardia.methylcell_floor_36h_2.df <- data.frame(
  lon = c(giardia.methylcell_floor_36h_2$x_coordinate),
  lat = c(giardia.methylcell_floor_36h_2$y_coordinate)
)

giardia.methlcell_floor_36h_2.points <- giardia.methylcell_floor_36h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

########48h data ##########
#48h Giardia Control Ceiling Data
giardia.control_ceiling_48h_2 <- read_excel("data/48h_BioRep3_4_6_21.xlsx",sheet='control_rep2_c') 

giardia.control_ceiling_48h_2.df <- data.frame(
  lon = c(giardia.control_ceiling_48h_2$x_coordinate),
  lat = c(giardia.control_ceiling_48h_2$y_coordinate)
)
giardia.control_ceiling_48h_2.points <- giardia.control_ceiling_48h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#48h Giardia Control floor Data
giardia.control_floor_48h_2 <- read_excel("data/48h_BioRep3_4_6_21.xlsx",sheet='control_rep2_f')

giardia.control_floor_48h_2.df <- data.frame(
  lon = c(giardia.control_floor_48h_2$x_coordinate),
  lat = c(giardia.control_floor_48h_2$y_coordinate)
)
giardia.control_floor_48h_2.points <- giardia.control_floor_48h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#48h Giardia methylcell_rep2 Ceiling Data
giardia.methylcell_ceiling_48h_2 <- read_excel("data/48h_BioRep3_4_6_21.xlsx",sheet='mCell_rep2_c')

giardia.methylcell_ceiling_48h_2.df <- data.frame(
  lon = c(giardia.methylcell_ceiling_48h_2$x_coordinate),
  lat = c(giardia.methylcell_ceiling_48h_2$y_coordinate)
)

giardia.methlcell_ceiling_48h_2.points <- giardia.methylcell_ceiling_48h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#48h Giardia methylcell_rep2 floor Data
giardia.methylcell_floor_48h_2 <- read_excel("data/48h_BioRep3_4_6_21.xlsx",sheet="mCell_rep2_f")

giardia.methylcell_floor_48h_2.df <- data.frame(
  lon = c(giardia.methylcell_floor_48h_2$x_coordinate),
  lat = c(giardia.methylcell_floor_48h_2$y_coordinate)
)

giardia.methlcell_floor_48h_2.points <- giardia.methylcell_floor_48h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

########60h data ##########
#60h Giardia Control Ceiling Data
giardia.control_ceiling_60h_2 <- read_excel("data/60h_BioRep3_4_6_21.xlsx",sheet='control_rep2_c') 

giardia.control_ceiling_60h_2.df <- data.frame(
  lon = c(giardia.control_ceiling_60h_2$x_coordinate),
  lat = c(giardia.control_ceiling_60h_2$y_coordinate)
)
giardia.control_ceiling_60h_2.points <- giardia.control_ceiling_60h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#60h Giardia Control floor Data
giardia.control_floor_60h_2 <- read_excel("data/60h_BioRep3_4_6_21.xlsx",sheet='control_rep2_f')

giardia.control_floor_60h_2.df <- data.frame(
  lon = c(giardia.control_floor_60h_2$x_coordinate),
  lat = c(giardia.control_floor_60h_2$y_coordinate)
)
giardia.control_floor_60h_2.points <- giardia.control_floor_60h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#60h Giardia methylcell_rep2 Ceiling Data
giardia.methylcell_ceiling_60h_2 <- read_excel("data/60h_BioRep3_4_6_21.xlsx",sheet='mCell_rep2_c')

giardia.methylcell_ceiling_60h_2.df <- data.frame(
  lon = c(giardia.methylcell_ceiling_60h_2$x_coordinate),
  lat = c(giardia.methylcell_ceiling_60h_2$y_coordinate)
)

giardia.methlcell_ceiling_60h_2.points <- giardia.methylcell_ceiling_60h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#60h Giardia methylcell_rep2 floor Data
giardia.methylcell_floor_60h_2 <- read_excel("data/60h_BioRep3_4_6_21.xlsx",sheet='mCell_rep2_f')

giardia.methylcell_floor_60h_2.df <- data.frame(
  lon = c(giardia.methylcell_floor_60h_2$x_coordinate),
  lat = c(giardia.methylcell_floor_60h_2$y_coordinate)
)

giardia.methlcell_floor_60h_2.points <- giardia.methylcell_floor_60h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)
#####################End of Rep2 Data######################
#####################Load Rep3 Data########################
#Giardia methylcell_rep3 Ceiling Data
giardia.methylcell_ceiling_12h_3 <- read_excel("data/12h_BioRep3_4_6_21.xlsx",sheet='mCell_rep3_c')

giardia.methylcell_ceiling_12h_3.df <- data.frame(
  lon = c(giardia.methylcell_ceiling_12h_3$x_coordinate),
  lat = c(giardia.methylcell_ceiling_12h_3$y_coordinate)
)

giardia.methlcell_ceiling_12h_3.points <- giardia.methylcell_ceiling_12h_3.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#Giardia methylcell_rep2 floor Data
giardia.methylcell_floor_12h_3 <- read_excel("data/12h_BioRep3_4_6_21.xlsx",sheet='mCell_rep3_f')

giardia.methylcell_floor_12h_3.df <- data.frame(
  lon = c(giardia.methylcell_floor_12h_3$x_coordinate),
  lat = c(giardia.methylcell_floor_12h_3$y_coordinate)
)

giardia.methlcell_floor_12h_3.points <- giardia.methylcell_floor_12h_3.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

########24h data ##########
#24h Giardia methylcell_rep3 Ceiling Data
giardia.methylcell_ceiling_24h_3 <- read_excel("data/24h_BioRep3_4_6_21.xlsx",sheet='mCell_rep3_c')

giardia.methylcell_ceiling_24h_3.df <- data.frame(
  lon = c(giardia.methylcell_ceiling_24h_3$x_coordinate),
  lat = c(giardia.methylcell_ceiling_24h_3$y_coordinate)
)

giardia.methlcell_ceiling_24h_3.points <- giardia.methylcell_ceiling_24h_3.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#24h Giardia methylcell_rep3 floor Data
giardia.methylcell_floor_24h_3 <- read_excel("data/24h_BioRep3_4_6_21.xlsx",sheet='mCell_rep3_f')

giardia.methylcell_floor_24h_3.df <- data.frame(
  lon = c(giardia.methylcell_floor_24h_3$x_coordinate),
  lat = c(giardia.methylcell_floor_24h_3$y_coordinate)
)

giardia.methlcell_floor_24h_3.points <- giardia.methylcell_floor_24h_3.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

########36h data ##########
#36h Giardia methylcell_rep3 Ceiling Data
giardia.methylcell_ceiling_36h_3 <- read_excel("data/36h_BioRep3_4_6_21.xlsx",sheet='mCell_rep3_c')

giardia.methylcell_ceiling_36h_3.df <- data.frame(
  lon = c(giardia.methylcell_ceiling_36h_3$x_coordinate),
  lat = c(giardia.methylcell_ceiling_36h_3$y_coordinate)
)

giardia.methlcell_ceiling_36h_3.points <- giardia.methylcell_ceiling_36h_3.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#36h Giardia methylcell_rep3 floor Data
giardia.methylcell_floor_36h_3 <- read_excel("data/36h_BioRep3_4_6_21.xlsx",sheet='mCell_rep3_f')

giardia.methylcell_floor_36h_3.df <- data.frame(
  lon = c(giardia.methylcell_floor_36h_3$x_coordinate),
  lat = c(giardia.methylcell_floor_36h_3$y_coordinate)
)

giardia.methlcell_floor_36h_3.points <- giardia.methylcell_floor_36h_3.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

########48h data ##########
#48h Giardia methylcell_rep3 Ceiling Data
giardia.methylcell_ceiling_48h_3 <- read_excel("data/48h_BioRep3_4_6_21.xlsx",sheet='mCell_rep3_c')

giardia.methylcell_ceiling_48h_3.df <- data.frame(
  lon = c(giardia.methylcell_ceiling_48h_3$x_coordinate),
  lat = c(giardia.methylcell_ceiling_48h_3$y_coordinate)
)

giardia.methlcell_ceiling_48h_3.points <- giardia.methylcell_ceiling_48h_3.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#48h Giardia methylcell_rep3 floor Data
giardia.methylcell_floor_48h_3 <- read_excel("data/48h_BioRep3_4_6_21.xlsx",sheet="mCell_rep3_f")

giardia.methylcell_floor_48h_3.df <- data.frame(
  lon = c(giardia.methylcell_floor_48h_3$x_coordinate),
  lat = c(giardia.methylcell_floor_48h_3$y_coordinate)
)

giardia.methlcell_floor_48h_3.points <- giardia.methylcell_floor_48h_3.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

########60h data ##########
#60h Giardia methylcell_rep3 Ceiling Data
giardia.methylcell_ceiling_60h_3 <- read_excel("data/60h_BioRep3_4_6_21.xlsx",sheet='mCell_rep3_c')

giardia.methylcell_ceiling_60h_3.df <- data.frame(
  lon = c(giardia.methylcell_ceiling_60h_3$x_coordinate),
  lat = c(giardia.methylcell_ceiling_60h_3$y_coordinate)
)

giardia.methlcell_ceiling_60h_3.points <- giardia.methylcell_ceiling_60h_3.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#60h Giardia methylcell_rep3 floor Data
giardia.methylcell_floor_60h_3 <- read_excel("data/60h_BioRep3_4_6_21.xlsx",sheet='mCell_rep3_f')

giardia.methylcell_floor_60h_3.df <- data.frame(
  lon = c(giardia.methylcell_floor_60h_3$x_coordinate),
  lat = c(giardia.methylcell_floor_60h_3$y_coordinate)
)

giardia.methlcell_floor_60h_3.points <- giardia.methylcell_floor_60h_3.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)
###########################End of Rep3 Data ####################
###########################Load Rep4 Data ######################
#Giardia methylcell_rep4 Ceiling Data
giardia.methylcell_ceiling_12h_4 <- read_excel("data/12h_BioRep3_4_6_21.xlsx",sheet='mCell_rep4_c')

giardia.methylcell_ceiling_12h_4.df <- data.frame(
  lon = c(giardia.methylcell_ceiling_12h_4$x_coordinate),
  lat = c(giardia.methylcell_ceiling_12h_4$y_coordinate)
)

giardia.methlcell_ceiling_12h_4.points <- giardia.methylcell_ceiling_12h_4.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#Giardia methylcell_rep4 floor Data
giardia.methylcell_floor_12h_4 <- read_excel("data/12h_BioRep3_4_6_21.xlsx",sheet='mCell_rep4_f')

giardia.methylcell_floor_12h_4.df <- data.frame(
  lon = c(giardia.methylcell_floor_12h_4$x_coordinate),
  lat = c(giardia.methylcell_floor_12h_4$y_coordinate)
)

giardia.methlcell_floor_12h_4.points <- giardia.methylcell_floor_12h_4.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

########24h data ##########
#24h Giardia methylcell_rep4 Ceiling Data
giardia.methylcell_ceiling_24h_4 <- read_excel("data/24h_BioRep3_4_6_21.xlsx",sheet='mCell_rep4_c')

giardia.methylcell_ceiling_24h_4.df <- data.frame(
  lon = c(giardia.methylcell_ceiling_24h_4$x_coordinate),
  lat = c(giardia.methylcell_ceiling_24h_4$y_coordinate)
)

giardia.methlcell_ceiling_24h_4.points <- giardia.methylcell_ceiling_24h_4.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#24h Giardia methylcell_rep4 floor Data
giardia.methylcell_floor_24h_4 <- read_excel("data/24h_BioRep3_4_6_21.xlsx",sheet='mCell_rep4_f')

giardia.methylcell_floor_24h_4.df <- data.frame(
  lon = c(giardia.methylcell_floor_24h_4$x_coordinate),
  lat = c(giardia.methylcell_floor_24h_4$y_coordinate)
)

giardia.methlcell_floor_24h_4.points <- giardia.methylcell_floor_24h_4.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

########36h data ##########
#36h Giardia methylcell_rep4 Ceiling Data
giardia.methylcell_ceiling_36h_4 <- read_excel("data/36h_BioRep3_4_6_21.xlsx",sheet='mCell_rep4_c')

giardia.methylcell_ceiling_36h_4.df <- data.frame(
  lon = c(giardia.methylcell_ceiling_36h_4$x_coordinate),
  lat = c(giardia.methylcell_ceiling_36h_4$y_coordinate)
)

giardia.methlcell_ceiling_36h_4.points <- giardia.methylcell_ceiling_36h_4.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#36h Giardia methylcell_rep4 floor Data
giardia.methylcell_floor_36h_4 <- read_excel("data/36h_BioRep3_4_6_21.xlsx",sheet='mCell_rep4_f')

giardia.methylcell_floor_36h_4.df <- data.frame(
  lon = c(giardia.methylcell_floor_36h_4$x_coordinate),
  lat = c(giardia.methylcell_floor_36h_4$y_coordinate)
)

giardia.methlcell_floor_36h_4.points <- giardia.methylcell_floor_36h_4.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

########48h data ##########
#48h Giardia methylcell_rep4 Ceiling Data
giardia.methylcell_ceiling_48h_4 <- read_excel("data/48h_BioRep3_4_6_21.xlsx",sheet='mCell_rep4_c')

giardia.methylcell_ceiling_48h_4.df <- data.frame(
  lon = c(giardia.methylcell_ceiling_48h_4$x_coordinate),
  lat = c(giardia.methylcell_ceiling_48h_4$y_coordinate)
)

giardia.methlcell_ceiling_48h_4.points <- giardia.methylcell_ceiling_48h_4.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#48h Giardia methylcell_rep4 floor Data
giardia.methylcell_floor_48h_4 <- read_excel("data/48h_BioRep3_4_6_21.xlsx",sheet="mCell_rep4_f")

giardia.methylcell_floor_48h_4.df <- data.frame(
  lon = c(giardia.methylcell_floor_48h_4$x_coordinate),
  lat = c(giardia.methylcell_floor_48h_4$y_coordinate)
)

giardia.methlcell_floor_48h_4.points <- giardia.methylcell_floor_48h_4.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

########60h data ##########
#60h Giardia methylcell_rep4 Ceiling Data
giardia.methylcell_ceiling_60h_4 <- read_excel("data/60h_BioRep3_4_6_21.xlsx",sheet='mCell_rep4_c')

giardia.methylcell_ceiling_60h_4.df <- data.frame(
  lon = c(giardia.methylcell_ceiling_60h_4$x_coordinate),
  lat = c(giardia.methylcell_ceiling_60h_4$y_coordinate)
)

giardia.methlcell_ceiling_60h_4.points <- giardia.methylcell_ceiling_60h_4.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#60h Giardia methylcell_rep4 floor Data
giardia.methylcell_floor_60h_4 <- read_excel("data/60h_BioRep3_4_6_21.xlsx",sheet='mCell_rep4_f')

giardia.methylcell_floor_60h_4.df <- data.frame(
  lon = c(giardia.methylcell_floor_60h_4$x_coordinate),
  lat = c(giardia.methylcell_floor_60h_4$y_coordinate)
)

giardia.methlcell_floor_60h_4.points <- giardia.methylcell_floor_60h_4.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)
#########################End of rep4 Data#######################
#Coordinate units
coordinate.units <- c("um", "ums")

#Window
class(polygonarea)
class(as(polygonarea, 'Spatial'))
#class(as(as(polygonarea, 'Spatial'), 'owin'))
#win <- as(as(polygonarea, 'Spatial'), 'owin')
library(polyCub)
win <- as.owin.SpatialPolygons(spg)
win 

######################Construct ppp object########################
##12h##
class(giardia.control_ceiling_12h.points)
class(giardia.control_floor_12h.points)
class(giardia.methlcell_rep1_ceiling_12h.points)
class(giardia.methlcell_rep1_floor_12h.points)

class(giardia.control_ceiling_12h_2.points)
class(giardia.control_floor_12h_2.points)
class(giardia.methlcell_ceiling_12h_2.points)
class(giardia.methlcell_floor_12h_2.points)

class(giardia.methlcell_ceiling_12h_3.points)
class(giardia.methlcell_floor_12h_3.points)

class(giardia.methlcell_ceiling_12h_4.points)
class(giardia.methlcell_floor_12h_4.points)

ppp.conrol_ceiling_12h <- ppp(x = st_coordinates(giardia.control_ceiling_12h.points)[,1],
                  y = st_coordinates(giardia.control_ceiling_12h.points)[,2],
                  window = win)
unitname(ppp.conrol_ceiling_12h) <- coordinate.units


ppp.conrol_floor_12h <- ppp(x = st_coordinates(giardia.control_floor_12h.points)[,1],
                          y = st_coordinates(giardia.control_floor_12h.points)[,2],
                          window = win)
unitname(ppp.conrol_floor_12h) <- coordinate.units


ppp.methlcell_rep1_ceiling_12h <- ppp(x = st_coordinates(giardia.methlcell_rep1_ceiling_12h.points)[,1],
                     y = st_coordinates(giardia.methlcell_rep1_ceiling_12h.points)[,2],
                     window = win)
unitname(ppp.methlcell_rep1_ceiling_12h) <- coordinate.units

ppp.methlcell_rep1_floor_12h <- ppp(x = st_coordinates(giardia.methlcell_rep1_floor_12h.points)[,1],
                                  y = st_coordinates(giardia.methlcell_rep1_floor_12h.points)[,2],
                                  window = win)
unitname(ppp.methlcell_rep1_floor_12h) <- coordinate.units
#Rep2
ppp.conrol_ceiling_12h_2 <- ppp(x = st_coordinates(giardia.control_ceiling_12h_2.points)[,1],
                              y = st_coordinates(giardia.control_ceiling_12h_2.points)[,2],
                              window = win)
unitname(ppp.conrol_ceiling_12h_2) <- coordinate.units


ppp.conrol_floor_12h_2 <- ppp(x = st_coordinates(giardia.control_floor_12h_2.points)[,1],
                            y = st_coordinates(giardia.control_floor_12h_2.points)[,2],
                            window = win)
unitname(ppp.conrol_floor_12h_2) <- coordinate.units


ppp.methlcell_ceiling_12h_2 <- ppp(x = st_coordinates(giardia.methlcell_ceiling_12h_2.points)[,1],
                                      y = st_coordinates(giardia.methlcell_ceiling_12h_2.points)[,2],
                                      window = win)
unitname(ppp.methlcell_ceiling_12h_2) <- coordinate.units


ppp.methlcell_floor_12h_2 <- ppp(x = st_coordinates(giardia.methlcell_floor_12h_2.points)[,1],
                                    y = st_coordinates(giardia.methlcell_floor_12h_2.points)[,2],
                                    window = win)
unitname(ppp.methlcell_floor_12h_2) <- coordinate.units
#Rep3
ppp.methlcell_ceiling_12h_3 <- ppp(x = st_coordinates(giardia.methlcell_ceiling_12h_3.points)[,1],
                                   y = st_coordinates(giardia.methlcell_ceiling_12h_3.points)[,2],
                                   window = win)
unitname(ppp.methlcell_ceiling_12h_3) <- coordinate.units


ppp.methlcell_floor_12h_3 <- ppp(x = st_coordinates(giardia.methlcell_floor_12h_3.points)[,1],
                                 y = st_coordinates(giardia.methlcell_floor_12h_3.points)[,2],
                                 window = win)
unitname(ppp.methlcell_floor_12h_3) <- coordinate.units
#Rep4
ppp.methlcell_ceiling_12h_4 <- ppp(x = st_coordinates(giardia.methlcell_ceiling_12h_4.points)[,1],
                                   y = st_coordinates(giardia.methlcell_ceiling_12h_4.points)[,2],
                                   window = win)
unitname(ppp.methlcell_ceiling_12h_4) <- coordinate.units


ppp.methlcell_floor_12h_4 <- ppp(x = st_coordinates(giardia.methlcell_floor_12h_4.points)[,1],
                                 y = st_coordinates(giardia.methlcell_floor_12h_4.points)[,2],
                                 window = win)
unitname(ppp.methlcell_floor_12h_4) <- coordinate.units
##24h##
class(giardia.control_ceiling_24h.points)
class(giardia.control_floor_24h.points)
class(giardia.methlcell_rep1_ceiling_24h.points)
class(giardia.methlcell_rep1_floor_24h.points)

class(giardia.control_ceiling_24h_2.points)
class(giardia.control_floor_24h_2.points)
class(giardia.methlcell_ceiling_24h_2.points)
class(giardia.methlcell_floor_24h_2.points)

class(giardia.methlcell_ceiling_24h_3.points)
class(giardia.methlcell_floor_24h_3.points)

class(giardia.methlcell_ceiling_24h_4.points)
class(giardia.methlcell_floor_24h_4.points)

ppp.conrol_ceiling_24h <- ppp(x = st_coordinates(giardia.control_ceiling_24h.points)[,1],
                              y = st_coordinates(giardia.control_ceiling_24h.points)[,2],
                              window = win)
unitname(ppp.conrol_ceiling_24h) <- coordinate.units


ppp.conrol_floor_24h <- ppp(x = st_coordinates(giardia.control_floor_24h.points)[,1],
                            y = st_coordinates(giardia.control_floor_24h.points)[,2],
                            window = win)
unitname(ppp.conrol_floor_24h) <- coordinate.units


ppp.methlcell_rep1_ceiling_24h <- ppp(x = st_coordinates(giardia.methlcell_rep1_ceiling_24h.points)[,1],
                                      y = st_coordinates(giardia.methlcell_rep1_ceiling_24h.points)[,2],
                                      window = win)
unitname(ppp.methlcell_rep1_ceiling_24h) <- coordinate.units


ppp.methlcell_rep1_floor_24h <- ppp(x = st_coordinates(giardia.methlcell_rep1_floor_24h.points)[,1],
                                    y = st_coordinates(giardia.methlcell_rep1_floor_24h.points)[,2],
                                    window = win)
unitname(ppp.methlcell_rep1_floor_24h) <- coordinate.units
#Rep2
ppp.conrol_ceiling_24h_2 <- ppp(x = st_coordinates(giardia.control_ceiling_24h_2.points)[,1],
                                y = st_coordinates(giardia.control_ceiling_24h_2.points)[,2],
                                window = win)
unitname(ppp.conrol_ceiling_24h_2) <- coordinate.units


ppp.conrol_floor_24h_2 <- ppp(x = st_coordinates(giardia.control_floor_24h_2.points)[,1],
                              y = st_coordinates(giardia.control_floor_24h_2.points)[,2],
                              window = win)
unitname(ppp.conrol_floor_24h_2) <- coordinate.units


ppp.methlcell_ceiling_24h_2 <- ppp(x = st_coordinates(giardia.methlcell_ceiling_24h_2.points)[,1],
                                   y = st_coordinates(giardia.methlcell_ceiling_24h_2.points)[,2],
                                   window = win)
unitname(ppp.methlcell_ceiling_24h_2) <- coordinate.units


ppp.methlcell_floor_24h_2 <- ppp(x = st_coordinates(giardia.methlcell_floor_24h_2.points)[,1],
                                 y = st_coordinates(giardia.methlcell_floor_24h_2.points)[,2],
                                 window = win)
unitname(ppp.methlcell_floor_24h_2) <- coordinate.units
#Rep3
ppp.methlcell_ceiling_24h_3 <- ppp(x = st_coordinates(giardia.methlcell_ceiling_24h_3.points)[,1],
                                   y = st_coordinates(giardia.methlcell_ceiling_24h_3.points)[,2],
                                   window = win)
unitname(ppp.methlcell_ceiling_24h_3) <- coordinate.units


ppp.methlcell_floor_24h_3 <- ppp(x = st_coordinates(giardia.methlcell_floor_24h_3.points)[,1],
                                 y = st_coordinates(giardia.methlcell_floor_24h_3.points)[,2],
                                 window = win)
unitname(ppp.methlcell_floor_24h_3) <- coordinate.units
#Rep4
ppp.methlcell_ceiling_24h_4 <- ppp(x = st_coordinates(giardia.methlcell_ceiling_24h_4.points)[,1],
                                   y = st_coordinates(giardia.methlcell_ceiling_24h_4.points)[,2],
                                   window = win)
unitname(ppp.methlcell_ceiling_24h_4) <- coordinate.units


ppp.methlcell_floor_24h_4 <- ppp(x = st_coordinates(giardia.methlcell_floor_24h_4.points)[,1],
                                 y = st_coordinates(giardia.methlcell_floor_24h_4.points)[,2],
                                 window = win)
unitname(ppp.methlcell_floor_24h_4) <- coordinate.units
##36h##
class(giardia.control_ceiling_36h.points)
class(giardia.control_floor_36h.points)
class(giardia.methlcell_rep1_ceiling_36h.points)
class(giardia.methlcell_rep1_floor_36h.points)

class(giardia.control_ceiling_36h_2.points)
class(giardia.control_floor_36h_2.points)
class(giardia.methlcell_ceiling_36h_2.points)
class(giardia.methlcell_floor_36h_2.points)

class(giardia.methlcell_ceiling_36h_3.points)
class(giardia.methlcell_floor_36h_3.points)

class(giardia.methlcell_ceiling_36h_4.points)
class(giardia.methlcell_floor_36h_4.points)
ppp.conrol_ceiling_36h <- ppp(x = st_coordinates(giardia.control_ceiling_36h.points)[,1],
                              y = st_coordinates(giardia.control_ceiling_36h.points)[,2],
                              window = win)
unitname(ppp.conrol_ceiling_36h) <- coordinate.units


ppp.conrol_floor_36h <- ppp(x = st_coordinates(giardia.control_floor_36h.points)[,1],
                            y = st_coordinates(giardia.control_floor_36h.points)[,2],
                            window = win)
unitname(ppp.conrol_floor_36h) <- coordinate.units


ppp.methlcell_rep1_ceiling_36h <- ppp(x = st_coordinates(giardia.methlcell_rep1_ceiling_36h.points)[,1],
                                      y = st_coordinates(giardia.methlcell_rep1_ceiling_36h.points)[,2],
                                      window = win)
unitname(ppp.methlcell_rep1_ceiling_36h) <- coordinate.units


ppp.methlcell_rep1_floor_36h <- ppp(x = st_coordinates(giardia.methlcell_rep1_floor_36h.points)[,1],
                                    y = st_coordinates(giardia.methlcell_rep1_floor_36h.points)[,2],
                                    window = win)
unitname(ppp.methlcell_rep1_floor_36h) <- coordinate.units
#Rep2
ppp.conrol_ceiling_36h_2 <- ppp(x = st_coordinates(giardia.control_ceiling_36h_2.points)[,1],
                                y = st_coordinates(giardia.control_ceiling_36h_2.points)[,2],
                                window = win)
unitname(ppp.conrol_ceiling_36h_2) <- coordinate.units


ppp.conrol_floor_36h_2 <- ppp(x = st_coordinates(giardia.control_floor_36h_2.points)[,1],
                              y = st_coordinates(giardia.control_floor_36h_2.points)[,2],
                              window = win)
unitname(ppp.conrol_floor_36h_2) <- coordinate.units


ppp.methlcell_ceiling_36h_2 <- ppp(x = st_coordinates(giardia.methlcell_ceiling_36h_2.points)[,1],
                                   y = st_coordinates(giardia.methlcell_ceiling_36h_2.points)[,2],
                                   window = win)
unitname(ppp.methlcell_ceiling_36h_2) <- coordinate.units


ppp.methlcell_floor_36h_2 <- ppp(x = st_coordinates(giardia.methlcell_floor_36h_2.points)[,1],
                                 y = st_coordinates(giardia.methlcell_floor_36h_2.points)[,2],
                                 window = win)
unitname(ppp.methlcell_floor_36h_2) <- coordinate.units
#Rep3
ppp.methlcell_ceiling_36h_3 <- ppp(x = st_coordinates(giardia.methlcell_ceiling_36h_3.points)[,1],
                                   y = st_coordinates(giardia.methlcell_ceiling_36h_3.points)[,2],
                                   window = win)
unitname(ppp.methlcell_ceiling_36h_3) <- coordinate.units


ppp.methlcell_floor_36h_3 <- ppp(x = st_coordinates(giardia.methlcell_floor_36h_3.points)[,1],
                                 y = st_coordinates(giardia.methlcell_floor_36h_3.points)[,2],
                                 window = win)
unitname(ppp.methlcell_floor_36h_3) <- coordinate.units
#Rep4
ppp.methlcell_ceiling_36h_4 <- ppp(x = st_coordinates(giardia.methlcell_ceiling_36h_4.points)[,1],
                                   y = st_coordinates(giardia.methlcell_ceiling_36h_4.points)[,2],
                                   window = win)
unitname(ppp.methlcell_ceiling_36h_4) <- coordinate.units


ppp.methlcell_floor_36h_4 <- ppp(x = st_coordinates(giardia.methlcell_floor_36h_4.points)[,1],
                                 y = st_coordinates(giardia.methlcell_floor_36h_4.points)[,2],
                                 window = win)
unitname(ppp.methlcell_floor_36h_4) <- coordinate.units
##48h##
class(giardia.control_ceiling_48h.points)
class(giardia.control_floor_48h.points)
class(giardia.methlcell_rep1_ceiling_48h.points)
class(giardia.methlcell_rep1_floor_48h.points)

class(giardia.control_ceiling_48h_2.points)
class(giardia.control_floor_48h_2.points)
class(giardia.methlcell_ceiling_48h_2.points)
class(giardia.methlcell_floor_48h_2.points)

class(giardia.methlcell_ceiling_48h_3.points)
class(giardia.methlcell_floor_48h_3.points)

class(giardia.methlcell_ceiling_48h_4.points)
class(giardia.methlcell_floor_48h_4.points)
ppp.conrol_ceiling_48h <- ppp(x = st_coordinates(giardia.control_ceiling_48h.points)[,1],
                              y = st_coordinates(giardia.control_ceiling_48h.points)[,2],
                              window = win)
unitname(ppp.conrol_ceiling_48h) <- coordinate.units


ppp.conrol_floor_48h <- ppp(x = st_coordinates(giardia.control_floor_48h.points)[,1],
                            y = st_coordinates(giardia.control_floor_48h.points)[,2],
                            window = win)
unitname(ppp.conrol_floor_48h) <- coordinate.units


ppp.methlcell_rep1_ceiling_48h <- ppp(x = st_coordinates(giardia.methlcell_rep1_ceiling_48h.points)[,1],
                                      y = st_coordinates(giardia.methlcell_rep1_ceiling_48h.points)[,2],
                                      window = win)
unitname(ppp.methlcell_rep1_ceiling_48h) <- coordinate.units


ppp.methlcell_rep1_floor_48h <- ppp(x = st_coordinates(giardia.methlcell_rep1_floor_48h.points)[,1],
                                    y = st_coordinates(giardia.methlcell_rep1_floor_48h.points)[,2],
                                    window = win)
unitname(ppp.methlcell_rep1_floor_48h) <- coordinate.units
#Rep2
ppp.conrol_ceiling_48h_2 <- ppp(x = st_coordinates(giardia.control_ceiling_48h_2.points)[,1],
                                y = st_coordinates(giardia.control_ceiling_48h_2.points)[,2],
                                window = win)
unitname(ppp.conrol_ceiling_48h_2) <- coordinate.units


ppp.conrol_floor_48h_2 <- ppp(x = st_coordinates(giardia.control_floor_48h_2.points)[,1],
                              y = st_coordinates(giardia.control_floor_48h_2.points)[,2],
                              window = win)
unitname(ppp.conrol_floor_48h_2) <- coordinate.units


ppp.methlcell_ceiling_48h_2 <- ppp(x = st_coordinates(giardia.methlcell_ceiling_48h_2.points)[,1],
                                   y = st_coordinates(giardia.methlcell_ceiling_48h_2.points)[,2],
                                   window = win)
unitname(ppp.methlcell_ceiling_48h_2) <- coordinate.units


ppp.methlcell_floor_48h_2 <- ppp(x = st_coordinates(giardia.methlcell_floor_48h_2.points)[,1],
                                 y = st_coordinates(giardia.methlcell_floor_48h_2.points)[,2],
                                 window = win)
unitname(ppp.methlcell_floor_48h_2) <- coordinate.units
#Rep3
ppp.methlcell_ceiling_48h_3 <- ppp(x = st_coordinates(giardia.methlcell_ceiling_48h_3.points)[,1],
                                   y = st_coordinates(giardia.methlcell_ceiling_48h_3.points)[,2],
                                   window = win)
unitname(ppp.methlcell_ceiling_48h_3) <- coordinate.units


ppp.methlcell_floor_48h_3 <- ppp(x = st_coordinates(giardia.methlcell_floor_48h_3.points)[,1],
                                 y = st_coordinates(giardia.methlcell_floor_48h_3.points)[,2],
                                 window = win)
unitname(ppp.methlcell_floor_48h_3) <- coordinate.units
#Rep4
ppp.methlcell_ceiling_48h_4 <- ppp(x = st_coordinates(giardia.methlcell_ceiling_48h_4.points)[,1],
                                   y = st_coordinates(giardia.methlcell_ceiling_48h_4.points)[,2],
                                   window = win)
unitname(ppp.methlcell_ceiling_48h_4) <- coordinate.units


ppp.methlcell_floor_48h_4 <- ppp(x = st_coordinates(giardia.methlcell_floor_48h_4.points)[,1],
                                 y = st_coordinates(giardia.methlcell_floor_48h_4.points)[,2],
                                 window = win)
unitname(ppp.methlcell_floor_48h_4) <- coordinate.units
##60h##
class(giardia.control_ceiling_60h.points)
class(giardia.control_floor_60h.points)
class(giardia.methlcell_rep1_ceiling_60h.points)
class(giardia.methlcell_rep1_floor_60h.points)

class(giardia.control_ceiling_60h_2.points)
class(giardia.control_floor_60h_2.points)
class(giardia.methlcell_ceiling_60h_2.points)
class(giardia.methlcell_floor_60h_2.points)

class(giardia.methlcell_ceiling_60h_3.points)
class(giardia.methlcell_floor_60h_3.points)

class(giardia.methlcell_ceiling_60h_4.points)
class(giardia.methlcell_floor_60h_4.points)

ppp.conrol_ceiling_60h <- ppp(x = st_coordinates(giardia.control_ceiling_60h.points)[,1],
                              y = st_coordinates(giardia.control_ceiling_60h.points)[,2],
                              window = win)
unitname(ppp.conrol_ceiling_60h) <- coordinate.units


ppp.conrol_floor_60h <- ppp(x = st_coordinates(giardia.control_floor_60h.points)[,1],
                            y = st_coordinates(giardia.control_floor_60h.points)[,2],
                            window = win)
unitname(ppp.conrol_floor_60h) <- coordinate.units


ppp.methlcell_rep1_ceiling_60h <- ppp(x = st_coordinates(giardia.methlcell_rep1_ceiling_60h.points)[,1],
                                      y = st_coordinates(giardia.methlcell_rep1_ceiling_60h.points)[,2],
                                      window = win)
unitname(ppp.methlcell_rep1_ceiling_60h) <- coordinate.units


ppp.methlcell_rep1_floor_60h <- ppp(x = st_coordinates(giardia.methlcell_rep1_floor_60h.points)[,1],
                                    y = st_coordinates(giardia.methlcell_rep1_floor_60h.points)[,2],
                                    window = win)
unitname(ppp.methlcell_rep1_floor_60h) <- coordinate.units
#Rep2
ppp.conrol_ceiling_60h_2 <- ppp(x = st_coordinates(giardia.control_ceiling_60h_2.points)[,1],
                                y = st_coordinates(giardia.control_ceiling_60h_2.points)[,2],
                                window = win)
unitname(ppp.conrol_ceiling_60h_2) <- coordinate.units


ppp.conrol_floor_60h_2 <- ppp(x = st_coordinates(giardia.control_floor_60h_2.points)[,1],
                              y = st_coordinates(giardia.control_floor_60h_2.points)[,2],
                              window = win)
unitname(ppp.conrol_floor_60h_2) <- coordinate.units


ppp.methlcell_ceiling_60h_2 <- ppp(x = st_coordinates(giardia.methlcell_ceiling_60h_2.points)[,1],
                                   y = st_coordinates(giardia.methlcell_ceiling_60h_2.points)[,2],
                                   window = win)
unitname(ppp.methlcell_ceiling_60h_2) <- coordinate.units


ppp.methlcell_floor_60h_2 <- ppp(x = st_coordinates(giardia.methlcell_floor_60h_2.points)[,1],
                                 y = st_coordinates(giardia.methlcell_floor_60h_2.points)[,2],
                                 window = win)
unitname(ppp.methlcell_floor_60h_2) <- coordinate.units
#Rep3
ppp.methlcell_ceiling_60h_3 <- ppp(x = st_coordinates(giardia.methlcell_ceiling_60h_3.points)[,1],
                                   y = st_coordinates(giardia.methlcell_ceiling_60h_3.points)[,2],
                                   window = win)
unitname(ppp.methlcell_ceiling_60h_3) <- coordinate.units


ppp.methlcell_floor_60h_3 <- ppp(x = st_coordinates(giardia.methlcell_floor_60h_3.points)[,1],
                                 y = st_coordinates(giardia.methlcell_floor_60h_3.points)[,2],
                                 window = win)
unitname(ppp.methlcell_floor_60h_3) <- coordinate.units
#Rep4
ppp.methlcell_ceiling_60h_4 <- ppp(x = st_coordinates(giardia.methlcell_ceiling_60h_4.points)[,1],
                                   y = st_coordinates(giardia.methlcell_ceiling_60h_4.points)[,2],
                                   window = win)
unitname(ppp.methlcell_ceiling_60h_4) <- coordinate.units


ppp.methlcell_floor_60h_4 <- ppp(x = st_coordinates(giardia.methlcell_floor_60h_4.points)[,1],
                                 y = st_coordinates(giardia.methlcell_floor_60h_4.points)[,2],
                                 window = win)
unitname(ppp.methlcell_floor_60h_4) <- coordinate.units
########################End construct ppp object######################
#plot kernel density plot for 48&60 control ceiling & floor vs. methlcell ceiling & floor:
#Tryout multiple sigma values. 
#If decide on 1 sigma value, remember to change j 
par(mfrow=c(2,2), mar=c(0,0,1,2))
sigma <- c(300,500,700)
data <- list(ppp.conrol_ceiling_48h, ppp.methlcell_rep1_ceiling_48h,
             ppp.conrol_floor_48h,  ppp.methlcell_rep1_floor_48h,
             ppp.conrol_ceiling_60h, ppp.methlcell_rep1_ceiling_60h,
             ppp.conrol_floor_60h,  ppp.methlcell_rep1_floor_60h,
             ppp.conrol_ceiling_48h_2, ppp.methlcell_ceiling_48h_2,
             ppp.conrol_floor_48h_2, ppp.methlcell_ceiling_48h_2)
main <- c('control_ceiling_48h', 'control_floor_48h', 'methylcellulose_ceiling_48h', 'methylcellulose_floor_48h'
          ,'control_ceiling_60h', 'control_floor_60h', 'methylcellulose_ceiling_60h', 'methylcellulose_floor_60h')
for (j in 1:3){
  for (i in 1:4){
    ds <- density.ppp(data[[i]], sigma=sigma[j])
    plot(ds, 
         main = paste0(main[i],', sigma:', sigma[j]))
    plot(data[[i]], add=T, cex=0.1, regular=F)}}

#######Make a inclusive grouped plots pdf######
pdf(file = "/Users/apple/Documents/R workshop 2017/project x/analysis/output/BioRep3_4_6_21plots_points&heatmaps&PP.pdf", 
    height = 8, width = 20)
par(mfrow=c(4,5), mar=c(1, 1, 1, 1))
plot(ppp.conrol_ceiling_12h)
plot(ppp.conrol_ceiling_24h)
plot(ppp.conrol_ceiling_36h)
plot(ppp.conrol_ceiling_48h)
plot(ppp.conrol_ceiling_60h)
plot(ppp.conrol_floor_12h)
plot(ppp.conrol_floor_24h)
plot(ppp.conrol_floor_36h)
plot(ppp.conrol_floor_48h)
plot(ppp.conrol_floor_60h)
plot(ppp.methlcell_rep1_ceiling_12h)
plot(ppp.methlcell_rep1_ceiling_24h)
plot(ppp.methlcell_rep1_ceiling_36h)
plot(ppp.methlcell_rep1_ceiling_48h)
plot(ppp.methlcell_rep1_ceiling_60h)
plot(ppp.methlcell_rep1_floor_12h)
plot(ppp.methlcell_rep1_floor_24h)
plot(ppp.methlcell_rep1_floor_36h)
plot(ppp.methlcell_rep1_floor_48h)
plot(ppp.methlcell_rep1_floor_60h)
plot(ppp.conrol_ceiling_12h_2)
plot(ppp.conrol_ceiling_24h_2)
plot(ppp.conrol_ceiling_36h_2)
plot(ppp.conrol_ceiling_48h_2)
plot(ppp.conrol_ceiling_60h_2)
plot(ppp.conrol_floor_12h_2)
plot(ppp.conrol_floor_24h_2)
plot(ppp.conrol_floor_36h_2)
plot(ppp.conrol_floor_48h_2)
plot(ppp.conrol_floor_60h_2)
plot(ppp.methlcell_ceiling_12h_3)
plot(ppp.methlcell_ceiling_24h_3)
plot(ppp.methlcell_ceiling_36h_3)
plot(ppp.methlcell_ceiling_48h_3)
plot(ppp.methlcell_ceiling_60h_3)
plot(ppp.methlcell_floor_12h_3)
plot(ppp.methlcell_floor_24h_3)
plot(ppp.methlcell_floor_36h_3)
plot(ppp.methlcell_floor_48h_3)
plot(ppp.methlcell_floor_60h_3)
plot(ppp.methlcell_ceiling_12h_2)
plot(ppp.methlcell_ceiling_24h_2)
plot(ppp.methlcell_ceiling_36h_2)
plot(ppp.methlcell_ceiling_48h_2)
plot(ppp.methlcell_ceiling_60h_2)
plot(ppp.methlcell_floor_12h_2)
plot(ppp.methlcell_floor_24h_2)
plot(ppp.methlcell_floor_36h_2)
plot(ppp.methlcell_floor_48h_2)
plot(ppp.methlcell_floor_60h_2)
plot(ppp.methlcell_ceiling_12h_4)
plot(ppp.methlcell_ceiling_24h_4)
plot(ppp.methlcell_ceiling_36h_4)
plot(ppp.methlcell_ceiling_48h_4)
plot(ppp.methlcell_ceiling_60h_4)
plot(ppp.methlcell_floor_12h_4)
plot(ppp.methlcell_floor_24h_4)
plot(ppp.methlcell_floor_36h_4)
plot(ppp.methlcell_floor_48h_4)
plot(ppp.methlcell_floor_60h_4)


sigma <- c(300,500,700)
data <- list(ppp.conrol_ceiling_12h,   
             ppp.conrol_ceiling_24h,   
             ppp.conrol_ceiling_36h,   
             ppp.conrol_ceiling_48h,
             ppp.conrol_ceiling_60h,
             ppp.conrol_floor_12h,
             ppp.conrol_floor_24h,
             ppp.conrol_floor_36h,
             ppp.conrol_floor_48h,
             ppp.conrol_floor_60h,
             ppp.methlcell_rep1_ceiling_12h,
             ppp.methlcell_rep1_ceiling_24h,
             ppp.methlcell_rep1_ceiling_36h,
             ppp.methlcell_rep1_ceiling_48h,
             ppp.methlcell_rep1_ceiling_60h,
             ppp.methlcell_rep1_floor_12h,
             ppp.methlcell_rep1_floor_24h,
             ppp.methlcell_rep1_floor_36h,
             ppp.methlcell_rep1_floor_48h,
             ppp.methlcell_rep1_floor_60h,
             ppp.conrol_ceiling_12h_2,   
             ppp.conrol_ceiling_24h_2,   
             ppp.conrol_ceiling_36h_2,   
             ppp.conrol_ceiling_48h_2,
             ppp.conrol_ceiling_60h_2,
             ppp.conrol_floor_12h_2,
             ppp.conrol_floor_24h_2,
             ppp.conrol_floor_36h_2,
             ppp.conrol_floor_48h_2,
             ppp.conrol_floor_60h_2,
             ppp.methlcell_ceiling_12h_3,
             ppp.methlcell_ceiling_24h_3,
             ppp.methlcell_ceiling_36h_3,
             ppp.methlcell_ceiling_48h_3,
             ppp.methlcell_ceiling_60h_3,
             ppp.methlcell_floor_12h_3,
             ppp.methlcell_floor_24h_3,
             ppp.methlcell_floor_36h_3,
             ppp.methlcell_floor_48h_3,
             ppp.methlcell_floor_60h_3,
             ppp.methlcell_ceiling_12h_2,
             ppp.methlcell_ceiling_24h_2,
             ppp.methlcell_ceiling_36h_2,
             ppp.methlcell_ceiling_48h_2,
             ppp.methlcell_ceiling_60h_2,
             ppp.methlcell_floor_12h_2,
             ppp.methlcell_floor_24h_2,
             ppp.methlcell_floor_36h_2,
             ppp.methlcell_floor_48h_2,
             ppp.methlcell_floor_60h_2,
             ppp.methlcell_ceiling_12h_4,
             ppp.methlcell_ceiling_24h_4,
             ppp.methlcell_ceiling_36h_4,
             ppp.methlcell_ceiling_48h_4,
             ppp.methlcell_ceiling_60h_4,
             ppp.methlcell_floor_12h_4,
             ppp.methlcell_floor_24h_4,
             ppp.methlcell_floor_36h_4,
             ppp.methlcell_floor_48h_4,
             ppp.methlcell_floor_60h_4)
main <- c('control_ceiling_12h',   
          'control_ceiling_24h',   
          'control_ceiling_36h',   
          'control_ceiling_48h',   
          'control_ceiling_60h',
          'control_floor_12h',
          'control_floor_24h',
          'control_floor_36h',
          'control_floor_48h',
          'control_floor_60h',
          'methylcellulose_ceiling_12h',
          'methylcellulose_ceiling_24h',
          'methylcellulose_ceiling_36h',
          'methylcellulose_ceiling_48h',
          'methylcellulose_ceiling_60h',
          'methylcellulose_floor_12h',
          'methylcellulose_floor_24h',
          'methylcellulose_floor_36h',
          'methylcellulose_floor_48h',
          'methylcellulose_floor_60h',
          'control_ceiling_12h_2',   
          'control_ceiling_24h_2',   
          'control_ceiling_36h_2',   
          'control_ceiling_48h_2',   
          'control_ceiling_60h_2',
          'control_floor_12h_2',
          'control_floor_24h_2',
          'control_floor_36h_2',
          'control_floor_48h_2',
          'control_floor_60h_2',
          'methylcellulose_ceiling_12h_2',
          'methylcellulose_ceiling_24h_2',
          'methylcellulose_ceiling_36h_2',
          'methylcellulose_ceiling_48h_2',
          'methylcellulose_ceiling_60h_2',
          'methylcellulose_floor_12h_2',
          'methylcellulose_floor_24h_2',
          'methylcellulose_floor_36h_2',
          'methylcellulose_floor_48h_2',
          'methylcellulose_floor_60h_2',
          'methylcellulose_ceiling_12h_3',
          'methylcellulose_ceiling_24h_3',
          'methylcellulose_ceiling_36h_3',
          'methylcellulose_ceiling_48h_3',
          'methylcellulose_ceiling_60h_3',
          'methylcellulose_floor_12h_3',
          'methylcellulose_floor_24h_3',
          'methylcellulose_floor_36h_3',
          'methylcellulose_floor_48h_3',
          'methylcellulose_floor_60h_3',
          'methylcellulose_ceiling_12h_4',
          'methylcellulose_ceiling_24h_4',
          'methylcellulose_ceiling_36h_4',
          'methylcellulose_ceiling_48h_4',
          'methylcellulose_ceiling_60h_4',
          'methylcellulose_floor_12h_4',
          'methylcellulose_floor_24h_4',
          'methylcellulose_floor_36h_4',
          'methylcellulose_floor_48h_4',
          'methylcellulose_floor_60h_4')
for (j in 1:3){
  for (i in 1:20){
    ds <- density.ppp(data[[i]], sigma=sigma[j])
    plot(ds, 
         main = paste0(main[i],', sigma:', sigma[j]))
    plot(data[[i]], add=T, cex=0.1, regular=F)}}
for (j in 1:3){
  for (i in 21:40) {
    ds <- density.ppp(data[[i]], sigma=sigma[j])
    plot(ds, 
         main = paste0(main[i],', sigma:', sigma[j]))
    plot(data[[i]], add=T, cex=0.1, regular=F)}}
for (j in 1:3){
  for (i in 41:60) {
    ds <- density.ppp(data[[i]], sigma=sigma[j])
    plot(ds, 
         main = paste0(main[i],', sigma:', sigma[j]))
    plot(data[[i]], add=T, cex=0.1, regular=F)}}

par(mfrow=c(1,2), mar=c(1,1,1,1))
plot(allstats(ppp.conrol_ceiling_48h), main='giardia control ceiling48h')
plot(allstats(ppp.conrol_floor_48h), main='giardia control floor48h')
plot(allstats(ppp.methlcell_rep1_ceiling_48h), main='giardia methlcell ceiling48h')
plot(allstats(ppp.methlcell_rep1_floor_48h), main='giardia methlcell floor48h')
plot(allstats(ppp.conrol_ceiling_60h), main='giardia control ceiling60h')
plot(allstats(ppp.conrol_floor_60h), main='giardia control floor60h')
plot(allstats(ppp.methlcell_rep1_ceiling_60h), main='giardia methlcell ceiling60h')
plot(allstats(ppp.methlcell_rep1_floor_60h), main='giardia methlcell floor60h')

plot(allstats(ppp.conrol_ceiling_48h_2), main='giardia control ceiling48h_2')
plot(allstats(ppp.conrol_floor_48h_2), main='giardia control floor48h_2')
plot(allstats(ppp.methlcell_ceiling_48h_3), main='giardia methlcell ceiling48h_3')
plot(allstats(ppp.methlcell_floor_48h_3), main='giardia methlcell floor48h_3')
plot(allstats(ppp.conrol_ceiling_60h_2), main='giardia control ceiling60h_2')
plot(allstats(ppp.conrol_floor_60h_2), main='giardia control floor60h_2')
plot(allstats(ppp.methlcell_ceiling_60h_3), main='giardia methlcell ceiling60h_3')
plot(allstats(ppp.methlcell_floor_60h_3), main='giardia methlcell floor60h_3')

plot(allstats(ppp.methlcell_ceiling_48h_2), main='giardia methlcell ceiling48h_2')
plot(allstats(ppp.methlcell_floor_48h_2), main='giardia methlcell floor48h_2')
plot(allstats(ppp.methlcell_ceiling_60h_2), main='giardia methlcell ceiling60h_2')
plot(allstats(ppp.methlcell_floor_60h_2), main='giardia methlcell floor60h_2')

plot(allstats(ppp.methlcell_ceiling_48h_4), main='giardia methlcell ceiling48h_4')
plot(allstats(ppp.methlcell_floor_48h_4), main='giardia methlcell floor48h_4')
plot(allstats(ppp.methlcell_ceiling_60h_4), main='giardia methlcell ceiling60h_4')
plot(allstats(ppp.methlcell_floor_60h_4), main='giardia methlcell floor60h_4')

dev.off()

