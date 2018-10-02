library(mapproj)
library(ggmap)
library(gdata)
library(ggplot2)
library(data.table)

path_csv <- "/Users/peterliang/Documents/GitHub/CSX4001/week_3/hw_3/資料集/"
files <- list.files(path = path_csv, pattern = "*.csv", recursive = TRUE)

temp <- vector("list", length(1))
for (i in seq_along(files)){
  temp[[i]] <- fread(files [i])
}

temp

DF <- rbindlist(temp)
my.data <- setDF(DF)

#刪除不正確資料

fix.data <- my.data[-866,]
fix.data <- fix.data[-284,]

# write.csv(data , file = "can_in_Taipei.csv")
# my.data = read.csv("中山區垃圾桶分佈.csv", fileEncoding = "utf-8")
# my.data

my.plot <- ggplot(fix.data, aes(經度, 緯度, colour = 行政區))
my.plot <- my.plot + layer(
  geom = "point",
  stat = "identity",
  position = "identity",
  params = list(na.rm = FALSE)
)
my.plot
