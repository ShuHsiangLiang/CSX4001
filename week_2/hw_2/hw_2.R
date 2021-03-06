library(rvest)
library(httr)
library(tmcn)

#找到目標 url

url.tw <- read_html("http://tw.op.gg/statistics/ajax2/champion/")

#利用 CSS selectors 切割出所需資料

champion.tw <- html_nodes(url.tw, ".ChampionName") %>% html_text(trim = T)
rate.tw <- html_nodes(url.tw, ".ChampionName+ .Cell .Value") %>% html_text(trim = T)
KDA.tw <- html_nodes(url.tw, ".Ratio") %>% html_text(trim = T)
Gold.tw <- html_nodes(url.tw, ".KDARatio~ .Cell+ .Cell") %>% html_text(trim = T)
CS.tw <- html_nodes(url.tw, ".KDARatio+ .Cell") %>% html_text(trim = T)

# 記錄索取資料時間

champion.time <- Sys.time() %>% format('%a %b %d %X %Y')

#匯出成表格

data.tw <- data.frame(英雄 = champion.tw,勝率 = rate.tw, KDA率 = KDA.tw, CS數 = CS.tw, 金錢 = Gold.tw, 日期 = champion.time)

data.tw

#寫出 csv 檔紀錄

write.table(data.tw, file = "LoL 各英雄出場調查（台灣）_2", sep = "  ")

#找尋到韓國伺服器重新做一次

url.kr <- read_html("http://www.op.gg/statistics/ajax2/champion/", encoding = 'utf-8')

champion.kr <- html_nodes(url.kr, ".ChampionName") %>% html_text(trim = T)
rate.kr <- html_nodes(url.kr, ".ChampionName+ .Cell .Value") %>% html_text(trim = T)
KDA.kr <- html_nodes(url.kr, ".Ratio") %>% html_text(trim = T)
Gold.kr <- html_nodes(url.kr, ".KDARatio~ .Cell+ .Cell") %>% html_text(trim = T)
CS.kr <- html_nodes(url.kr, ".KDARatio+ .Cell") %>% html_text(trim = T)

data.kr <- data.frame(英雄 = champion.kr,勝率 = rate.kr, KDA率 = KDA.kr, CS數 = CS.kr, 金錢 = Gold.kr, 日期 = champion.time)

#寫出 csv 檔紀錄
data.kr

write.table(data.kr, file = "LoL 各英雄出場調查（韓國）_2", sep = "  ")

