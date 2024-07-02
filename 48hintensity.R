# R script for UDel R workshop, 6\&7 July
#S.Li
#setwd("~/Documents/R workshop 2017/Scripts")
#library(help="datasets")
#c(help)
#?factor()
# a <- c("female", "male", "female", "male")
# a
#[1] "female" "male"   "female" "male"  
# class(a)
#[1] "character"
# mode(a)
#[1] "character"
# a <- factor(a)
# a
#[1] female male   female male  
#Levels: female male
# class(a)
#[1] "factor"
#> mode(a)
#[1] "numeric"
#> ?sample()
#> h <- sample(c(1:10),10, replace = FALSE, prob = NULL)
#> h
#[1]  1  6  7  9 10  2  4  3  5  8
#> h <- sample(c(1:10),10, replace = FALSE, prob = 1)
#h <- sample(c("short",'medium','tall'),10, replace = TRUE, prob = NULL)
#> h
#[1] "medium" "medium" "tall"   "short"  "medium" "medium" "short"  "short"  "medium"
#[10] "tall"  
#> fh <- factor(h)
#> fh
#[1] medium medium tall   short  medium medium short  short  medium tall  
#Levels: medium short tall
#> levels(fh)
#[1] "medium" "short"  "tall"  
#> hf <- factor(h,levels=c("short","medium","tall")
#               > m <- matrix(1:15, nrow=5,byrow=TRUE)
#               > m
#               [,1] [,2] [,3]
#               [1,]    1    2    3
#               [2,]    4    5    6
#               [3,]    7    8    9
#               [4,]   10   11   12
#               [5,]   13   14   15
#               > c(m)
#               [1]  1  4  7 10 13  2  5  8 11 14  3  6  9 12 15
#               > c(m,byrow=TRUE)
#               
#               1     4     7    10    13     2     5     8   be 11    14     3     6     9    12    15 
#               byrow 
#               1 
#               > c(m,byrow=FALSE)
#               
#               1     4     7    10    13     2     5     8    11    14     3     6     9    12    15 
#               byrow 
#               0 
#berlin.locations <- 
#  berlin.features[berlin.features$fclass=='nightclub' |
#                    berlin.features$fclass=='bar',
#                  c('fclass', 'name')]
#Read Excel
library(readxl)
library(tidyverse)
library(sf)
#Creating spatstat objects
library(spatstat)
library(maptools)
setwd("~/Documents/R workshop 2017/project pattern/analysis")
#Create the Polygon Window
giardia.polygon <- read_excel("data 7/48h_BioRep1_1_25_21.xlsx",sheet=7)
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
 
 #Giardia Control Data rep 1
 giardia.control_ceiling_1 <- read_excel("data 7/48h_BioRep1_1_25_21.xlsx",sheet=1) 
 
 giardia.control_ceiling_1.df <- data.frame(
   lon = c(giardia.control_ceiling_1$x_coordinate),
   lat = c(giardia.control_ceiling_1$y_coordinate)
 )
 giardia.control_ceiling_1.points <- giardia.control_ceiling_1.df %>%
   st_as_sf(coords = c("lon","lat"), crs = 4326)
 
 giardia.control_floor_1 <- read_excel("data 7/48h_BioRep1_1_25_21.xlsx",sheet=2) 
 
 giardia.control_floor_1.df <- data.frame(
   lon = c(giardia.control_floor_1$x_coordinate),
   lat = c(giardia.control_floor_1$y_coordinate)
 )
 giardia.control_floor_1.points <- giardia.control_floor_1.df %>%
   st_as_sf(coords = c("lon","lat"), crs = 4326)

#Giardia methylcell Data rep 1
 giardia.methylcell_ceiling_1 <- read_excel("data 7/48h_BioRep1_1_25_21.xlsx",sheet=3) 
 
 giardia.methylcell_ceiling_1.df <- data.frame(
   lon = c(giardia.methylcell_ceiling_1$x_coordinate),
   lat = c(giardia.methylcell_ceiling_1$y_coordinate)
 )
 giardia.methylcell_ceiling_1.points <- giardia.methylcell_ceiling_1.df %>%
   st_as_sf(coords = c("lon","lat"), crs = 4326)
 
 giardia.methylcell_floor_1 <- read_excel("data 7/48h_BioRep1_1_25_21.xlsx",sheet=4) 
 
 giardia.methylcell_floor_1.df <- data.frame(
   lon = c(giardia.methylcell_floor_1$x_coordinate),
   lat = c(giardia.methylcell_floor_1$y_coordinate)
 )
 giardia.control_methylcell_1.points <- giardia.methylcell_floor_1.df %>%
   st_as_sf(coords = c("lon","lat"), crs = 4326)
 
 
 
 #Giardia Control Data rep 2
 giardia.polygon2 <- read_excel("data 7/48h_BioRep2_2_27_21_7.xlsx",sheet=7)
 #already in microns
 giardia.polygon.df2 <- data.frame(
   lon = c(giardia.polygon2$x_coordinate),
   lat = c(giardia.polygon2$y_coordinate))
 
 polygonarea2 <- giardia.polygon.df2 %>%
   st_as_sf(coords = c("lon","lat"), crs = 4326) %>%
   summarise(geometry = st_combine(geometry)) %>%
   st_cast("POLYGON")
 polygonarea2
 plot(polygonarea2)
 
 giardia.control_ceiling_2 <- read_excel("data 7/48h_BioRep2_2_27_21_7.xlsx",sheet=1) 
 
 giardia.control_ceiling_2.df <- data.frame(
   lon = c(giardia.control_ceiling_2$x_coordinate),
   lat = c(giardia.control_ceiling_2$y_coordinate)
 )
 giardia.control_ceiling_2.points <- giardia.control_ceiling_2.df %>%
   st_as_sf(coords = c("lon","lat"), crs = 4326)
 
 giardia.control_floor_2 <- read_excel("data 7/48h_BioRep2_2_27_21_7.xlsx",sheet=2,
                                       range = cell_cols('A:C')) 
 
 giardia.control_floor_2.df <- data.frame(
   lon = c(giardia.control_floor_2$x_coordinate),
   lat = c(giardia.control_floor_2$y_coordinate)
 )
 giardia.control_floor_2.points <- giardia.control_floor_2.df %>%
   st_as_sf(coords = c("lon","lat"), crs = 4326)
 
 #Giardia methylcell Data rep 2
 giardia.methylcell_ceiling_2 <- read_excel("data 7/48h_BioRep2_2_27_21_7.xlsx",sheet=3) 
 
 giardia.methylcell_ceiling_2.df <- data.frame(
   lon = c(giardia.methylcell_ceiling_2$x_coordinate),
   lat = c(giardia.methylcell_ceiling_2$y_coordinate)
 )
 giardia.methylcell_ceiling_2.points <- giardia.methylcell_ceiling_2.df %>%
   st_as_sf(coords = c("lon","lat"), crs = 4326)
 
 giardia.methylcell_floor_2 <- read_excel("data 7/48h_BioRep2_2_27_21_7.xlsx",sheet=4) 
 
 giardia.methylcell_floor_2.df <- data.frame(
   lon = c(giardia.methylcell_floor_2$x_coordinate),
   lat = c(giardia.methylcell_floor_2$y_coordinate)
 )
 giardia.control_methylcell_2.points <- giardia.methylcell_floor_2.df %>%
   st_as_sf(coords = c("lon","lat"), crs = 4326)
 
 
 #Giardia Control Data rep 3
 giardia.polygon3 <- read_excel("data 7/48h_BioRep3_4_6_21.xlsx",sheet=7)
 #already in microns
 giardia.polygon.df3 <- data.frame(
   lon = c(giardia.polygon3$x_coordinate),
   lat = c(giardia.polygon3$y_coordinate))
 
 polygonarea3 <- giardia.polygon.df3 %>%
   st_as_sf(coords = c("lon","lat"), crs = 4326) %>%
   summarise(geometry = st_combine(geometry)) %>%
   st_cast("POLYGON")
 polygonarea3
 plot(polygonarea3)
 
 giardia.control_ceiling_3 <- read_excel("data 7/48h_BioRep3_4_6_21.xlsx",sheet=1) 
 
 giardia.control_ceiling_3.df <- data.frame(
   lon = c(giardia.control_ceiling_3$x_coordinate),
   lat = c(giardia.control_ceiling_3$y_coordinate)
 )
 giardia.control_ceiling_3.points <- giardia.control_ceiling_3.df %>%
   st_as_sf(coords = c("lon","lat"), crs = 4326)
 
 giardia.control_floor_3 <- read_excel("data 7/48h_BioRep3_4_6_21.xlsx",sheet=2,
                                       range = cell_cols('A:C')) 
 
 giardia.control_floor_3.df <- data.frame(
   lon = c(giardia.control_floor_3$x_coordinate),
   lat = c(giardia.control_floor_3$y_coordinate)
 )
 giardia.control_floor_3.points <- giardia.control_floor_3.df %>%
   st_as_sf(coords = c("lon","lat"), crs = 4326)
 
 #Giardia methylcell Data rep 3
 giardia.methylcell_ceiling_3 <- read_excel("data 7/48h_BioRep3_4_6_21.xlsx",sheet=3) 
 
 giardia.methylcell_ceiling_3.df <- data.frame(
   lon = c(giardia.methylcell_ceiling_3$x_coordinate),
   lat = c(giardia.methylcell_ceiling_3$y_coordinate)
 )
 giardia.methylcell_ceiling_3.points <- giardia.methylcell_ceiling_3.df %>%
   st_as_sf(coords = c("lon","lat"), crs = 4326)
 
 giardia.methylcell_floor_3 <- read_excel("data 7/48h_BioRep3_4_6_21.xlsx",sheet=4) 
 
 giardia.methylcell_floor_3.df <- data.frame(
   lon = c(giardia.methylcell_floor_3$x_coordinate),
   lat = c(giardia.methylcell_floor_3$y_coordinate)
 )
 giardia.control_methylcell_3.points <- giardia.methylcell_floor_3.df %>%
   st_as_sf(coords = c("lon","lat"), crs = 4326)

#Random points 
#Random points rep1 
 xmin <- as.vector(st_bbox(polygonarea)[1])
 ymin <- as.vector(st_bbox(polygonarea)[2])
 xmax <- as.vector(st_bbox(polygonarea)[3])
 ymax <- as.vector(st_bbox(polygonarea)[4])

 set.seed(1111)
 x.random <- runif(n = nrow(giardia.methylcell_ceiling_1.points)*1,
                   min = xmin,
                   max = xmax)
 y.random <- runif(n = nrow(giardia.methylcell_ceiling_1.points)*1,
                   min = ymin,
                   max = ymax)
 giardia.random_mc1 <- data.frame('x'= x.random, 'y'= y.random)
 plot(x=giardia.random1$x,
      y=giardia.random1$y,
      main="Random Points rep1",
      xlab="x", ylab="y", cex=0.2,
      asp=T)
 plot(polygonarea, add=T, border="grey",col=NA)
 #control c1
 x.random <- runif(n = nrow(giardia.control_ceiling_1.points)*1,
                   min = xmin,
                   max = xmax)
 y.random <- runif(n = nrow(giardia.control_ceiling_1.points)*1,
                   min = ymin,
                   max = ymax)
 giardia.random_cc1 <- data.frame('x'= x.random, 'y'= y.random)
 #control f1
 x.random <- runif(n = nrow(giardia.control_floor_1.points)*1,
                   min = xmin,
                   max = xmax)
 y.random <- runif(n = nrow(giardia.control_floor_1.points)*1,
                   min = ymin,
                   max = ymax)
 giardia.random_cf1 <- data.frame('x'= x.random, 'y'= y.random)
 #methylcell f1
 x.random <- runif(n = nrow(giardia.control_methylcell_1.points)*1,
                   min = xmin,
                   max = xmax)
 y.random <- runif(n = nrow(giardia.control_methylcell_1.points)*1,
                   min = ymin,
                   max = ymax)
 giardia.random_mf1 <- data.frame('x'= x.random, 'y'= y.random)
 #rep2 
 xmin <- as.vector(st_bbox(polygonarea2)[1])
 ymin <- as.vector(st_bbox(polygonarea2)[2])
 xmax <- as.vector(st_bbox(polygonarea2)[3])
 ymax <- as.vector(st_bbox(polygonarea2)[4])
 
 set.seed(1111)
 x.random <- runif(n = nrow(giardia.methylcell_ceiling_2.points)*1,
                   min = xmin,
                   max = xmax)
 y.random <- runif(n = nrow(giardia.methylcell_ceiling_2.points)*1,
                   min = ymin,
                   max = ymax)
 giardia.random_mc2 <- data.frame('x'= x.random, 'y'= y.random)
 #control c2
 x.random <- runif(n = nrow(giardia.control_ceiling_2.points)*1,
                   min = xmin,
                   max = xmax)
 y.random <- runif(n = nrow(giardia.control_ceiling_2.points)*1,
                   min = ymin,
                   max = ymax)
 giardia.random_cc2 <- data.frame('x'= x.random, 'y'= y.random)
 #control f2
 x.random <- runif(n = nrow(giardia.control_floor_2.points)*1,
                   min = xmin,
                   max = xmax)
 y.random <- runif(n = nrow(giardia.control_floor_2.points)*1,
                   min = ymin,
                   max = ymax)
 giardia.random_cf2 <- data.frame('x'= x.random, 'y'= y.random)
 #methylcell f2
 x.random <- runif(n = nrow(giardia.control_methylcell_2.points)*1,
                   min = xmin,
                   max = xmax)
 y.random <- runif(n = nrow(giardia.control_methylcell_2.points)*1,
                   min = ymin,
                   max = ymax)
 giardia.random_mf2 <- data.frame('x'= x.random, 'y'= y.random)
 #rep3
 xmin <- as.vector(st_bbox(polygonarea3)[1])
 ymin <- as.vector(st_bbox(polygonarea3)[2])
 xmax <- as.vector(st_bbox(polygonarea3)[3])
 ymax <- as.vector(st_bbox(polygonarea3)[4])
 
 set.seed(1111)
 x.random <- runif(n = nrow(giardia.methylcell_ceiling_3.points)*1,
                   min = xmin,
                   max = xmax)
 y.random <- runif(n = nrow(giardia.methylcell_ceiling_3.points)*1,
                   min = ymin,
                   max = ymax)
 giardia.random_mc3 <- data.frame('x'= x.random, 'y'= y.random)
 #control c3
 x.random <- runif(n = nrow(giardia.control_ceiling_3.points)*1,
                   min = xmin,
                   max = xmax)
 y.random <- runif(n = nrow(giardia.control_ceiling_3.points)*1,
                   min = ymin,
                   max = ymax)
 giardia.random_cc3 <- data.frame('x'= x.random, 'y'= y.random)
 #control f3
 x.random <- runif(n = nrow(giardia.control_floor_3.points)*1,
                   min = xmin,
                   max = xmax)
 y.random <- runif(n = nrow(giardia.control_floor_3.points)*1,
                   min = ymin,
                   max = ymax)
 giardia.random_cf3 <- data.frame('x'= x.random, 'y'= y.random)
 #methylcell f3
 x.random <- runif(n = nrow(giardia.control_methylcell_3.points)*1,
                   min = xmin,
                   max = xmax)
 y.random <- runif(n = nrow(giardia.control_methylcell_3.points)*1,
                   min = ymin,
                   max = ymax)
 giardia.random_mf3 <- data.frame('x'= x.random, 'y'= y.random)
 
#Regular points
#rep1
 x.regular <- seq(from=xmin, to=xmax,
                  length.out = sqrt(nrow(giardia.methylcell_ceiling_1.points)))
 y.regular <- seq(from=ymin, to=ymax,
                  length.out=sqrt(nrow(giardia.methylcell_ceiling_1.points)))
 regular <- expand.grid(x.regular, y.regular)
 x.regular <- regular$Var1
 y.regular <- regular$Var2
 x.regular <- jitter(regular[,1], factor = 1)
 y.regular <- jitter(regular[,2], factor = 1)
 giardia.regular_mc1 <- data.frame('x' = x.regular, 'y' = y.regular)

 plot(x=giardia.regular1$x,
      y=giardia.regular1$y,
      main="Regular Points",
      xlab="x", ylab="y", cex=.5,
      asp=T)
 plot(polygonarea, add=T, border='blue', col=NA)
 #control c1
 x.regular <- seq(from=xmin, to=xmax,
                  length.out = sqrt(nrow(giardia.control_ceiling_1.points))*1)
 y.regular <- seq(from=ymin, to=ymax,
                  length.out=sqrt(nrow(giardia.control_ceiling_1.points))*1)
 regular <- expand.grid(x.regular, y.regular)
 x.regular <- regular$Var1
 y.regular <- regular$Var2
 x.regular <- jitter(regular[,1], factor = 1)
 y.regular <- jitter(regular[,2], factor = 1)
 giardia.regular_cc1 <- data.frame('x' = x.regular, 'y' = y.regular)
 #control f1
 x.regular <- seq(from=xmin, to=xmax,
                  length.out = sqrt(nrow(giardia.control_floor_1.points))*1)
 y.regular <- seq(from=ymin, to=ymax,
                  length.out=sqrt(nrow(giardia.control_floor_1.points))*1)
 regular <- expand.grid(x.regular, y.regular)
 x.regular <- regular$Var1
 y.regular <- regular$Var2
 x.regular <- jitter(regular[,1], factor = 1)
 y.regular <- jitter(regular[,2], factor = 1)
 giardia.regular_cf1 <- data.frame('x' = x.regular, 'y' = y.regular)
 #methylcell f1
 x.regular <- seq(from=xmin, to=xmax,
                  length.out = sqrt(nrow(giardia.control_methylcell_1.points))*1)
 y.regular <- seq(from=ymin, to=ymax,
                  length.out=sqrt(nrow(giardia.control_methylcell_1.points))*1)
 regular <- expand.grid(x.regular, y.regular)
 x.regular <- regular$Var1
 y.regular <- regular$Var2
 x.regular <- jitter(regular[,1], factor = 1)
 y.regular <- jitter(regular[,2], factor = 1)
 giardia.regular_mf1 <- data.frame('x' = x.regular, 'y' = y.regular)
 
 #rep2
 x.regular <- seq(from=xmin, to=xmax,
                  length.out = sqrt(nrow(giardia.methylcell_ceiling_2.points))*1)
 y.regular <- seq(from=ymin, to=ymax,
                  length.out=sqrt(nrow(giardia.methylcell_ceiling_2.points))*1)
 regular <- expand.grid(x.regular, y.regular)
 x.regular <- regular$Var1
 y.regular <- regular$Var2
 x.regular <- jitter(regular[,1], factor = 1)
 y.regular <- jitter(regular[,2], factor = 1)
 giardia.regular_mc2 <- data.frame('x' = x.regular, 'y' = y.regular)
 #control c2
 x.regular <- seq(from=xmin, to=xmax,
                  length.out = sqrt(nrow(giardia.control_ceiling_2.points))*1)
 y.regular <- seq(from=ymin, to=ymax,
                  length.out=sqrt(nrow(giardia.control_ceiling_2.points))*1)
 regular <- expand.grid(x.regular, y.regular)
 x.regular <- regular$Var1
 y.regular <- regular$Var2
 x.regular <- jitter(regular[,1], factor = 1)
 y.regular <- jitter(regular[,2], factor = 1)
 giardia.regular_cc2 <- data.frame('x' = x.regular, 'y' = y.regular)
 #control f2
 x.regular <- seq(from=xmin, to=xmax,
                  length.out = sqrt(nrow(giardia.control_floor_2.points))*1)
 y.regular <- seq(from=ymin, to=ymax,
                  length.out=sqrt(nrow(giardia.control_floor_2.points))*1)
 regular <- expand.grid(x.regular, y.regular)
 x.regular <- regular$Var1
 y.regular <- regular$Var2
 x.regular <- jitter(regular[,1], factor = 1)
 y.regular <- jitter(regular[,2], factor = 1)
 giardia.regular_cf2 <- data.frame('x' = x.regular, 'y' = y.regular)
 #methylcell f2
 x.regular <- seq(from=xmin, to=xmax,
                  length.out = sqrt(nrow(giardia.control_methylcell_2.points))*1)
 y.regular <- seq(from=ymin, to=ymax,
                  length.out=sqrt(nrow(giardia.control_methylcell_2.points))*1)
 regular <- expand.grid(x.regular, y.regular)
 x.regular <- regular$Var1
 y.regular <- regular$Var2
 x.regular <- jitter(regular[,1], factor = 1)
 y.regular <- jitter(regular[,2], factor = 1)
 giardia.regular_mf2 <- data.frame('x' = x.regular, 'y' = y.regular)
 #rep3
 x.regular <- seq(from=xmin, to=xmax,
                  length.out = sqrt(nrow(giardia.methylcell_ceiling_3.points))*1)
 y.regular <- seq(from=ymin, to=ymax,
                  length.out=sqrt(nrow(giardia.methylcell_ceiling_3.points))*1)
 regular <- expand.grid(x.regular, y.regular)
 x.regular <- regular$Var1
 y.regular <- regular$Var2
 x.regular <- jitter(regular[,1], factor = 1)
 y.regular <- jitter(regular[,2], factor = 1)
 giardia.regular_mc3 <- data.frame('x' = x.regular, 'y' = y.regular)
 #control c3
 x.regular <- seq(from=xmin, to=xmax,
                  length.out = sqrt(nrow(giardia.control_ceiling_3.points))*1)
 y.regular <- seq(from=ymin, to=ymax,
                  length.out=sqrt(nrow(giardia.control_ceiling_3.points))*1)
 regular <- expand.grid(x.regular, y.regular)
 x.regular <- regular$Var1
 y.regular <- regular$Var2
 x.regular <- jitter(regular[,1], factor = 1)
 y.regular <- jitter(regular[,2], factor = 1)
 giardia.regular_cc3 <- data.frame('x' = x.regular, 'y' = y.regular)
 #control f3
 x.regular <- seq(from=xmin, to=xmax,
                  length.out = sqrt(nrow(giardia.control_floor_3.points))*1)
 y.regular <- seq(from=ymin, to=ymax,
                  length.out=sqrt(nrow(giardia.control_floor_3.points))*1)
 regular <- expand.grid(x.regular, y.regular)
 x.regular <- regular$Var1
 y.regular <- regular$Var2
 x.regular <- jitter(regular[,1], factor = 1)
 y.regular <- jitter(regular[,2], factor = 1)
 giardia.regular_cf3 <- data.frame('x' = x.regular, 'y' = y.regular)
 #methylcell f3
 x.regular <- seq(from=xmin, to=xmax,
                  length.out = sqrt(nrow(giardia.control_methylcell_3.points))*1)
 y.regular <- seq(from=ymin, to=ymax,
                  length.out=sqrt(nrow(giardia.control_methylcell_3.points))*1)
 regular <- expand.grid(x.regular, y.regular)
 x.regular <- regular$Var1
 y.regular <- regular$Var2
 x.regular <- jitter(regular[,1], factor = 1)
 y.regular <- jitter(regular[,2], factor = 1)
 giardia.regular_mf3 <- data.frame('x' = x.regular, 'y' = y.regular)


#Creating spatstat objects
 library(spatstat)
 library(maptools)

#Coordinate units
 coordinate.units <- c("um", "ums")

#Window
 class(polygonarea)
 spg <- as(polygonarea, 'Spatial')
 #class(as(as(polygonarea, 'Spatial'), 'owin'))
 #win <- as(as(polygonarea, 'Spatial'), 'owin')
 #win
 library(polyCub)
 win1 <- as.owin.SpatialPolygons(spg)
 win1
 
 class(polygonarea2)
 spg <- as(polygonarea2, 'Spatial')
 win2 <- as.owin.SpatialPolygons(spg)
 win2
 
 class(polygonarea3)
 spg <- as(polygonarea3, 'Spatial')
 win3 <- as.owin.SpatialPolygons(spg)
 win3

# #Construct ppp object
 class(giardia.control_ceiling_1.points)
 class(giardia.control_floor_1.points)
 class(giardia.methylcell_ceiling_1.points)
 class(giardia.control_methylcell_1.points)
 
 
 class(giardia.control_ceiling_2.points)
 class(giardia.control_floor_2.points)
 class(giardia.methylcell_ceiling_2.points)
 class(giardia.control_methylcell_2.points)
 
 class(giardia.control_ceiling_3.points)
 class(giardia.control_floor_3.points)
 class(giardia.methylcell_ceiling_3.points)
 class(giardia.control_methylcell_3.points)
 
 class(giardia.random_cc1)
 class(giardia.random_cf1)
 class(giardia.random_mc1)
 class(giardia.random_mf1)
 class(giardia.regular_cc1)
 class(giardia.regular_cf1)
 class(giardia.regular_mc1)
 class(giardia.regular_mf1)
 class(giardia.random_cc2)
 class(giardia.random_cf2)
 class(giardia.random_mc2)
 class(giardia.random_mf2)
 class(giardia.regular_cc2)
 class(giardia.regular_cf2)
 class(giardia.regular_mc2)
 class(giardia.regular_mf2)
 class(giardia.random_cc3)
 class(giardia.random_cf3)
 class(giardia.random_mc3)
 class(giardia.random_mf3)
 class(giardia.regular_cc3)
 class(giardia.regular_cf3)
 class(giardia.regular_mc3)
 class(giardia.regular_mf3)
 
 ppp.conrol_ceiling_1 <- ppp(x = st_coordinates(giardia.control_ceiling_1.points)[,1],
                               y = st_coordinates(giardia.control_ceiling_1.points)[,2],
                               window = win)
 unitname(ppp.conrol_ceiling_1) <- coordinate.units
 
 
 ppp.conrol_floor_1 <- ppp(x = st_coordinates(giardia.control_floor_1.points)[,1],
                             y = st_coordinates(giardia.control_floor_1.points)[,2],
                             window = win)
 unitname(ppp.conrol_floor_1) <- coordinate.units
 
 
 ppp.methylcell_ceiling_1 <- ppp(x = st_coordinates(giardia.methylcell_ceiling_1.points)[,1],
                                       y = st_coordinates(giardia.methylcell_ceiling_1.points)[,2],
                                       window = win)
 unitname(ppp.methylcell_ceiling_1) <- coordinate.units
 
 
 ppp.methylcell_floor_1 <- ppp(x = st_coordinates(giardia.control_methylcell_1.points)[,1],
                                     y = st_coordinates(giardia.control_methylcell_1.points)[,2],
                                     window = win)
 unitname(ppp.methylcell_floor_1) <- coordinate.units
 #Rep2
 ppp.conrol_ceiling_2 <- ppp(x = st_coordinates(giardia.control_ceiling_2.points)[,1],
                             y = st_coordinates(giardia.control_ceiling_2.points)[,2],
                             window = win)
 unitname(ppp.conrol_ceiling_2) <- coordinate.units
 
 
 ppp.conrol_floor_2 <- ppp(x = st_coordinates(giardia.control_floor_2.points)[,1],
                           y = st_coordinates(giardia.control_floor_2.points)[,2],
                           window = win)
 unitname(ppp.conrol_floor_2) <- coordinate.units
 
 
 ppp.methylcell_ceiling_2 <- ppp(x = st_coordinates(giardia.methylcell_ceiling_2.points)[,1],
                                 y = st_coordinates(giardia.methylcell_ceiling_2.points)[,2],
                                 window = win)
 unitname(ppp.methylcell_ceiling_2) <- coordinate.units
 
 
 ppp.methylcell_floor_2 <- ppp(x = st_coordinates(giardia.control_methylcell_2.points)[,1],
                               y = st_coordinates(giardia.control_methylcell_2.points)[,2],
                               window = win)
 unitname(ppp.methylcell_floor_2) <- coordinate.units
 #Rep3
 ppp.conrol_ceiling_3 <- ppp(x = st_coordinates(giardia.control_ceiling_3.points)[,1],
                             y = st_coordinates(giardia.control_ceiling_3.points)[,2],
                             window = win)
 unitname(ppp.conrol_ceiling_3) <- coordinate.units
 
 
 ppp.conrol_floor_3 <- ppp(x = st_coordinates(giardia.control_floor_3.points)[,1],
                           y = st_coordinates(giardia.control_floor_3.points)[,2],
                           window = win)
 unitname(ppp.conrol_floor_3) <- coordinate.units
 
 
 ppp.methylcell_ceiling_3 <- ppp(x = st_coordinates(giardia.methylcell_ceiling_3.points)[,1],
                                 y = st_coordinates(giardia.methylcell_ceiling_3.points)[,2],
                                 window = win)
 unitname(ppp.methylcell_ceiling_3) <- coordinate.units
 
 
 ppp.methylcell_floor_3 <- ppp(x = st_coordinates(giardia.control_methylcell_3.points)[,1],
                               y = st_coordinates(giardia.control_methylcell_3.points)[,2],
                               window = win)
 unitname(ppp.methylcell_floor_3) <- coordinate.units
 
 #random1
 ppp.random_cc1 <- ppp(x = giardia.random_cc1$x,
                   y = giardia.random_cc1$y,
                   window = win1)
 unitname(ppp.random_cc1) <- coordinate.units
 ppp.random_cc1 <- as.ppp(ppp.random_cc1)
 plot(ppp.random_cc1)
 
 ppp.random_cf1 <- ppp(x = giardia.random_cf1$x,
                       y = giardia.random_cf1$y,
                       window = win1)
 unitname(ppp.random_cf1) <- coordinate.units
 ppp.random_cf1 <- as.ppp(ppp.random_cf1)

 ppp.random_mf1 <- ppp(x = giardia.random_mf1$x,
                       y = giardia.random_mf1$y,
                       window = win1)
 unitname(ppp.random_mf1) <- coordinate.units
 ppp.random_mf1 <- as.ppp(ppp.random_mf1)
 
 ppp.random_mc1 <- ppp(x = giardia.random_cf1$x,
                       y = giardia.random_cf1$y,
                       window = win1)
 unitname(ppp.random_cf1) <- coordinate.units
 ppp.random_mc1 <- as.ppp(ppp.random_cf1)
 
 #ramdom 2
 ppp.random_cc2 <- ppp(x = giardia.random_cc2$x,
                    y = giardia.random_cc2$y,
                    window = win2)
 unitname(ppp.random_cc2) <- coordinate.units
 ppp.random_cc2 <- as.ppp(ppp.random_cc2)
 plot(ppp.random_cc2)
 
 ppp.random_cf2 <- ppp(x = giardia.random_cf2$x,
                       y = giardia.random_cf2$y,
                       window = win2)
 unitname(ppp.random_cf2) <- coordinate.units
 ppp.random_cf2 <- as.ppp(ppp.random_cf2)
 
 ppp.random_mf2 <- ppp(x = giardia.random_mf2$x,
                       y = giardia.random_mf2$y,
                       window = win2)
 unitname(ppp.random_mf2) <- coordinate.units
 ppp.random_mf2 <- as.ppp(ppp.random_mf2)
 
 ppp.random_mc2 <- ppp(x = giardia.random_mc2$x,
                       y = giardia.random_mc2$y,
                       window = win2)
 unitname(ppp.random_cf2) <- coordinate.units
 ppp.random_mc2 <- as.ppp(ppp.random_mc2)
 #ramdom 3
 ppp.random_cc3 <- ppp(x = giardia.random_cc3$x,
                    y = giardia.random_cc3$y,
                    window = win3)
 unitname(ppp.random_cc3) <- coordinate.units
 ppp.random_cc3 <- as.ppp(ppp.random_cc3)
 plot(ppp.random_cc3)
 
 ppp.random_cf3 <- ppp(x = giardia.random_cf3$x,
                       y = giardia.random_cf3$y,
                       window = win3)
 unitname(ppp.random_cf3) <- coordinate.units
 ppp.random_cf3 <- as.ppp(ppp.random_cf3)
 
 ppp.random_mf3 <- ppp(x = giardia.random_mf1$x,
                       y = giardia.random_mf1$y,
                       window = win3)
 unitname(ppp.random_mf3) <- coordinate.units
 ppp.random_mf3 <- as.ppp(ppp.random_mf3)
 
 ppp.random_mc3 <- ppp(x = giardia.random_mc3$x,
                       y = giardia.random_mc3$y,
                       window = win3)
 unitname(ppp.random_cf3) <- coordinate.units
 ppp.random_mc3 <- as.ppp(ppp.random_mc3)
#regular 1
 ppp.regular_cc1 <- ppp(x = giardia.regular_cc1$x,
                    y = giardia.regular_cc1$y,
                    window = win1)
 unitname(ppp.regular_cc1) <- coordinate.units
 ppp.regular_cc1 <- as.ppp(ppp.regular_cc1)
 plot(ppp.regular_cc1)
 
 ppp.regular_cf1 <- ppp(x = giardia.regular_cf1$x,
                       y = giardia.regular_cf1$y,
                       window = win1)
 unitname(ppp.regular_cf1) <- coordinate.units
 ppp.regular_cf1 <- as.ppp(ppp.regular_cf1)
 
 ppp.regular_mf1 <- ppp(x = giardia.regular_mf1$x,
                       y = giardia.regular_mf1$y,
                       window = win1)
 unitname(ppp.regular_mf1) <- coordinate.units
 ppp.regular_mf1 <- as.ppp(ppp.regular_mf1)
 
 ppp.regular_mc1 <- ppp(x = giardia.regular_mc1$x,
                       y = giardia.regular_mc1$y,
                       window = win1)
 unitname(ppp.regular_mc1) <- coordinate.units
 ppp.regular_mc1 <- as.ppp(ppp.regular_mc1)
 
 #regular 2
 ppp.regular_cc2 <- ppp(x = giardia.regular_cc2$x,
                       y = giardia.regular_cc2$y,
                       window = win2)
 unitname(ppp.regular_cc2) <- coordinate.units
 ppp.regular_cc2 <- as.ppp(ppp.regular_cc2)
 plot(ppp.regular_cc2)
 
 ppp.regular_cf2 <- ppp(x = giardia.regular_cf2$x,
                       y = giardia.regular_cf2$y,
                       window = win2)
 unitname(ppp.regular_cf2) <- coordinate.units
 ppp.regular_cf2 <- as.ppp(ppp.regular_cf2)
 
 ppp.regular_mf2 <- ppp(x = giardia.regular_mf2$x,
                       y = giardia.regular_mf2$y,
                       window = win2)
 unitname(ppp.regular_mf2) <- coordinate.units
 ppp.regular_mf2 <- as.ppp(ppp.regular_mf2)
 
 ppp.regular_mc2 <- ppp(x = giardia.regular_mc2$x,
                       y = giardia.regular_mc2$y,
                       window = win2)
 unitname(ppp.regular_mc2) <- coordinate.units
 ppp.random_mc2 <- as.ppp(ppp.random_mc2)
 #regular 3
 ppp.regular_cc3 <- ppp(x = giardia.regular_cc3$x,
                       y = giardia.regular_cc3$y,
                       window = win3)
 unitname(ppp.regular_cc3) <- coordinate.units
 ppp.regular_cc3 <- as.ppp(ppp.regular_cc3)
 plot(ppp.regular_cc3)
 
 ppp.regular_cf3 <- ppp(x = giardia.regular_cf3$x,
                       y = giardia.regular_cf3$y,
                       window = win3)
 unitname(ppp.regular_cf3) <- coordinate.units
 ppp.regular_cf3 <- as.ppp(ppp.regular_cf3)
 
 ppp.regular_mf3 <- ppp(x = giardia.regular_mf1$x,
                       y = giardia.regular_mf1$y,
                       window = win3)
 unitname(ppp.regular_mf3) <- coordinate.units
 ppp.regular_mf3 <- as.ppp(ppp.regular_mf3)
 
 ppp.regular_mc3 <- ppp(x = giardia.regular_mc3$x,
                       y = giardia.regular_mc3$y,
                       window = win3)
 unitname(ppp.regular_mc3) <- coordinate.units
 ppp.regular_mc3 <- as.ppp(ppp.regular_mc3)

#Interactions in Point Pattern Analysis
library(rasterVis)

 par(mar=c(1,1,1,1), mfrow=c(4,3))
 fryplot(ppp.random_cc1, main='independant', pch=16, cex=0.2)
 fryplot(ppp.regular_cc1, main='regular', pch=16, cex=0.2)
 fryplot(ppp.conrol_ceiling_1, main='control ceiling rep1', pch=16, cex=0.2)
 
 fryplot(ppp.random_cf1, main='independant', pch=16, cex=0.2)
 fryplot(ppp.regular_cf1, main='regular', pch=16, cex=0.2)
 fryplot(ppp.conrol_floor_1, main='control floor rep1', pch=16, cex=0.2)
 
 fryplot(ppp.random_mc1, main='independant', pch=16, cex=0.2)
 fryplot(ppp.regular_mc1, main='regular', pch=16, cex=0.2)
 fryplot(ppp.methylcell_ceiling_1, main='methylcell ceiling rep1', pch=16, cex=0.2)
 
 fryplot(ppp.random_mf1, main='independant', pch=16, cex=0.2)
 fryplot(ppp.regular_mf1, main='regular', pch=16, cex=0.2)
 fryplot(ppp.methylcell_floor_1, main='methylcell floor rep1', pch=16, cex=0.2)
 ####All point graphs#####
 pdf(file = "/Users/apple/Documents/R workshop 2017/project pattern/analysis/output/random_regular_points.pdf", 
     height = 8, width = 20)
 par(mfrow=c(4,3), mar=c(1, 1, 1, 1))
 plot(ppp.conrol_ceiling_1)
 plot(ppp.random_cc1)
 plot(ppp.regular_cc1)
 plot(ppp.conrol_floor_1)
 plot(ppp.random_cf1)
 plot(ppp.regular_cf1)
 plot(ppp.methylcell_ceiling_1)
 plot(ppp.random_mc1)
 plot(ppp.regular_mc1)
 plot(ppp.methylcell_floor_1)
 plot(ppp.random_mf1)
 plot(ppp.regular_mf1)
 
 plot(ppp.conrol_ceiling_2)
 plot(ppp.random_cc2)
 plot(ppp.regular_cc2)
 plot(ppp.conrol_floor_2)
 plot(ppp.random_cf2)
 plot(ppp.regular_cf2)
 plot(ppp.methylcell_ceiling_2)
 plot(ppp.random_mc2)
 plot(ppp.regular_mc2)
 plot(ppp.methylcell_floor_2)
 plot(ppp.random_mf2)
 plot(ppp.regular_mf2)
 
 plot(ppp.conrol_ceiling_3)
 plot(ppp.random_cc3)
 plot(ppp.regular_cc3)
 plot(ppp.conrol_floor_3)
 plot(ppp.random_cf3)
 plot(ppp.regular_cf3)
 plot(ppp.methylcell_ceiling_3)
 plot(ppp.random_mc3)
 plot(ppp.regular_mc3)
 plot(ppp.methylcell_floor_3)
 plot(ppp.random_mf3)
 plot(ppp.regular_mf3)
 dev.off()
 
######Nearest Neighbor Plots####
 pdf(file = "/Users/apple/Documents/R workshop 2017/project pattern/analysis/output/nndistPlots.pdf", 
     height = 8, width = 20)
 par(mar=c(1,1,1,1), mfrow=c(4,3), oma=c(0,0,2,0))
 plot(nndist(ppp.random_cc1), main='independant', pch=16, cex=0.8)
 plot(nndist(ppp.regular_cc1), main='regular', pch=16, cex=0.8)
 plot(nndist(ppp.conrol_ceiling_1), main='control ceiling rep1', pch=16, cex=0.8)
 plot(nndist(ppp.random_cf1), main='independant', pch=16, cex=0.8)
 plot(nndist(ppp.regular_cf1), main='regular', pch=16, cex=0.8)
 plot(nndist(ppp.conrol_floor_1), main='control floor rep1', pch=16, cex=0.8)
 plot(nndist(ppp.random_mc1), main='independant', pch=16, cex=0.8)
 plot(nndist(ppp.regular_mc1), main='regular', pch=16, cex=0.8)
 plot(nndist(ppp.methylcell_ceiling_1), main='methylcell ceiling rep1', pch=16, cex=0.8)
 plot(nndist(ppp.random_mf1), main='independant', pch=16, cex=0.8)
 plot(nndist(ppp.regular_mf1), main='regular', pch=16, cex=0.8)
 plot(nndist(ppp.methylcell_floor_1), main='methylcell floor rep1', pch=16, cex=0.8)
 
 plot(nndist(ppp.random_cc2), main='independant', pch=16, cex=0.8)
 plot(nndist(ppp.regular_cc2), main='regular', pch=16, cex=0.8)
 plot(nndist(ppp.conrol_ceiling_2), main='control ceiling rep1', pch=16, cex=0.8)
 plot(nndist(ppp.random_cf2), main='independant', pch=16, cex=0.8)
 plot(nndist(ppp.regular_cf2), main='regular', pch=16, cex=0.8)
 plot(nndist(ppp.conrol_floor_2), main='control floor rep1', pch=16, cex=0.8)
 plot(nndist(ppp.random_mc2), main='independant', pch=16, cex=0.8)
 plot(nndist(ppp.regular_mc2), main='regular', pch=16, cex=0.8)
 plot(nndist(ppp.methylcell_ceiling_2), main='methylcell ceiling rep1', pch=16, cex=0.8)
 plot(nndist(ppp.random_mf2), main='independant', pch=16, cex=0.8)
 plot(nndist(ppp.regular_mf2), main='regular', pch=16, cex=0.8)
 plot(nndist(ppp.methylcell_floor_2), main='methylcell floor rep1', pch=16, cex=0.8)
 
 plot(nndist(ppp.random_cc3), main='independant', pch=16, cex=0.8)
 plot(nndist(ppp.regular_cc3), main='regular', pch=16, cex=0.8)
 plot(nndist(ppp.conrol_ceiling_3), main='control ceiling rep1', pch=16, cex=0.8)
 plot(nndist(ppp.random_cf3), main='independant', pch=16, cex=0.8)
 plot(nndist(ppp.regular_cf3), main='regular', pch=16, cex=0.8)
 plot(nndist(ppp.conrol_floor_3), main='control floor rep1', pch=16, cex=0.8)
 plot(nndist(ppp.random_mc3), main='independant', pch=16, cex=0.8)
 plot(nndist(ppp.regular_mc3), main='regular', pch=16, cex=0.8)
 plot(nndist(ppp.methylcell_ceiling_3), main='methylcell ceiling rep1', pch=16, cex=0.8)
 plot(nndist(ppp.random_mf3), main='independant', pch=16, cex=0.8)
 plot(nndist(ppp.regular_mf3), main='regular', pch=16, cex=0.8)
 plot(nndist(ppp.methylcell_floor_3), main='methylcell floor rep1', pch=16, cex=0.8)
 dev.off()
 
 #########make quadrant counts plots for 48h points#############################
 ###############make quadrant tests##################
 pdf(file = "/Users/apple/Documents/R workshop 2017/project pattern/analysis/output/quarants.pdf", 
     height = 8, width = 20)
 par(mar=c(1,1,1,1), mfrow=c(2,2), oma=c(0,0,2,0))
 
 qc.conrol_ceiling_1 <- quadratcount(ppp.conrol_ceiling_1, nx=4, ny=2)
 plot(ppp.conrol_ceiling_1, pch=3, cex=0.6)
 plot(qc.conrol_ceiling_1, add=T, textargs=list(col="purple"))
 quadrat.test(qc.conrol_ceiling_1)
 qc.methylcell_ceiling_1 <- quadratcount(ppp.methylcell_ceiling_1, nx=4, ny=2)
 plot(ppp.methylcell_ceiling_1, pch=3, cex=0.6)
 plot(qc.methylcell_ceiling_1, add=T, textargs=list(col="purple"))
 quadrat.test(qc.methylcell_ceiling_1)
 qc.conrol_floor_1 <- quadratcount(ppp.conrol_floor_1, nx=4, ny=2)
 plot(ppp.conrol_floor_1, pch=3, cex=0.6)
 plot(qc.conrol_floor_1, add=T, textargs=list(col="purple"))
 quadrat.test(qc.conrol_floor_1)
 qc.methylcell_floor_1 <- quadratcount(ppp.methylcell_floor_1, nx=4, ny=2)
 plot(ppp.methylcell_floor_1, pch=3, cex=0.6)
 plot(qc.methylcell_floor_1, add=T, textargs=list(col="purple"))
 quadrat.test(qc.methylcell_floor_1)
 
 qc.conrol_ceiling_2 <- quadratcount(ppp.conrol_ceiling_2, nx=4, ny=2)
 plot(ppp.conrol_ceiling_2, pch=3, cex=0.6)
 plot(qc.conrol_ceiling_2, add=T, textargs=list(col="purple"))
 quadrat.test(qc.conrol_ceiling_2)
 qc.methylcell_ceiling_2 <- quadratcount(ppp.methylcell_ceiling_2, nx=4, ny=2)
 plot(ppp.methylcell_ceiling_2, pch=3, cex=0.6)
 plot(qc.methylcell_ceiling_2, add=T, textargs=list(col="purple"))
 quadrat.test(qc.methylcell_ceiling_2)
 qc.conrol_floor_2 <- quadratcount(ppp.conrol_floor_2, nx=4, ny=2)
 plot(ppp.conrol_floor_2, pch=3, cex=0.6)
 plot(qc.conrol_floor_2, add=T, textargs=list(col="purple"))
 quadrat.test(qc.conrol_floor_2)
 qc.methylcell_floor_2 <- quadratcount(ppp.methylcell_floor_2, nx=4, ny=2)
 plot(ppp.methylcell_floor_2, pch=3, cex=0.6)
 plot(qc.methylcell_floor_2, add=T, textargs=list(col="purple"))
 quadrat.test(qc.methylcell_floor_2)
 
 qc.conrol_ceiling_3 <- quadratcount(ppp.conrol_ceiling_3, nx=4, ny=2)
 plot(ppp.conrol_ceiling_3, pch=3, cex=0.6)
 plot(qc.conrol_ceiling_3, add=T, textargs=list(col="purple"))
 quadrat.test(qc.conrol_ceiling_3)
 qc.methylcell_ceiling_3 <- quadratcount(ppp.methylcell_ceiling_3, nx=4, ny=2)
 plot(ppp.methylcell_ceiling_3, pch=3, cex=0.6)
 plot(qc.methylcell_ceiling_3, add=T, textargs=list(col="purple"))
 quadrat.test(qc.methylcell_ceiling_3)
 qc.conrol_floor_3 <- quadratcount(ppp.conrol_floor_3, nx=4, ny=2)
 plot(ppp.conrol_floor_3, pch=3, cex=0.6)
 plot(qc.conrol_floor_3, add=T, textargs=list(col="purple"))
 quadrat.test(qc.conrol_floor_3)
 qc.methylcell_floor_3 <- quadratcount(ppp.methylcell_floor_3, nx=4, ny=2)
 plot(ppp.methylcell_floor_3, pch=3, cex=0.6)
 plot(qc.methylcell_floor_3, add=T, textargs=list(col="purple"))
 quadrat.test(qc.methylcell_floor_3)
 
 dev.off()
 
 ######All Stats Plots#######
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
#The empty space function F
#G function: Nearest neighbor distances
#Pairwise distances - The K function
#L function: transforms the Poisson K functon to the straight line Lpois(r)=r
# The pair correlation function: g(r)=K'(r)/2pi()r - probability of observing a pair points seperated by r, divided by a Poisson probability.
#J function: combination of F and G. 
plot(allstats(ppp.random), main='artificial random')
plot(allstats(ppp.methlcell), main='giardia methlcell')
plot(allstats(ppp.conrol), main='giardia control')
plot(allstats(ppp.regular), main='artificial regular')