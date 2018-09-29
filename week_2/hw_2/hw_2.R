library(rvest)
library(httr)
library(tmcn)

url <- read_html("http://tw.op.gg/statistics/ajax2/champion/", encoding = 'utf-8')

champion <- html_nodes(url, ".ChampionName") %>% html_text(trim = T)
rate <- html_nodes(url, ".ChampionName+ .Cell .Value") %>% html_text(trim = T)
KDA <- html_nodes(url, ".Ratio") %>% html_text(trim = T)
Gold <- html_nodes(url, ".KDARatio~ .Cell+ .Cell") %>% html_text(trim = T)
CS <- html_nodes(url, ".KDARatio+ .Cell") %>% html_text(trim = T)

champion.time <- Sys.time() %>% format('%a %b %d %X %Y')

data <- data.frame(英雄 = champion,勝率 = rate, KDA率 = KDA, CS數 = CS, 金錢 = Gold, 日期 = champion.time)

data

write.table(data, file = "LoL 各英雄出場調查（台灣）", sep = "  ")
