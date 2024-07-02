# R script for UDel R workshop, 16\&17 July copy and learning
#S.Li
#setwd("~/Documents/R workshop 2017/Script_10_27_21")
#Read Excel
library(readxl)
library(tidyverse)
library(sf)
#Create the Polygon Window
giardia.polygon <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/12h_BioRep1_1_25_21.xlsx",sheet=7)
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

#Giardia Control Ceiling Data
giardia.control_ceiling <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/12h_BioRep1_1_25_21.xlsx",sheet=1)%>% 
  mutate(x_microns = x_coordinate,
         y_microns = y_coordinate) #data is already in microns.
giardia.control_ceiling.df <- data.frame(
  lon = c(giardia.control_ceiling$x_microns),
  lat = c(giardia.control_ceiling$y_microns)
)
giardia.control_ceiling.points <- giardia.control_ceiling.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#Giardia Control floor Data
giardia.control_floor <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/12h_BioRep1_1_25_21.xlsx",sheet=2)
  
giardia.control_floor.df <- data.frame(
  lon = c(giardia.control_floor$x_coordinate),
  lat = c(giardia.control_floor$y_coordinate)
)
giardia.control_floor.points <- giardia.control_floor.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#Giardia methylcell_rep1 Ceiling Data
giardia.methylcell_rep1_ceiling <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/12h_BioRep1_1_25_21.xlsx",sheet=3)

giardia.methylcell_rep1_ceiling.df <- data.frame(
  lon = c(giardia.methylcell_rep1_ceiling$x_coordinate),
  lat = c(giardia.methylcell_rep1_ceiling$y_coordinate)
)

giardia.methlcell_rep1_ceiling.points <- giardia.methylcell_rep1_ceiling.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#Giardia methylcell_rep1 floor Data
giardia.methylcell_rep1_floor <- read_excel("/Users/apple/Documents/R workshop 2017/project x/analysis/data/12h_BioRep1_1_25_21.xlsx",sheet=4)

giardia.methylcell_rep1_floor.df <- data.frame(
  lon = c(giardia.methylcell_rep1_floor$x_coordinate),
  lat = c(giardia.methylcell_rep1_floor$y_coordinate)
)

giardia.methlcell_rep1_floor.points <- giardia.methylcell_rep1_floor.df %>%
  st_as_sf(coords = c("lon","lat"), crs = 4326)

#Creating spatstat objects
library(spatstat)
library(maptools)

#Coordinate units
coordinate.units <- c("um", "ums")

#Window
class(polygonarea)
class(as(polygonarea, 'Spatial'))
spg <- as(polygonarea, 'Spatial')
class(spg)
#class(as(as(polygonarea, 'Spatial'), 'owin'))
#win <- as(as(polygonarea, 'Spatial'), 'owin')
#win 
install.packages("polyCub")
library(polyCub)
win <- as.owin.SpatialPolygons(spg)
win
# #Construct ppp object
class(giardia.control_ceiling.points)
class(giardia.control_floor.points)
class(giardia.methlcell_rep1_ceiling.points)
class(giardia.methlcell_rep1_floor.points)

ppp.conrol_ceiling <- ppp(x = st_coordinates(giardia.control_ceiling.points)[,1],
                  y = st_coordinates(giardia.control_ceiling.points)[,2],
                  window = win)
unitname(ppp.conrol_ceiling) <- coordinate.units
plot(ppp.conrol_ceiling)

ppp.conrol_floor <- ppp(x = st_coordinates(giardia.control_floor.points)[,1],
                          y = st_coordinates(giardia.control_floor.points)[,2],
                          window = win)
unitname(ppp.conrol_floor) <- coordinate.units
plot(ppp.conrol_floor)

ppp.methlcell_rep1_ceiling <- ppp(x = st_coordinates(giardia.methlcell_rep1_ceiling.points)[,1],
                     y = st_coordinates(giardia.methlcell_rep1_ceiling.points)[,2],
                     window = win)
unitname(ppp.methlcell_rep1_ceiling) <- coordinate.units
plot(ppp.methlcell_rep1_ceiling)

ppp.methlcell_rep1_floor <- ppp(x = st_coordinates(giardia.methlcell_rep1_floor.points)[,1],
                                  y = st_coordinates(giardia.methlcell_rep1_floor.points)[,2],
                                  window = win)
unitname(ppp.methlcell_rep1_floor) <- coordinate.units
plot(ppp.methlcell_rep1_floor)

#make quadrant counts plots
qc.conrol_ceiling <- quadratcount(ppp.conrol_ceiling, nx=5, ny=3)
plot(ppp.conrol_ceiling, pch=3, cex=0.6)
plot(qc.conrol_ceiling, add=T, textargs=list(col="red"))

qc.conrol_floor <- quadratcount(ppp.conrol_floor, nx=5, ny=3)
plot(ppp.conrol_floor, pch=3, cex=0.6)
plot(qc.conrol_floor, add=T, textargs=list(col="red"))

qc.methlcell_rep1_ceiling <- quadratcount(ppp.methlcell_rep1_ceiling, nx=5, ny=3)
plot(ppp.methlcell_rep1_ceiling, pch=3, cex=0.6)
plot(qc.methlcell_rep1_ceiling, add=T, textargs=list(col="red"))

qc.methlcell_rep1_floor <- quadratcount(ppp.methlcell_rep1_floor, nx=5, ny=3)
plot(ppp.methlcell_rep1_floor, pch=3, cex=0.6)
plot(qc.methlcell_rep1_floor, add=T, textargs=list(col="red"))

#make quadrant Chi-squared tests:
#(goodness-of-fit test statistic: χ2=∑(observed−expected)^2/expected)
quadrat.test(qc.conrol_ceiling)
quadrat.test(qc.conrol_floor)
quadrat.test(qc.methlcell_rep1_ceiling)
quadrat.test(qc.methlcell_rep1_floor)

#plot kernel density plot for conrol ceiling & floor vs. methlcell ceiling & floor:
par(mfrow=c(4,2), mar=c(0,0,1,2))
sigma <- c(350, 500)
data <- list(ppp.conrol_ceiling, ppp.conrol_floor, ppp.methlcell_rep1_ceiling, ppp.methlcell_rep1_floor)
main <- c('control_ceiling', 'control_floor', 'methylcellulose_rep1_ceiling', 'methylcellulose_rep1_floor')
for (i in 1:4){
  for (j in 1:2) {
    ds <- density.ppp(data[[i]], sigma=sigma[j])
    plot(ds, 
         main = paste0(main[i],', sigma:', sigma[j]))
    plot(data[[i]], add=T, cex=0.1, regular=F)}}

#Or plot one sigma of choice #for instance "sigma <- 500"
par(mfrow=c(2,2), mar=c(0,0,1,2))
sigma <- c(500)
data <- list(ppp.conrol_ceiling, ppp.conrol_floor, ppp.methlcell_rep1_ceiling, ppp.methlcell_rep1_floor)
main <- c('control_ceiling', 'control_floor', 'methylcellulose_rep1_ceiling', 'methylcellulose_rep1_floor')
for (i in 1:4){
  for (j in 1:1) {
    ds <- density.ppp(data[[i]], sigma=sigma[j])
    plot(ds, 
         main = paste0(main[i],', sigma:', sigma[j]))
    plot(data[[i]], add=T, cex=0.1, regular=F)}}

#Point Pattern Statistic functions. #Compare with A random point pattern
#Create Random Point Data
xmin <- as.vector(st_bbox(polygonarea)[1])
ymin <- as.vector(st_bbox(polygonarea)[2])
xmax <- as.vector(st_bbox(polygonarea)[3])
ymax <- as.vector(st_bbox(polygonarea)[4])

set.seed(1111)
x.random <- runif(n = nrow(giardia.control_floor.points)*0.4,
                  min = xmin,
                  max = xmax)
y.random <- runif(n = nrow(giardia.control_floor.points)*0.4,
                  min = ymin,
                  max = ymax)
giardia.random <- data.frame('x'= x.random, 'y'= y.random)
#optional plot:
##plot(x=giardia.random$x,
     ##y=giardia.random$y,
     ##main="Random Points",
     ##xlab="x", ylab="y", cex=.5,
     ##asp=T)
##plot(polygonarea, add=T, border='blue', col=NA)
#Construct ppp object for ramdom points
class(giardia.random)
ppp.random <- ppp(x = giardia.random$x,
                  y = giardia.random$y,
                  window = win)
unitname(ppp.random) <- coordinate.units
plot(ppp.random)
#Interactions in Point Pattern Analysis
library(rasterVis)

#The empty space function F
#G function: Nearest neighbor distances
#Pairwise distances - The K function
#L function: transforms the Poisson K functon to the straight line Lpois(r)=r
# The pair correlation function: g(r)=K'(r)/2pi()r - probability of observing a pair points seperated by r, divided by a Poisson probability.
#J function: combination of F and G. 
plot(allstats(ppp.random), main='artificial random')
plot(allstats(ppp.conrol_ceiling), main='giardia control ceiling')
plot(allstats(ppp.conrol_floor), main='giardia control floor')
plot(allstats(ppp.methlcell_rep1_ceiling), main='giardia methlcell ceiling')
plot(allstats(ppp.methlcell_rep1_floor), main='giardia methlcell floor')

#Group Plots
pdf(file = "/Users/apple/Documents/R workshop 2017/project x/analysis/output/12h_BioRep1_1_25_21plots.pdf", 
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
  sigma <- c(500)
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

####Grouped Plots#####
############################Group Plots###############################
pdf(file = "/Users/apple/Documents/R workshop 2017/project x/analysis/output/BioRep2_2_27_21plots_points&heatmaps.pdf", 
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
             ppp.methlcell_rep1_floor_60h)
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
          'methylcellulose_floor_60h')
for (i in 1:20){
  for (j in 1:1) {
    ds <- density.ppp(data[[i]], sigma=sigma[j])
    plot(ds, 
         main = paste0(main[i],', sigma:', sigma[j]))
    plot(data[[i]], add=T, cex=0.1, regular=F)}}
dev.off()

