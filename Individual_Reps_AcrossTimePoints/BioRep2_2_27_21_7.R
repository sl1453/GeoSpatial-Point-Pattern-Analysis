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
#Create the Polygon Window
giardia.polygon <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/60h_BioRep2_2_27_21.xlsx",sheet=7)
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
giardia.control_ceiling_12h <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/12h_BioRep2_2_27_21.xlsx",sheet=1) 

giardia.control_ceiling_12h.df <- data.frame(
  lon = c(giardia.control_ceiling_12h$x_coordinate),
  lat = c(giardia.control_ceiling_12h$y_coordinate)
)
giardia.control_ceiling_12h.points <- giardia.control_ceiling_12h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#12h Giardia Control floor Data
giardia.control_floor_12h <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/12h_BioRep2_2_27_21.xlsx",sheet=2)
  
giardia.control_floor_12h.df <- data.frame(
  lon = c(giardia.control_floor_12h$x_coordinate),
  lat = c(giardia.control_floor_12h$y_coordinate)
)
giardia.control_floor_12h.points <- giardia.control_floor_12h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#Giardia methylcell_rep1 Ceiling Data
giardia.methylcell_rep1_ceiling_12h <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/12h_BioRep2_2_27_21.xlsx",sheet=3)

giardia.methylcell_rep1_ceiling_12h.df <- data.frame(
  lon = c(giardia.methylcell_rep1_ceiling_12h$x_coordinate),
  lat = c(giardia.methylcell_rep1_ceiling_12h$y_coordinate)
)

giardia.methlcell_rep1_ceiling_12h.points <- giardia.methylcell_rep1_ceiling_12h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#Giardia methylcell_rep1 floor Data
giardia.methylcell_rep1_floor_12h <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/12h_BioRep2_2_27_21.xlsx",sheet=4)

giardia.methylcell_rep1_floor_12h.df <- data.frame(
  lon = c(giardia.methylcell_rep1_floor_12h$x_coordinate),
  lat = c(giardia.methylcell_rep1_floor_12h$y_coordinate)
)

giardia.methlcell_rep1_floor_12h.points <- giardia.methylcell_rep1_floor_12h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

########24h data ##########
#24h Giardia Control Ceiling Data
giardia.control_ceiling_24h <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/24h_BioRep2_2_27_21.xlsx",sheet=1) 

giardia.control_ceiling_24h.df <- data.frame(
  lon = c(giardia.control_ceiling_24h$x_coordinate),
  lat = c(giardia.control_ceiling_24h$y_coordinate)
)
giardia.control_ceiling_24h.points <- giardia.control_ceiling_24h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#24h Giardia Control floor Data
giardia.control_floor_24h <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/24h_BioRep2_2_27_21.xlsx",sheet=2)

giardia.control_floor_24h.df <- data.frame(
  lon = c(giardia.control_floor_24h$x_coordinate),
  lat = c(giardia.control_floor_24h$y_coordinate)
)
giardia.control_floor_24h.points <- giardia.control_floor_24h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#24h Giardia methylcell_rep1 Ceiling Data
giardia.methylcell_rep1_ceiling_24h <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/24h_BioRep2_2_27_21.xlsx",sheet=3)

giardia.methylcell_rep1_ceiling_24h.df <- data.frame(
  lon = c(giardia.methylcell_rep1_ceiling_24h$x_coordinate),
  lat = c(giardia.methylcell_rep1_ceiling_24h$y_coordinate)
)

giardia.methlcell_rep1_ceiling_24h.points <- giardia.methylcell_rep1_ceiling_24h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#24h Giardia methylcell_rep1 floor Data
giardia.methylcell_rep1_floor_24h <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/24h_BioRep2_2_27_21.xlsx",sheet=4)

giardia.methylcell_rep1_floor_24h.df <- data.frame(
  lon = c(giardia.methylcell_rep1_floor_24h$x_coordinate),
  lat = c(giardia.methylcell_rep1_floor_24h$y_coordinate)
)

giardia.methlcell_rep1_floor_24h.points <- giardia.methylcell_rep1_floor_24h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

########36h data ##########
#36h Giardia Control Ceiling Data
giardia.control_ceiling_36h <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/36h_BioRep2_2_27_21.xlsx",sheet=1) 

giardia.control_ceiling_36h.df <- data.frame(
  lon = c(giardia.control_ceiling_36h$x_coordinate),
  lat = c(giardia.control_ceiling_36h$y_coordinate)
)
giardia.control_ceiling_36h.points <- giardia.control_ceiling_36h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#36h Giardia Control floor Data
giardia.control_floor_36h <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/36h_BioRep2_2_27_21.xlsx",sheet=2)

giardia.control_floor_36h.df <- data.frame(
  lon = c(giardia.control_floor_36h$x_coordinate),
  lat = c(giardia.control_floor_36h$y_coordinate)
)
giardia.control_floor_36h.points <- giardia.control_floor_36h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#36h Giardia methylcell_rep1 Ceiling Data
giardia.methylcell_rep1_ceiling_36h <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/36h_BioRep2_2_27_21.xlsx",sheet=3)

giardia.methylcell_rep1_ceiling_36h.df <- data.frame(
  lon = c(giardia.methylcell_rep1_ceiling_36h$x_coordinate),
  lat = c(giardia.methylcell_rep1_ceiling_36h$y_coordinate)
)

giardia.methlcell_rep1_ceiling_36h.points <- giardia.methylcell_rep1_ceiling_36h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#36h Giardia methylcell_rep1 floor Data
giardia.methylcell_rep1_floor_36h <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/36h_BioRep2_2_27_21.xlsx",sheet=4)

giardia.methylcell_rep1_floor_36h.df <- data.frame(
  lon = c(giardia.methylcell_rep1_floor_36h$x_coordinate),
  lat = c(giardia.methylcell_rep1_floor_36h$y_coordinate)
)

giardia.methlcell_rep1_floor_36h.points <- giardia.methylcell_rep1_floor_36h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

########48h data ##########
#48h Giardia Control Ceiling Data
giardia.control_ceiling_48h <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/48h_BioRep2_2_27_21_7.xlsx",sheet=1) 

giardia.control_ceiling_48h.df <- data.frame(
  lon = c(giardia.control_ceiling_48h$x_coordinate),
  lat = c(giardia.control_ceiling_48h$y_coordinate)
)
giardia.control_ceiling_48h.points <- giardia.control_ceiling_48h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#48h Giardia Control floor Data
giardia.control_floor_48h <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/48h_BioRep2_2_27_21_7.xlsx",sheet=2,
                                        range = cell_cols('A:C'))

giardia.control_floor_48h.df <- data.frame(
  lon = c(giardia.control_floor_48h$x_coordinate),
  lat = c(giardia.control_floor_48h$y_coordinate)
)
giardia.control_floor_48h.points <- giardia.control_floor_48h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#48h Giardia methylcell_rep1 Ceiling Data
giardia.methylcell_rep1_ceiling_48h <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/48h_BioRep2_2_27_21_7.xlsx",sheet=3)

giardia.methylcell_rep1_ceiling_48h.df <- data.frame(
  lon = c(giardia.methylcell_rep1_ceiling_48h$x_coordinate),
  lat = c(giardia.methylcell_rep1_ceiling_48h$y_coordinate)
)

giardia.methlcell_rep1_ceiling_48h.points <- giardia.methylcell_rep1_ceiling_48h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#48h Giardia methylcell_rep1 floor Data
giardia.methylcell_rep1_floor_48h <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/48h_BioRep2_2_27_21_7.xlsx",sheet=4)

giardia.methylcell_rep1_floor_48h.df <- data.frame(
  lon = c(giardia.methylcell_rep1_floor_48h$x_coordinate),
  lat = c(giardia.methylcell_rep1_floor_48h$y_coordinate)
)

giardia.methlcell_rep1_floor_48h.points <- giardia.methylcell_rep1_floor_48h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

########60h data ##########
#60h Giardia Control Ceiling Data
giardia.control_ceiling_60h <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/60h_BioRep2_2_27_21.xlsx",sheet=1) 

giardia.control_ceiling_60h.df <- data.frame(
  lon = c(giardia.control_ceiling_60h$x_coordinate),
  lat = c(giardia.control_ceiling_60h$y_coordinate)
)
giardia.control_ceiling_60h.points <- giardia.control_ceiling_60h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#60h Giardia Control floor Data
giardia.control_floor_60h <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/60h_BioRep2_2_27_21.xlsx",sheet=2)

giardia.control_floor_60h.df <- data.frame(
  lon = c(giardia.control_floor_60h$x_coordinate),
  lat = c(giardia.control_floor_60h$y_coordinate)
)
giardia.control_floor_60h.points <- giardia.control_floor_60h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#60h Giardia methylcell_rep1 Ceiling Data
giardia.methylcell_rep1_ceiling_60h <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/60h_BioRep2_2_27_21.xlsx",sheet=3)

giardia.methylcell_rep1_ceiling_60h.df <- data.frame(
  lon = c(giardia.methylcell_rep1_ceiling_60h$x_coordinate),
  lat = c(giardia.methylcell_rep1_ceiling_60h$y_coordinate)
)

giardia.methlcell_rep1_ceiling_60h.points <- giardia.methylcell_rep1_ceiling_60h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#60h Giardia methylcell_rep1 floor Data
giardia.methylcell_rep1_floor_60h <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/60h_BioRep2_2_27_21.xlsx",sheet=4)

giardia.methylcell_rep1_floor_60h.df <- data.frame(
  lon = c(giardia.methylcell_rep1_floor_60h$x_coordinate),
  lat = c(giardia.methylcell_rep1_floor_60h$y_coordinate)
)

giardia.methlcell_rep1_floor_60h.points <- giardia.methylcell_rep1_floor_60h.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)
#####################End of 60 h Data #########################
#####################Load rep 2 data ##########################
#Giardia methylcell_rep2 Ceiling Data
giardia.methylcell_ceiling_12h_2 <- read_excel("data/12h_BioRep2_2_27_21.xlsx",sheet='mCell_rep2_c')

giardia.methylcell_ceiling_12h_2.df <- data.frame(
  lon = c(giardia.methylcell_ceiling_12h_2$x_coordinate),
  lat = c(giardia.methylcell_ceiling_12h_2$y_coordinate)
)

giardia.methlcell_ceiling_12h_2.points <- giardia.methylcell_ceiling_12h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#Giardia methylcell_rep2 floor Data
giardia.methylcell_floor_12h_2 <- read_excel("data/12h_BioRep2_2_27_21.xlsx",sheet='mCell_rep2_f')

giardia.methylcell_floor_12h_2.df <- data.frame(
  lon = c(giardia.methylcell_floor_12h_2$x_coordinate),
  lat = c(giardia.methylcell_floor_12h_2$y_coordinate)
)

giardia.methlcell_floor_12h_2.points <- giardia.methylcell_floor_12h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

########24h data ##########
#24h Giardia methylcell_rep2 Ceiling Data
giardia.methylcell_ceiling_24h_2 <- read_excel("data/24h_BioRep2_2_27_21.xlsx",sheet='mCell_rep2_c')

giardia.methylcell_ceiling_24h_2.df <- data.frame(
  lon = c(giardia.methylcell_ceiling_24h_2$x_coordinate),
  lat = c(giardia.methylcell_ceiling_24h_2$y_coordinate)
)

giardia.methlcell_ceiling_24h_2.points <- giardia.methylcell_ceiling_24h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#24h Giardia methylcell_rep2 floor Data
giardia.methylcell_floor_24h_2 <- read_excel("data/24h_BioRep2_2_27_21.xlsx",sheet='mCell_rep2_f')

giardia.methylcell_floor_24h_2.df <- data.frame(
  lon = c(giardia.methylcell_floor_24h_2$x_coordinate),
  lat = c(giardia.methylcell_floor_24h_2$y_coordinate)
)

giardia.methlcell_floor_24h_2.points <- giardia.methylcell_floor_24h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

########36h data ##########
#36h Giardia methylcell_rep2 Ceiling Data
giardia.methylcell_ceiling_36h_2 <- read_excel("data/36h_BioRep2_2_27_21.xlsx",sheet='mCell_rep2_c')

giardia.methylcell_ceiling_36h_2.df <- data.frame(
  lon = c(giardia.methylcell_ceiling_36h_2$x_coordinate),
  lat = c(giardia.methylcell_ceiling_36h_2$y_coordinate)
)

giardia.methlcell_ceiling_36h_2.points <- giardia.methylcell_ceiling_36h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#36h Giardia methylcell_rep2 floor Data
giardia.methylcell_floor_36h_2 <- read_excel("data/36h_BioRep2_2_27_21.xlsx",sheet='mCell_rep2_f')

giardia.methylcell_floor_36h_2.df <- data.frame(
  lon = c(giardia.methylcell_floor_36h_2$x_coordinate),
  lat = c(giardia.methylcell_floor_36h_2$y_coordinate)
)

giardia.methlcell_floor_36h_2.points <- giardia.methylcell_floor_36h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

########48h data ##########
#48h Giardia methylcell_rep2 Ceiling Data
giardia.methylcell_ceiling_48h_2 <- read_excel("data/48h_BioRep2_2_27_21_7.xlsx",sheet='mCell_rep2_c')

giardia.methylcell_ceiling_48h_2.df <- data.frame(
  lon = c(giardia.methylcell_ceiling_48h_2$x_coordinate),
  lat = c(giardia.methylcell_ceiling_48h_2$y_coordinate)
)

giardia.methlcell_ceiling_48h_2.points <- giardia.methylcell_ceiling_48h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#48h Giardia methylcell_rep2 floor Data
giardia.methylcell_floor_48h_2 <- read_excel("data/48h_BioRep2_2_27_21_7.xlsx",sheet="mCell_rep2_f")

giardia.methylcell_floor_48h_2.df <- data.frame(
  lon = c(giardia.methylcell_floor_48h_2$x_coordinate),
  lat = c(giardia.methylcell_floor_48h_2$y_coordinate)
)

giardia.methlcell_floor_48h_2.points <- giardia.methylcell_floor_48h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

########60h data ##########
#60h Giardia methylcell_rep2 Ceiling Data
giardia.methylcell_ceiling_60h_2 <- read_excel("data/60h_BioRep2_2_27_21.xlsx",sheet='mCell_rep2_c')

giardia.methylcell_ceiling_60h_2.df <- data.frame(
  lon = c(giardia.methylcell_ceiling_60h_2$x_coordinate),
  lat = c(giardia.methylcell_ceiling_60h_2$y_coordinate)
)

giardia.methlcell_ceiling_60h_2.points <- giardia.methylcell_ceiling_60h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#60h Giardia methylcell_rep2 floor Data
giardia.methylcell_floor_60h_2 <- read_excel("data/60h_BioRep2_2_27_21.xlsx",sheet='mCell_rep2_f')

giardia.methylcell_floor_60h_2.df <- data.frame(
  lon = c(giardia.methylcell_floor_60h_2$x_coordinate),
  lat = c(giardia.methylcell_floor_60h_2$y_coordinate)
)

giardia.methlcell_floor_60h_2.points <- giardia.methylcell_floor_60h_2.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)
#####################End of Rep2 Data######################
#Coordinate units
coordinate.units <- c("um", "ums")

#Window
class(polygonarea)
spg <- as(polygonarea, 'Spatial')
#class(as(as(polygonarea, 'Spatial'), 'owin'))
#win <- as(as(polygonarea, 'Spatial'), 'owin')
#win
library(polyCub)
win <- as.owin.SpatialPolygons(spg)
win

######################Construct ppp object########################
##12h##
class(giardia.control_ceiling_12h.points)
class(giardia.control_floor_12h.points)
class(giardia.methlcell_rep1_ceiling_12h.points)
class(giardia.methlcell_rep1_floor_12h.points)

class(giardia.methlcell_ceiling_12h_2.points)
class(giardia.methlcell_floor_12h_2.points)
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
ppp.methlcell_ceiling_12h_2 <- ppp(x = st_coordinates(giardia.methlcell_ceiling_12h_2.points)[,1],
                                   y = st_coordinates(giardia.methlcell_ceiling_12h_2.points)[,2],
                                   window = win)
unitname(ppp.methlcell_ceiling_12h_2) <- coordinate.units


ppp.methlcell_floor_12h_2 <- ppp(x = st_coordinates(giardia.methlcell_floor_12h_2.points)[,1],
                                 y = st_coordinates(giardia.methlcell_floor_12h_2.points)[,2],
                                 window = win)
unitname(ppp.methlcell_floor_12h_2) <- coordinate.units
##24h##
class(giardia.control_ceiling_24h.points)
class(giardia.control_floor_24h.points)
class(giardia.methlcell_rep1_ceiling_24h.points)
class(giardia.methlcell_rep1_floor_24h.points)

class(giardia.methlcell_ceiling_24h_2.points)
class(giardia.methlcell_floor_24h_2.points)

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
ppp.methlcell_ceiling_24h_2 <- ppp(x = st_coordinates(giardia.methlcell_ceiling_24h_2.points)[,1],
                                   y = st_coordinates(giardia.methlcell_ceiling_24h_2.points)[,2],
                                   window = win)
unitname(ppp.methlcell_ceiling_24h_2) <- coordinate.units


ppp.methlcell_floor_24h_2 <- ppp(x = st_coordinates(giardia.methlcell_floor_24h_2.points)[,1],
                                 y = st_coordinates(giardia.methlcell_floor_24h_2.points)[,2],
                                 window = win)
unitname(ppp.methlcell_floor_24h_2) <- coordinate.units
##36h##
class(giardia.control_ceiling_36h.points)
class(giardia.control_floor_36h.points)
class(giardia.methlcell_rep1_ceiling_36h.points)
class(giardia.methlcell_rep1_floor_36h.points)

class(giardia.methlcell_ceiling_36h_2.points)
class(giardia.methlcell_floor_36h_2.points)

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
ppp.methlcell_ceiling_36h_2 <- ppp(x = st_coordinates(giardia.methlcell_ceiling_36h_2.points)[,1],
                                   y = st_coordinates(giardia.methlcell_ceiling_36h_2.points)[,2],
                                   window = win)
unitname(ppp.methlcell_ceiling_36h_2) <- coordinate.units


ppp.methlcell_floor_36h_2 <- ppp(x = st_coordinates(giardia.methlcell_floor_36h_2.points)[,1],
                                 y = st_coordinates(giardia.methlcell_floor_36h_2.points)[,2],
                                 window = win)
unitname(ppp.methlcell_floor_36h_2) <- coordinate.units
##48h##
class(giardia.control_ceiling_48h.points)
class(giardia.control_floor_48h.points)
class(giardia.methlcell_rep1_ceiling_48h.points)
class(giardia.methlcell_rep1_floor_48h.points)

class(giardia.methlcell_ceiling_48h_2.points)
class(giardia.methlcell_floor_48h_2.points)

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
ppp.methlcell_ceiling_48h_2 <- ppp(x = st_coordinates(giardia.methlcell_ceiling_48h_2.points)[,1],
                                   y = st_coordinates(giardia.methlcell_ceiling_48h_2.points)[,2],
                                   window = win)
unitname(ppp.methlcell_ceiling_48h_2) <- coordinate.units


ppp.methlcell_floor_48h_2 <- ppp(x = st_coordinates(giardia.methlcell_floor_48h_2.points)[,1],
                                 y = st_coordinates(giardia.methlcell_floor_48h_2.points)[,2],
                                 window = win)
unitname(ppp.methlcell_floor_48h_2) <- coordinate.units
##60h##
class(giardia.control_ceiling_60h.points)
class(giardia.control_floor_60h.points)
class(giardia.methlcell_rep1_ceiling_60h.points)
class(giardia.methlcell_rep1_floor_60h.points)

class(giardia.methlcell_ceiling_60h_2.points)
class(giardia.methlcell_floor_60h_2.points)

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
ppp.methlcell_ceiling_60h_2 <- ppp(x = st_coordinates(giardia.methlcell_ceiling_60h_2.points)[,1],
                                   y = st_coordinates(giardia.methlcell_ceiling_60h_2.points)[,2],
                                   window = win)
unitname(ppp.methlcell_ceiling_60h_2) <- coordinate.units


ppp.methlcell_floor_60h_2 <- ppp(x = st_coordinates(giardia.methlcell_floor_60h_2.points)[,1],
                                 y = st_coordinates(giardia.methlcell_floor_60h_2.points)[,2],
                                 window = win)
unitname(ppp.methlcell_floor_60h_2) <- coordinate.units
########################End construct ppp object######################
############################Group Plots###############################
pdf(file = "/Users/apple/Documents/R workshop 2017/project x/analysis/output/BioRep2_2_27_21plots_points.pdf", 
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
dev.off()

#########make quadrant counts plots for 60h points##############################
qc.conrol_ceiling_60h <- quadratcount(ppp.conrol_ceiling_60h, nx=5, ny=3)
plot(ppp.conrol_ceiling_60h, pch=3, cex=0.6)
plot(qc.conrol_ceiling_60h, add=T, textargs=list(col="red"))

qc.conrol_floor_60h <- quadratcount(ppp.conrol_floor_60h, nx=5, ny=3)
plot(ppp.conrol_floor_60h, pch=3, cex=0.6)
plot(qc.conrol_floor_60h, add=T, textargs=list(col="red"))

qc.methlcell_rep1_ceiling_60h <- quadratcount(ppp.methlcell_rep1_ceiling_60h, nx=5, ny=3)
plot(ppp.methlcell_rep1_ceiling_60h, pch=3, cex=0.6)
plot(qc.methlcell_rep1_ceiling_60h, add=T, textargs=list(col="red"))

qc.methlcell_rep1_floor_60h <- quadratcount(ppp.methlcell_rep1_floor_60h, nx=5, ny=3)
plot(ppp.methlcell_rep1_floor_60h, pch=3, cex=0.6)
plot(qc.methlcell_rep1_floor_60h, add=T, textargs=list(col="red"))

#make quadrant Chi-squared tests:
#(goodness-of-fit test statistic: χ2=∑(observed−expected)^2/expected)
quadrat.test(qc.conrol_ceiling_60h)
quadrat.test(qc.conrol_floor_60h)
quadrat.test(qc.methlcell_rep1_ceiling_60h)
quadrat.test(qc.methlcell_rep1_floor_60h)
#########make quadrant counts plots for 48h points#############################
qc.conrol_ceiling_48h <- quadratcount(ppp.conrol_ceiling_48h, nx=4, ny=2)
plot(ppp.conrol_ceiling_48h, pch=3, cex=0.6)
plot(qc.conrol_ceiling_48h, add=T, textargs=list(col="red"))

qc.conrol_floor_48h <- quadratcount(ppp.conrol_floor_48h, nx=5, ny=3)
plot(ppp.conrol_floor_48h, pch=3, cex=0.6)
plot(qc.conrol_floor_48h, add=T, textargs=list(col="red"))

qc.methlcell_rep1_ceiling_48h <- quadratcount(ppp.methlcell_rep1_ceiling_48h, nx=5, ny=3)
plot(ppp.methlcell_rep1_ceiling_48h, pch=3, cex=0.6)
plot(qc.methlcell_rep1_ceiling_48h, add=T, textargs=list(col="red"))

qc.methlcell_rep1_floor_48h <- quadratcount(ppp.methlcell_rep1_floor_48h, nx=5, ny=3)
plot(ppp.methlcell_rep1_floor_48h, pch=3, cex=0.6)
plot(qc.methlcell_rep1_floor_48h, add=T, textargs=list(col="red"))

#make quadrant Chi-squared tests:
#(goodness-of-fit test statistic: χ2=∑(observed−expected)^2/expected)
quadrat.test(qc.conrol_ceiling_48h)
quadrat.test(qc.conrol_floor_48h)
quadrat.test(qc.methlcell_rep1_ceiling_48h)
quadrat.test(qc.methlcell_rep1_floor_48h)

#plot kernel density plot for control ceiling & floor vs. methlcell ceiling & floor:
par(mfrow=c(2,2), mar=c(0,0,1,2))
sigma <- c(300)
data <- list(ppp.conrol_ceiling_48h, ppp.conrol_floor_48h, ppp.methlcell_rep1_ceiling_48h, ppp.methlcell_rep1_floor_48h,
             ppp.conrol_ceiling_60h, ppp.conrol_floor_60h, ppp.methlcell_rep1_ceiling_60h, ppp.methlcell_rep1_floor_60h)
main <- c('control_ceiling_48h', 'control_floor_48h', 'methylcellulose_ceiling_48h', 'methylcellulose_floor_48h'
          ,'control_ceiling_60h', 'control_floor_60h', 'methylcellulose_ceiling_60h', 'methylcellulose_floor_60h')
for (i in 1:8){
  for (j in 1:1) {
    ds <- density.ppp(data[[i]], sigma=sigma[j])
    plot(ds, 
         main = paste0(main[i],', sigma:', sigma[j]))
    plot(data[[i]], add=T, cex=0.1, regular=F)}}

#Or plot one sigma of choice #for instance "sigma <- 500"
par(mfrow=c(2,2), mar=c(0,0,1,2))
sigma <- c(300)
data <- list(ppp.conrol_ceiling, ppp.conrol_floor, ppp.methlcell_rep1_ceiling, ppp.methlcell_rep1_floor)
main <- c('control_ceiling', 'control_floor', 'methylcellulose_rep1_ceiling', 'methylcellulose_rep1_floor')
for (i in 1:4){
  for (j in 1:1) {
    ds <- density.ppp(data[[i]], sigma=sigma[j])
    plot(ds, 
         main = paste0(main[i],', sigma:', sigma[j]))
    plot(data[[i]], add=T, cex=0.1, regular=F)}}
############################Group Plots###############################
pdf(file = "/Users/apple/Documents/R workshop 2017/project x/analysis/output/BioRep2_2_27_21plots_points&heatmaps&pp7.pdf", 
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
    
    par(mfrow=c(4,5), mar=c(1, 1, 1, 1))
    sigma <- c(300)
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
                 ppp.methlcell_ceiling_12h_2,
                 ppp.methlcell_ceiling_24h_2,
                 ppp.methlcell_ceiling_36h_2,
                 ppp.methlcell_ceiling_48h_2,
                 ppp.methlcell_ceiling_60h_2,
                 ppp.methlcell_floor_12h_2,
                 ppp.methlcell_floor_24h_2,
                 ppp.methlcell_floor_36h_2,
                 ppp.methlcell_floor_48h_2,
                 ppp.methlcell_floor_60h_2)
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
              'methylcellulose_ceiling_12h_2',
              'methylcellulose_ceiling_24h_2',
              'methylcellulose_ceiling_36h_2',
              'methylcellulose_ceiling_48h_2',
              'methylcellulose_ceiling_60h_2',
              'methylcellulose_floor_12h_2',
              'methylcellulose_floor_24h_2',
              'methylcellulose_floor_36h_2',
              'methylcellulose_floor_48h_2',
              'methylcellulose_floor_60h_2')
    for (i in 1:30){
      for (j in 1:1){
        ds <- density.ppp(data[[i]], sigma=sigma[j])
        plot(ds, 
             main = paste0(main[i],', sigma:', sigma[j]))
        plot(data[[i]], add=T, cex=0.1, regular=F)}}
    
    par(mfrow=c(1,2), mar=c(1,1,1,1))
    plot(allstats(ppp.conrol_ceiling_60h), main='giardia control ceiling60h')
    plot(allstats(ppp.conrol_floor_60h), main='giardia control floor60h')
    plot(allstats(ppp.methlcell_rep1_ceiling_60h), main='giardia methlcell ceiling60h')
    plot(allstats(ppp.methlcell_rep1_floor_60h), main='giardia methlcell floor60h')
    plot(allstats(ppp.conrol_ceiling_48h), main='giardia control ceiling48hh')
    plot(allstats(ppp.conrol_floor_48h), main='giardia control floor48h')
    plot(allstats(ppp.methlcell_rep1_ceiling_48h), main='giardia methlcell ceiling48h')
    plot(allstats(ppp.methlcell_rep1_floor_48h), main='giardia methlcell floor48h')
    
    plot(allstats(ppp.methlcell_ceiling_48h_2), main='giardia methlcell ceiling48h_2')
    plot(allstats(ppp.methlcell_floor_48h_2), main='giardia methlcell floor48h_2')
    plot(allstats(ppp.methlcell_ceiling_60h_2), main='giardia methlcell ceiling60h_2')
    plot(allstats(ppp.methlcell_floor_60h_2), main='giardia methlcell floor60h_2')
    dev.off()
          
          
#Point Pattern Statistic functions. #Compare with A random point pattern
###########Create Random Point Data
#xmin <- as.vector(st_bbox(polygonarea)[1])
#ymin <- as.vector(st_bbox(polygonarea)[2])
#xmax <- as.vector(st_bbox(polygonarea)[3])
#ymax <- as.vector(st_bbox(polygonarea)[4])

#set.seed(1111)
#x.random <- runif(n = nrow(giardia.control_floor.points)*0.4,
                  #min = xmin,
                  #max = xmax)
#y.random <- runif(n = nrow(giardia.control_floor.points)*0.4,
                  #min = ymin,
                  #max = ymax)
#giardia.random <- data.frame('x'= x.random, 'y'= y.random)
###########optional plot:
##plot(x=giardia.random$x,
     ##y=giardia.random$y,
     ##main="Random Points",
     ##xlab="x", ylab="y", cex=.5,
     ##asp=T)
##plot(polygonarea, add=T, border='blue', col=NA)
############Construct ppp object for random points
#class(giardia.random)
#ppp.random <- ppp(x = giardia.random$x,
                  #y = giardia.random$y,
                  #window = win)
#unitname(ppp.random) <- coordinate.units
#plot(ppp.random)
##############Interactions in Point Pattern Analysis
#library(rasterVis)

#The empty space function F
#G function: Nearest neighbor distances
#Pairwise distances - The K function
#L function: transforms the Poisson K functon to the straight line Lpois(r)=r
# The pair correlation function: g(r)=K'(r)/2pi()r - probability of observing a pair points seperated by r, divided by a Poisson probability.
#J function: combination of F and G. 
#######plot(allstats(ppp.random), main='artificial random')
plot(allstats(ppp.conrol_ceiling_60h), main='giardia control ceiling')
plot(allstats(ppp.conrol_floor_60h), main='giardia control floor')
plot(allstats(ppp.methlcell_rep1_ceiling_60h), main='giardia methlcell ceiling')
plot(allstats(ppp.methlcell_rep1_floor_60h), main='giardia methlcell floor')

plot(allstats(ppp.conrol_ceiling_48h), main='giardia control ceiling')
plot(allstats(ppp.conrol_floor_48h), main='giardia control floor')
plot(allstats(ppp.methlcell_rep1_ceiling_48h), main='giardia methlcell ceiling')
plot(allstats(ppp.methlcell_rep1_floor_48h), main='giardia methlcell floor')

#Group Plots
pdf(file = "/Users/apple/Documents/R workshop 2017/project x/analysis/output/24h_BioRep1_1_25_21plots.pdf", 
    height = 8.5, width = 11)
  par(mfrow=c(4,2), mar=c(2, 2, 2, 2))
  plot(ppp.conrol_ceiling)
  plot(ppp.conrol_floor)
  plot(ppp.methlcell_rep1_ceiling)
  plot(ppp.methlcell_rep1_floor)
  plot(ppp.conrol_ceiling, pch=3, cex=0.6)
  plot(qc.conrol_ceiling, add=T, textargs=list(col="red"))
  plot(ppp.conrol_floor, pch=3, cex=0.6)
  plot(qc.conrol_floor, add=T, textargs=list(col="red"))
  plot(ppp.methlcell_rep1_ceiling, pch=3, cex=0.6)
  plot(qc.methlcell_rep1_ceiling, add=T, textargs=list(col="red"))
  plot(ppp.methlcell_rep1_floor, pch=3, cex=0.6)
  plot(qc.methlcell_rep1_floor, add=T, textargs=list(col="red"))
  sigma <- c(300)
  data <- list(ppp.conrol_ceiling, ppp.conrol_floor, ppp.methlcell_rep1_ceiling, ppp.methlcell_rep1_floor)
  main <- c('control_ceiling', 'control_floor', 'methylcellulose_rep1_ceiling', 'methylcellulose_rep1_floor')
  for (i in 1:4){
    for (j in 1:1) {
      ds <- density.ppp(data[[i]], sigma=sigma[j])
      plot(ds, 
           main = paste0(main[i],', sigma:', sigma[j]))
      plot(data[[i]], add=T, cex=0.1, regular=F)}}
dev.off()


      
#(goodness-of-fit test statistic: χ2=∑(observed−expected)^2/expected)
qcresults <- (quadrat.test(qc.conrol_ceiling))
print((qcresults))
print(quadrat.test(qc.conrol_ceiling))

