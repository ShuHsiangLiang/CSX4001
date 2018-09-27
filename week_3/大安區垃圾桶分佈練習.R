library(mapproj)
library(ggmap)
library(gdata)
library(ggplot2)
citation('ggmap')

help(read.csv)
my.data = read.csv("大安區垃圾桶.csv")
my.data

my.plot <- ggplot(my.data, aes(經度, 緯度, colour = 分隊別))
my.plot <- my.plot + layer(
  geom = "point",
  stat = "identity",
  position = "identity",
  params = list(na.rm = FALSE)
)
my.plot

TaipeiMap <- get_googlemap(
  center  = c(lon=121.50,lat=25.06), 
  zoom = 11, maptype = 'roadmap'
)
TaipeiMap
