# 匯入相關 library
library(mapproj)
library(ggmap)
library(gdata)
library(ggplot2)
library(data.table)

# 設定讀取資料路徑 & 讀取各 csv 檔並存在 files 中

path_csv <- "/Users/peterliang/Documents/GitHub/CSX4001/week_3/hw_3"
files <- list.files(path = path_csv, pattern = "*.csv", recursive = TRUE)

files

# 利用 fread 讀取各區垃圾桶.csv 中資料，並存取於 temp vector 中

temp <- vector("list", length(1))
for (i in seq_along(files)){
  temp[[i]] <- fread(files [i])
}

temp

# 將 temp 利用 rbindlist 串接，並存成 data.frame
DF <- rbindlist(temp)
my.data <- setDF(DF)

## 另類方法，但不適用，尚未找到 bug
# write.csv(data , file = "can_in_Taipei.csv")
# my.data = read.csv("中山區垃圾桶分佈.csv", fileEncoding = "utf-8")
# my.data

#刪除不正確資料（緯度相差過高）（可能為手誤）

fix.data <- my.data[-655,]
fix.data <- fix.data[-1749,]

# 做散佈圖
my.plot <- ggplot(fix.data, aes(經度, 緯度, colour = 行政區))
my.plot <- my.plot + layer(
  geom = "point",
  stat = "identity",
  position = "identity",
  params = list(na.rm = FALSE)
)
my.plot

# 串接 ggmap
