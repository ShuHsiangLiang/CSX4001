rm(list = ls())
library(rvest)

url <- "https://www.ptt.cc/bbs/NBA/index5720.html"

res <- read_html(url)

raw.titles <- res %>% html_nodes("div.title")

nba.article.link <- raw.titles %>% html_node("a") %>% html_attr('href')

nba.article.title <- raw.titles %>% html_text()

nba.df <- data.frame(nba.article.title, nba.article.link)

nba.df.col.names <- c("title", "link")
colnames(nba.df) <- nba.df.col.names

nba.df



