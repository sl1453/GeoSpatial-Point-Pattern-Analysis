# R script for UDel R workshop, 16\&17 July copy and learning
#S.Li
#setwd("~/Documents/R workshop 2017/Script_10_27_21")
#Read Excel
library(readxl)
library(tidyverse)
library(sf)
#Create the Polygon Window
giardia.polygon <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/sample_point_pattern.xlsx",sheet=3)
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

#Giardia Control Data
giardia.control <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/sample_point_pattern.xlsx",sheet=1)%>% 
  mutate(x_microns = x_coordinate*(5062.3/8355),
         y_microns = y_coordinate*(1966.75/3246))
giardia.control.df <- data.frame(
  lon = c(giardia.control$x_microns),
  lat = c(giardia.control$y_microns)
)
giardia.control.points <- giardia.control.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#Giardia methylcell Data
giardia.methylcell <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/sample_point_pattern.xlsx",sheet=2)%>%
  mutate(x_microns = x_coordinate*(5062.3/8355),
         y_microns = y_coordinate*(1966.75/3246))
giardia.methylcell.df <- data.frame(
  lon = c(giardia.methylcell$x_microns),
  lat = c(giardia.methylcell$y_microns)
)

giardia.methlcell.points <- giardia.methylcell.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#Creating spatstat objects
library(spatstat)
library(maptools)

#Coordinate units
coordinate.units <- c("um", "ums")

#Window
class(polygonarea)
class(as(polygonarea, 'Spatial'))
class(as(as(polygonarea, 'Spatial'), 'owin'))
win <- as(as(polygonarea, 'Spatial'), 'owin')
win

# #Construct ppp object
class(giardia.control.points)
class(giardia.methlcell.points)

ppp.conrol <- ppp(x = st_coordinates(giardia.control.points)[,1],
                  y = st_coordinates(giardia.control.points)[,2],
                  window = win)
unitname(ppp.conrol) <- coordinate.units
plot(ppp.conrol)
ppp.methlcell <- ppp(x = st_coordinates(giardia.methlcell.points)[,1],
                     y = st_coordinates(giardia.methlcell.points)[,2],
                     window = win)
unitname(ppp.conrol) <- coordinate.units
plot(ppp.methlcell)

#make quadrant counts plots
qc.conrol <- quadratcount(ppp.conrol, nx=5, ny=3)
plot(ppp.conrol, pch=3, cex=0.6)
plot(qc.conrol, add=T, textargs=list(col="red"))

qc.methlcell <- quadratcount(ppp.methlcell, nx=5, ny=3)
plot(ppp.methlcell, pch=3, cex=0.6)
plot(qc.methlcell, add=T, textargs=list(col="red"))

#make quadrant Chi-squared tests:
#(goodness-of-fit test statistic: χ2=∑(observed−expected)^2/expected)
quadrat.test(qc.conrol)
quadrat.test(qc.methlcell)

#plot kernel density plot:
sigma <- c(100, 200, 300)
for (j in 1:3) {
  ds <- density.ppp(ppp.methlcell, sigma=sigma[j])
  plot(ds, 
       main = paste0('methlcell',',sigma:', sigma[j]))
  plot(ppp.methlcell, add=T, cex=0.4, regular=F)}

#plot kernel density plot for conrol vs. methlcell:
par(mfrow=c(2,2), mar=c(0,0,1,2))
sigma <- c(350, 500)
data <- list(ppp.conrol, ppp.methlcell)
main <- c('control','methylcellulose')
for (i in 1:2){
  for (j in 1:2) {
  ds <- density.ppp(data[[i]], sigma=sigma[j])
  plot(ds, 
       main = paste0(main[i],', sigma:', sigma[j]))
  plot(data[[i]], add=T, cex=0.1, regular=F)}}



